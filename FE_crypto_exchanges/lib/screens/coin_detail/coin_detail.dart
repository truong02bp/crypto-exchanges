import 'package:crypto_exchanges/screens/coin_detail/components/chart.dart';
import 'package:crypto_exchanges/screens/coin_detail/components/exchange.dart';
import 'package:crypto_exchanges/screens/coin_detail/components/information.dart';
import 'package:crypto_exchanges/screens/coin_detail/components/detail_appbar.dart';
import 'package:crypto_exchanges/screens/coin_detail/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class CoinDetail extends StatefulWidget {
  static final String routeName = "/coin-detail";

  const CoinDetail({Key? key}) : super(key: key);

  @override
  _CoinDetailState createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CoinDetailBloc(CoinDetailState()),
        child: SafeArea(
          child: Column(
            children: [
              DetailAppBar(),
              SizedBox(
                height: 15,
              ),
              Information(),
              Chart(),
              Exchange(),
            ],
          ),
        ),
      ),
    );
  }
}
