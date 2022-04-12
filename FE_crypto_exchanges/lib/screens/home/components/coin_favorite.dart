
import 'package:flutter/material.dart';

class CoinFavorite extends StatelessWidget {
  const CoinFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('BNB / BUSD', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12),),
                    SizedBox(width: 4,),
                    Text('+1.35%', style: TextStyle(color: Colors.green),)
                  ],
                ),
                SizedBox(height: 4,),
                Text('402.9', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(height: 4,),
                Text('≈ \$402.90', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12))
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('BTC / BUSD', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12),),
                    SizedBox(width: 4,),
                    Text('+0.85%', style: TextStyle(color: Colors.green),)
                  ],
                ),
                SizedBox(height: 4,),
                Text('42,557.23', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(height: 4,),
                Text('≈ \$42557.23', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12))
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('ETH / BUSD', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12),),
                    SizedBox(width: 4,),
                    Text('+1.20%', style: TextStyle(color: Colors.green),)
                  ],
                ),
                SizedBox(height: 4,),
                Text('2,934.13', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(height: 4,),
                Text('≈ \$2,934.13', style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 12))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
