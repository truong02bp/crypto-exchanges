import 'package:crypto_exchanges/screens/home/components/coin_favorite.dart';
import 'package:crypto_exchanges/screens/home/components/dashboard.dart';
import 'package:crypto_exchanges/screens/home/components/header.dart';
import 'package:crypto_exchanges/screens/home/components/my_card.dart';
import 'package:crypto_exchanges/theme/color_palette.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Header(),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: MyCard(
                    title: 'P2P Trading',
                    text:
                        'Bank Transfer, Digital Wallet\nTransfer, Mobile Payment and',
                    icon: 'assets/images/trade.png',
                    onTap: () {}),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: MyCard(
                      title: 'Credit/Debit Card',
                      text: 'Visa, Mastercard',
                      icon: 'assets/images/credit.png',
                      onTap: () {}))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            decoration: BoxDecoration(
              color: AppColor.black3,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                CoinFavorite(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 0.2,
                  color: Colors.grey.withOpacity(0.5),
                ),
                Expanded(child: DashBoard()),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
