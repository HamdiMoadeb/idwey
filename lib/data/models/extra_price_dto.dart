// To parse this JSON data, do
//
//     final extraPrice = extraPriceFromJson(jsonString);

import 'dart:convert';

ExtraPrice extraPriceFromJson(String str) =>
    ExtraPrice.fromJson(json.decode(str));

String extraPriceToJson(ExtraPrice data) => json.encode(data.toJson());

class ExtraPrice {
  final String? name;
  final String? price;
  final String? type;

  ExtraPrice({
    this.name,
    this.price,
    this.type,
  });

  factory ExtraPrice.fromJson(Map<String, dynamic> json) => ExtraPrice(
        name: json["name"],
        price: json["price"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "type": type,
      };
}
