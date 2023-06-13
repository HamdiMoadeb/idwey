// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
  final String? key;
  final int? value;
  final String? symbol;

  Currency({
    this.key,
    this.value,
    this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        key: json["key"],
        value: json["value"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "symbol": symbol,
      };
}
