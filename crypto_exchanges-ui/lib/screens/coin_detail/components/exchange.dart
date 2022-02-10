import 'package:flutter/material.dart';

class Exchange extends StatefulWidget {
  const Exchange({Key? key}) : super(key: key);

  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Order book',
                    style: TextStyle(fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Market trades',
                    style: TextStyle(fontSize: 18),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Info',
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Text('Bid'),
                flex: 2,
                fit: FlexFit.tight,
              ),
              Flexible(
                child: Text('Ask'),
                flex: 1,
                fit: FlexFit.tight,
              ),
              // Flexible(
              //   child: PopupMenuButton
              //   flex: 1,
              //   fit: FlexFit.tight,
              // ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Column(
                  children: [],
                ),
                flex: 1,
              ),
              Flexible(
                child: Column(
                  children: [],
                ),
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
