// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc_stream_weather/models/crypto_detail_model.dart';
import 'package:flutter_bloc_stream_weather/models/crypto_model.dart';

abstract class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object> get props => [];
}

class CoinStateInitial extends CoinState {}

class CoinStateProgress extends CoinState {}

class CoinStateSuccess extends CoinState {
  final List<CryptoModel>? coins;
  const CoinStateSuccess({
    this.coins,
  });
}

class CoinDetailStateSuccess extends CoinState {
  final CryptoDetailModel coin;
  const CoinDetailStateSuccess({
    required this.coin,
  });
}

class CoinStateError extends CoinState {
  String error;
  CoinStateError({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

class CoinDetailSuccess extends CoinState {
  final CryptoDetailModel detailCoin;
  const CoinDetailSuccess({
    required this.detailCoin,
  });

  List<Object> get props => [detailCoin];
}
