import 'dart:convert';

import 'package:crypto_exchanges/components/my_candlesticks.dart';
import 'package:crypto_exchanges/model/candle.dart';
import 'package:crypto_exchanges/repository.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  List<Candle> candles = [];
  String interval = "1m";
  WebSocketChannel? _channel;

  void binanceFetch(String interval) {
    fetchCandles(symbol: "BNBUSDT", interval: interval).then(
          (value) => setState(
            () {
          interval = interval;
          candles = value;
        },
      ),
    );
    if (_channel != null) _channel!.sink.close();
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws'),
    );
    _channel!.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": ["bnbusdt@kline_" + interval],
          "id": 1
        },
      ),
    );
  }

  void updateCandlesFromSnapshot(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.data != null) {
      final data = jsonDecode(snapshot.data as String) as Map<String, dynamic>;
      print(data);
      if (data.containsKey("k") == true &&
          candles[0].date.millisecondsSinceEpoch == data["k"]["t"]) {
        candles[0] = Candle(
            date: candles[0].date,
            high: double.parse(data["k"]["h"]),
            low: double.parse(data["k"]["l"]),
            open: double.parse(data["k"]["o"]),
            close: double.parse(data["k"]["c"]),
            volume: double.parse(data["k"]["v"]));
      } else if (data.containsKey("k") == true &&
          data["k"]["t"] - candles[0].date.millisecondsSinceEpoch ==
              candles[0].date.millisecondsSinceEpoch -
                  candles[1].date.millisecondsSinceEpoch) {
        candles.insert(
            0,
            Candle(
                date: DateTime.fromMillisecondsSinceEpoch(data["k"]["t"]),
                high: double.parse(data["k"]["h"]),
                low: double.parse(data["k"]["l"]),
                open: double.parse(data["k"]["o"]),
                close: double.parse(data["k"]["c"]),
                volume: double.parse(data["k"]["v"])));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    binanceFetch("15m");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.only(
            right: 0, left: 0, top: 0, bottom: 12),
        child: StreamBuilder(
          stream: _channel == null ? null : _channel!.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            updateCandlesFromSnapshot(snapshot);
            return MyCandlesticks(
              onIntervalChange: (String value) async {
                binanceFetch(value);
              },
              candles: candles,
              interval: interval,
            );
          },
        ),
      ),
    );
  }

}
