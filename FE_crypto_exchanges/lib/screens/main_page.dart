import 'package:crypto_exchanges/screens/future/Future.dart';
import 'package:crypto_exchanges/screens/home/home.dart';
import 'package:crypto_exchanges/screens/login/login.dart';
import 'package:crypto_exchanges/screens/market/market.dart';
import 'package:crypto_exchanges/screens/trade/trade.dart';
import 'package:crypto_exchanges/screens/wallet/wallet.dart';
import 'package:crypto_exchanges/theme/color_palette.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLogin = true;
  int currentIndex = 0;
  final screens = [
    Home(),
    Market(),
    Trade(),
    Future(),
    Wallet()
  ];

  @override
  Widget build(BuildContext context) {
    Color color = AppColor.black3;
    return Scaffold(
      body: !isLogin ? Login() : SafeArea(child: screens[currentIndex]),
      bottomNavigationBar: isLogin
          ? BottomNavigationBar(
              showUnselectedLabels: true,
              selectedItemColor: Colors.yellow.withOpacity(0.75),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              unselectedLabelStyle: TextStyle(color: Colors.white),
              currentIndex: currentIndex,
              onTap: (index) {
                if (index != currentIndex) {
                  setState(() {
                    currentIndex = index;
                  });
                }
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: color, ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart),
                    label: 'Markets',
                    backgroundColor: color),
                BottomNavigationBarItem(
                    icon: Icon(Icons.monetization_on),
                    label: 'Trades',
                    backgroundColor: color),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event),
                    label: 'Futures',
                    backgroundColor: color),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance_wallet_rounded),
                    label: 'Wallet',
                    backgroundColor: color),
              ],
            )
          : Container(),
    );
  }
}
