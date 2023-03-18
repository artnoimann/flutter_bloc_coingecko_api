import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_stream_weather/views/screens/crypto_list_screen.dart';
import 'package:flutter_bloc_stream_weather/views/screens/detail_crypto_screen.dart';
import 'package:url_strategy/url_strategy.dart';

import 'bloc/bloc.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoinBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => CryptoScreen(),
          '/detail': (context) => CryptoDetailScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/detail') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (context) => CryptoDetailScreen(name: args['name']),
            );
          }
        },
      ),
    );
  }
}
