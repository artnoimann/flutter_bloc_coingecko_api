import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_stream_weather/bloc/event.dart';
import 'package:flutter_bloc_stream_weather/bloc/state.dart';
import 'package:flutter_bloc_stream_weather/services/crypto_service.dart';

import '../models/crypto_detail_model.dart';
import '../models/crypto_model.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  late final CryptoService service;
  CoinBloc() : super(CoinStateInitial()) {
    on<FetchCoins>((event, emit) async {
      service = CryptoService(); // инициализируем service здесь

      emit(CoinStateProgress());

      try {
        final List<CryptoModel> coins = await service.fetchCryptoData();
        emit(CoinStateSuccess(coins: coins));
      } catch (e) {
        emit(CoinStateError(error: e.toString()));
      }
    });

    on<FetchCoinDetail>((event, emit) async {
      if (service == null) {
        service = CryptoService(); // инициализируем service здесь
      }

      emit(CoinStateProgress());

      try {
        final CryptoDetailModel coin =
            await service.fetchCryptoDetailData(event.name);
        emit(CoinDetailSuccess(detailCoin: coin));
      } catch (e) {
        emit(CoinStateError(error: e.toString()));
      }
    });
  }
}
