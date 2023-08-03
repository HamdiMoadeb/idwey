// To parse this JSON data, do
//
//     final host = hostFromJson(jsonString);

import 'dart:convert';

Host hostFromJson(String str) => Host.fromJson(json.decode(str));

String hostToJson(Host data) => json.encode(data.toJson());

class Host {
  final int? id;
  final String? slug;
  final String? title;
  final String? perPerson;
  final int? isFeatured;
  final String? imageUrl;
  final String? termName;
  final dynamic translationTermName;
  final String? locationName;
  final String? translationLocationName;
  final String? price;
  final String? perPersonTranslation;
  final int? hasRoom;
  final int? maxPerson;
  final String? typeHostTranslation;
  final String? typeHost;
  final dynamic salePrice;
  final String? address;
  final dynamic impactSocial;
  final dynamic translationImpactSocial;
  final dynamic promotion;
  final List<dynamic>? translations;

  Host({
    this.id,
    this.slug,
    this.title,
    this.perPerson,
    this.isFeatured,
    this.imageUrl,
    this.termName,
    this.translationTermName,
    this.locationName,
    this.translationLocationName,
    this.price,
    this.perPersonTranslation,
    this.hasRoom,
    this.maxPerson,
    this.typeHostTranslation,
    this.typeHost,
    this.salePrice,
    this.address,
    this.impactSocial,
    this.translationImpactSocial,
    this.promotion,
    this.translations,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        perPerson: json["per_person"],
        isFeatured: json["is_featured"],
        imageUrl: json["IMAGE_URL"],
        termName: json["term_name"],
        translationTermName: json["translation_term_name"],
        locationName: json["location_name"],
        translationLocationName: json["translation_location_name"],
        price: json["price"],
        perPersonTranslation: json["per_person_translation"],
        hasRoom: json["has_room"],
        maxPerson: json["max_person"],
        typeHostTranslation: json["type_host_translation"],
        typeHost: json["type_host"],
        salePrice: json["sale_price"],
        address: json["address"],
        impactSocial: json["impactsocial"],
        translationImpactSocial: json["translation_impactsocial"],
        promotion: json["promotion"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "per_person": perPerson,
        "is_featured": isFeatured,
        "IMAGE_URL": imageUrl,
        "term_name": termName,
        "translation_term_name": translationTermName,
        "location_name": locationName,
        "translation_location_name": translationLocationName,
        "price": price,
        "per_person_translation": perPersonTranslation,
        "has_room": hasRoom,
        "max_person": maxPerson,
        "type_host_translation": typeHostTranslation,
        "type_host": typeHost,
        "sale_price": salePrice,
        "address": address,
        "impactsocial": impactSocial,
        "translation_impactsocial": translationImpactSocial,
        "promotion": promotion,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}
