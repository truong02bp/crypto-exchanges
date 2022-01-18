import 'package:crypto_exchanges/screens/coin_detail/event.dart';
import 'package:crypto_exchanges/screens/coin_detail/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinDetailBloc extends Bloc<CoinDetailEvent, CoinDetailState> {

  bool _isFavorite = false;
  CoinDetailBloc(CoinDetailState state) : super(state) {
    on<FavoriteTap>((event, emit) {
      _isFavorite = !_isFavorite;
      emit(FavoriteState(isFavorite: _isFavorite));
    });
  }

  bool getIsFavorite() {
    return _isFavorite;
  }

}
