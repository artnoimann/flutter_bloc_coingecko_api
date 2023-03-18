import 'package:equatable/equatable.dart';

abstract class CoinEvent extends Equatable {
  CoinEvent();

  @override
  List<Object> get props => [];
}

class FetchCoins extends CoinEvent {}

class FetchCoinDetail extends CoinEvent {
  String name;
  FetchCoinDetail(this.name);

  @override
  List<Object> get props => [name];
}
