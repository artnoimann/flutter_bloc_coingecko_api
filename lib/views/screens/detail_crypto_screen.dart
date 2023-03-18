import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc.dart';
import '../../bloc/event.dart';
import '../../bloc/state.dart';

class CryptoDetailScreen extends StatefulWidget {
  String name;
  CryptoDetailScreen({super.key, this.name = ''});

  @override
  State<CryptoDetailScreen> createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

      var name = args['name'];
      BlocProvider.of<CoinBloc>(context).add(FetchCoinDetail(
          name)); // добавляем событие FetchCoins для инициализации загрузки списка монет
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Details'),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(
        builder: (context, state) {
          if (state is CoinStateProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CoinStateError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is CoinDetailSuccess) {
            final coin = state.detailCoin;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    for (var field in coin.toJson().keys)
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              field,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              coin.toJson()[field].toString(),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
    );
  }
}
