import 'package:crypto_exchanges/screens/coin_detail/coin_detail.dart';
import 'package:flutter/material.dart';

class CoinCard extends StatefulWidget {
  String symbol;
  double lastPrice;
  double change;

  CoinCard(
      {required this.symbol, required this.lastPrice, required this.change});

  @override
  _CoinCardState createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CoinDetail.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: Row(
          children: [
            Text('${widget.symbol}'),
            Spacer(
              flex: 2,
            ),
            Container(
              width: 120,
              child: Text(
                '${widget.lastPrice}',
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 35,
            ),
            Container(
                height: 25,
                width: 60,
                decoration: BoxDecoration(
                    color: widget.change < 0 ? Colors.red : Colors.green,
                    borderRadius: BorderRadius.circular(3)),
                child: Center(
                    child: Text(
                  '${widget.change}%',
                  textAlign: TextAlign.center,
                ))),
          ],
        ),
      ),
    );
  }
}
