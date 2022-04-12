import 'package:flutter/material.dart';
class Future extends StatefulWidget {
  const Future({Key? key}) : super(key: key);

  @override
  _FutureState createState() => _FutureState();
}

class _FutureState extends State<Future> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('future'),
    );
  }
}
