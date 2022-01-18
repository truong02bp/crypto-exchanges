import 'package:crypto_exchanges/screens/coin_detail/bloc.dart';
import 'package:crypto_exchanges/screens/coin_detail/event.dart';
import 'package:crypto_exchanges/screens/coin_detail/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailAppBar extends StatelessWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CoinDetailBloc bloc = BlocProvider.of<CoinDetailBloc>(context);
    return Container(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.white.withOpacity(0.6),
              size: 20,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(
            flex: 10,
          ),
          Text(
            'BNB/USDT',
            style: TextStyle(fontSize: 22),
          ),
          Spacer(
            flex: 10,
          ),
          BlocBuilder<CoinDetailBloc, CoinDetailState>(
            bloc: bloc,
            buildWhen: (context, state) {
              return state is FavoriteState;
            },
            builder: (context, state) {
              print("rebuild");
              bool isFavorite = bloc.getIsFavorite();
              return InkWell(
                child: isFavorite
                    ? Icon(
                        Icons.star,
                        size: 20,
                      )
                    : Icon(
                        Icons.star_border,
                        size: 20,
                      ),
                onTap: () {
                  bloc.add(FavoriteTap());
                },
              );
            },
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}
