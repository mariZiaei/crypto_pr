class Crypto {
  String id;
  String symbol;
  String name;
  double priceUsd;
  double changePercent24Hr;
  double marketCapUsd;
  int rank;

  Crypto(this.name, this.id, this.symbol, this.changePercent24Hr,
      this.marketCapUsd, this.priceUsd, this.rank);

  factory Crypto.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return Crypto(
      jsonMapObject['id'],
      jsonMapObject['symbol'],
      jsonMapObject['name'],
      double.parse(jsonMapObject['marketCapUsd']),
      double.parse(jsonMapObject['changePercent24Hr']),
      double.parse(jsonMapObject['priceUsd']),
      int.parse(jsonMapObject['rank']),
    );
  }
}
