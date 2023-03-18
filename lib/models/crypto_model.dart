// ignore_for_file: public_member_api_docs, sort_constructors_first
class CryptoModel {
  final String id;
  final String name;
  final String symbol;
  final double currentPrice;

  const CryptoModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
  });

  static fromJson(List<dynamic> responseData) {
    return responseData
        .map((json) => CryptoModel(
              id: json['id'],
              name: json['name'],
              symbol: json['symbol'],
              currentPrice: json['current_price'].toDouble(),
            ))
        .toList();
  }
}
