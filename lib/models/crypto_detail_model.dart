class CryptoDetailModel {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final List<double> currentPrice;
  final double marketCap;
  final double circulatingSupply;
  final double totalSupply;
  final double maxSupply;
  final double priceChangePercentage24h;
  final double priceChangePercentage7d;
  final double priceChangePercentage14d;
  final double priceChangePercentage30d;
  final double priceChangePercentage60d;
  final double priceChangePercentage200d;
  final double priceChangePercentage1y;

  CryptoDetailModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.maxSupply,
    required this.priceChangePercentage24h,
    required this.priceChangePercentage7d,
    required this.priceChangePercentage14d,
    required this.priceChangePercentage30d,
    required this.priceChangePercentage60d,
    required this.priceChangePercentage200d,
    required this.priceChangePercentage1y,
  });

  factory CryptoDetailModel.fromJson(Map<String, dynamic> json) {
    return CryptoDetailModel(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      image: json['image']['large'],
      currentPrice:
          List<double>.from(json['market_data']['current_price'].values),
      marketCap: json['market_data']['market_cap']['usd'],
      circulatingSupply: json['market_data']['circulating_supply'],
      totalSupply: json['market_data']['total_supply'],
      maxSupply: json['market_data']['max_supply'],
      priceChangePercentage24h: json['market_data']
          ['price_change_percentage_24h'],
      priceChangePercentage7d: json['market_data']
          ['price_change_percentage_7d'],
      priceChangePercentage14d: json['market_data']
          ['price_change_percentage_14d'],
      priceChangePercentage30d: json['market_data']
          ['price_change_percentage_30d'],
      priceChangePercentage60d: json['market_data']
          ['price_change_percentage_60d'],
      priceChangePercentage200d: json['market_data']
          ['price_change_percentage_200d'],
      priceChangePercentage1y: json['market_data']
          ['price_change_percentage_1y'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'symbol': symbol,
      'name': name,
      'image': image,
      'current_price': currentPrice,
      'market_cap': marketCap,
      'circulating_supply': circulatingSupply,
      'total_supply': totalSupply,
      'max_supply': maxSupply,
      'price_change_percentage_24h': priceChangePercentage24h,
      'price_change_percentage_7d': priceChangePercentage7d,
      'price_change_percentage_14d': priceChangePercentage14d,
      'price_change_percentage_30d': priceChangePercentage30d,
      'price_change_percentage_60d': priceChangePercentage60d,
      'price_change_percentage_200d': priceChangePercentage200d,
      'price_change_percentage_1y': priceChangePercentage1y,
    };
  }
}
