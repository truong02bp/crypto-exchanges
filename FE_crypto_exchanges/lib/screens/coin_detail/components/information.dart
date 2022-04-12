import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 15),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '461.2',
                      style: TextStyle(fontSize: 30),
                    ),
                    Row(
                      children: [
                        Text(
                          '≈ \$499',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '- 10%',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    )
                  ],
                ),
              ),
              flex: 3,
            ),
            Spacer(
              flex: 3,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '24h High',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '479.7',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            '24h Vol(BNB)',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '201,383.77',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '24h High',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '479.7',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            '24h Vol(BNB)',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            '201,383.77',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
