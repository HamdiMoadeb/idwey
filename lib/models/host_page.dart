import 'dart:convert';

import 'package:idwey/models/models.dart';

HostPage hostPageFromJson(String str) => HostPage.fromJson(json.decode(str));

String hostPageToJson(HostPage data) => json.encode(data.toJson());

class HostPage {
  final String? pageTitle;
  final String? pageTitleTranslation;
  final String? bannerImagePage;
  final int? eur;
  final int? usd;
  final int? total;
  final List<Host>? hosts;
  final List<String>? hotelMinMaxPrice;
  final List<String>? cities;

  HostPage({
    this.pageTitle,
    this.pageTitleTranslation,
    this.bannerImagePage,
    this.eur,
    this.usd,
    this.total,
    this.hosts,
    this.hotelMinMaxPrice,
    this.cities,
  });

  factory HostPage.fromJson(Map<String, dynamic> json) {
    return HostPage(
      pageTitle: json["page_title"],
      pageTitleTranslation: json["page_title_translation"],
      bannerImagePage: json["banner_image_page"],
      eur: json["eur"],
      usd: json["usd"],
      total: json["total"],
      hosts: json["hosts"] == null
          ? []
          : List<Host>.from(json["hosts"]!.map((x) => Host.fromJson(x))),
      hotelMinMaxPrice: json["hotel_min_max_price"] == null
          ? []
          : List<String>.from(json["hotel_min_max_price"]!.map((x) => x)),
      cities: json["cities"] == null
          ? []
          : List<String>.from(json["cities"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "page_title": pageTitle,
        "page_title_translation": pageTitleTranslation,
        "banner_image_page": bannerImagePage,
        "eur": eur,
        "usd": usd,
        "total": total,
        "hosts": hosts == null
            ? []
            : List<dynamic>.from(hosts!.map((x) => x.toJson())),
        "hotel_min_max_price": hotelMinMaxPrice == null
            ? []
            : List<dynamic>.from(hotelMinMaxPrice!.map((x) => x)),
        "cities":
            cities == null ? [] : List<dynamic>.from(cities!.map((x) => x)),
      };
}
