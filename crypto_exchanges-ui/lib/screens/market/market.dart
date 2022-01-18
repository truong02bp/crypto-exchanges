import 'package:crypto_exchanges/screens/coin_detail/coin_detail.dart';
import 'package:flutter/material.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);

  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {
            Navigator.pushNamed(context, CoinDetail.routeName);
        },
        child: Text('Click here'),
      ),
    );
  }
}
