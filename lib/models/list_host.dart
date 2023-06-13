// To parse this JSON data, do
//
//     final listHost = listHostFromJson(jsonString);

import 'dart:convert';

import 'package:idwey/models/host.dart';

ListHost listHostFromJson(String str) => ListHost.fromJson(json.decode(str));

String listHostToJson(ListHost data) => json.encode(data.toJson());

class ListHost {
  final List<Host>? rows;
  final int? eur;
  final int? usd;
  final String? title;
  final String? titletranslation;
  final String? desc;
  final String? desctranslation;

  ListHost({
    this.rows,
    this.eur,
    this.usd,
    this.title,
    this.titletranslation,
    this.desc,
    this.desctranslation,
  });

  factory ListHost.fromJson(Map<String, dynamic> json) => ListHost(
        rows: json["rows"] == null
            ? []
            : List<Host>.from(json["rows"]!.map((x) => Host.fromJson(x))),
        eur: json["eur"],
        usd: json["usd"],
        title: json["title"],
        titletranslation: json["titletranslation"],
        desc: json["desc"],
        desctranslation: json["desctranslation"],
      );

  Map<String, dynamic> toJson() => {
        "rows": rows == null
            ? []
            : List<dynamic>.from(rows!.map((x) => x.toJson())),
        "eur": eur,
        "usd": usd,
        "title": title,
        "titletranslation": titletranslation,
        "desc": desc,
        "desctranslation": desctranslation,
      };
}
