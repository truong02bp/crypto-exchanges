import 'package:crypto_exchanges/model/coin.dart';
import 'package:crypto_exchanges/theme/color_palette.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'LEFT'),
    new Tab(text: 'RIGHT'),
  ];
  List<Coin> coins = [
    Coin(symbol: "BNB/BUSD", lastPrice: 403.7, change: 1.3),
    Coin(symbol: "lUNA/BUSD", lastPrice: 52.66, change: 1.3),
    Coin(symbol: "ADA/BUSD", lastPrice: 1.055, change: 1.3),
    Coin(symbol: "SLP/BUSD", lastPrice: 0.0298, change: 1.3),
    Coin(symbol: "SHIB/BUSD", lastPrice: 0.00003139, change: 1.3),
    Coin(symbol: "BTC/BUSD", lastPrice: 42524.00, change: 1.3),
    Coin(symbol: "ETH/BUSD", lastPrice: 2910.7, change: 1.5),
    Coin(symbol: "SOL/BUSD", lastPrice: 95.7, change: 0.34),
    Coin(symbol: "MATIC/BUSD", lastPrice: 1.703, change: 1.92),
    Coin(symbol: "GALA/BUSD", lastPrice: 0.0300, change: -0.07),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          backgroundColor: AppColor.black3,
          appBar: TabBar(
            tabs: [
              Tab(
                text: 'Hot',
              ),
              Tab(
                text: 'Gainers',
              ),
              Tab(
                text: 'Losers',
              ),
              Tab(
                text: '24h Vol',
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Text('Hot'),
              Text('Gainers'),
              Text('Losers'),
              Text('24h Vol'),
            ],
          ),
        ));
  }
}
