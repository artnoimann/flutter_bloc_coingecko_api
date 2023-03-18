import 'dart:convert';

import 'package:flutter_bloc_stream_weather/models/crypto_detail_model.dart';
import 'package:flutter_bloc_stream_weather/models/crypto_model.dart';
import 'package:http/http.dart' as http;

class CryptoService {
  Future<List<CryptoModel>> fetchCryptoData() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return CryptoModel.fromJson(responseData).toList();
    } else {
      throw Exception('Failed to load crypto data');
    }
  }

  Future<CryptoDetailModel> fetchCryptoDetailData(String name) async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/$name?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return CryptoDetailModel.fromJson(data);
    } else {
      throw Exception('Failed to load coin details');
    }
  }
}
