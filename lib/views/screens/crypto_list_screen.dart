import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_stream_weather/views/widgets/crypto_list_widget.dart';
import '../../bloc/bloc.dart';
import '../../bloc/event.dart';
import '../../bloc/state.dart';

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({super.key});

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CoinBloc>(context).add(
        FetchCoins()); // добавляем событие FetchCoins для инициализации загрузки списка монет
  }

  // final CryptoService service;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto app'),
      ),
      body: BlocBuilder<CoinBloc, CoinState>(builder: (context, state) {
        if (state is CoinStateInitial) {
          //если данные еще в процесе получения
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CoinStateProgress) {
          //если данные еще в процесе получения
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CoinStateSuccess) {
          //если данные загружены
          var cryptoList = state.coins ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cryptoList.length,
                  itemBuilder: (context, index) {
                    final crypto = cryptoList[index];
                    return InkWell(
                      child: CryptoListItem(crypto: crypto),
                      onTap: () => Navigator.pushNamed(context, '/detail',
                          arguments: {'name': crypto.id}),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is CoinStateError) {
          return const Center(
            child: Text('Failed load data, try again'),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
