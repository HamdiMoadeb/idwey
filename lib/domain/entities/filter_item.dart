// To parse this JSON data, do
//
//     final filterItem = filterItemFromJson(jsonString);

import 'dart:convert';

FilterItem filterItemFromJson(String str) =>
    FilterItem.fromJson(json.decode(str));

String filterItemToJson(FilterItem data) => json.encode(data.toJson());

class FilterItem {
  final int? id;
  final String? name;

  FilterItem({
    this.id,
    this.name,
  });

  factory FilterItem.fromJson(Map<String, dynamic> json) => FilterItem(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
