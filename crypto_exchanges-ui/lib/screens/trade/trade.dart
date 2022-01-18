import 'package:flutter/material.dart';
class Trade extends StatefulWidget {
  const Trade({Key? key}) : super(key: key);

  @override
  _TradeState createState() => _TradeState();
}

class _TradeState extends State<Trade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('trade'),
    );
  }
}

