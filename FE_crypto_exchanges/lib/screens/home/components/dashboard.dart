import 'package:crypto_exchanges/model/coin.dart';
import 'package:crypto_exchanges/screens/home/components/coin_card.dart';
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
    Coin(symbol: "BNB/BUSD", lastPrice: 403.7, change: -1.3),
    Coin(symbol: "LUNA/BUSD", lastPrice: 52.66, change: 1.3),
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
              buildCoinCards(coins: coins),
              buildCoinCards(coins: coins),
              buildCoinCards(coins: coins),
              buildCoinCards(coins: coins),
            ],
          ),
        ));
  }

  Column buildCoinCards({coins}) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Text(
                'Pair',
                style: TextStyle(
                    fontSize: 12, color: Colors.grey.withOpacity(0.8)),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              width: 120,
              margin: EdgeInsets.only(right: 35),
              child: Text(
                'Last price',
                style: TextStyle(
                    fontSize: 12, color: Colors.grey.withOpacity(0.8)),
              ),
            ),
            Text(
              '24h change',
              style:
                  TextStyle(fontSize: 12, color: Colors.grey.withOpacity(0.8)),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: ListView(
            children: List.generate(
                coins.length,
                (index) => CoinCard(
                    symbol: coins[index].symbol,
                    lastPrice: coins[index].lastPrice,
                    change: coins[index].change)),
          ),
        )
      ],
    );
  }
}
