import 'package:flutter/material.dart';
import 'package:flutter_bloc_stream_weather/models/crypto_model.dart';

class CryptoListItem extends StatelessWidget {
  final CryptoModel crypto;
  const CryptoListItem({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(crypto.name),
      subtitle: Text(crypto.currentPrice.toStringAsFixed(2)),
    ));
  }
}
