// To parse this JSON data, do
//
//     final experience = experienceFromJson(jsonString);

import 'dart:convert';

Experience experienceFromJson(String str) =>
    Experience.fromJson(json.decode(str));

String experienceToJson(Experience data) => json.encode(data.toJson());

class Experience {
  final int? id;
  final String? slug;
  final String? title;
  final int? maxPeople;
  final int? isFeatured;
  final String? price;
  final dynamic salePrice;
  final dynamic promotion;
  final String? duration;
  final String? address;
  final String? impactsocial;
  final String? imageUrl;
  final String? catName;
  final String? translationCatName;
  final int? promoCode;
  final String? translationImpactsocial;
  final List<dynamic>? translations;

  Experience({
    this.id,
    this.slug,
    this.title,
    this.maxPeople,
    this.isFeatured,
    this.price,
    this.salePrice,
    this.duration,
    this.address,
    this.promotion,
    this.impactsocial,
    this.imageUrl,
    this.catName,
    this.translationCatName,
    this.promoCode,
    this.translationImpactsocial,
    this.translations,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        maxPeople: json["max_people"],
        isFeatured: json["is_featured"],
        price: json["price"],
        salePrice: json["sale_price"],
        duration: json["duration"],
        address: json["address"],
        impactsocial: json["impactsocial"],
        imageUrl: json["IMAGE_URL"],
        catName: json["cat_name"],
        promotion: json["promotion"],
        translationCatName: json["translation_cat_name"],
        promoCode: json["promo_code"],
        translationImpactsocial: json["translation_impactsocial"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "max_people": maxPeople,
        "is_featured": isFeatured,
        "price": price,
        "sale_price": salePrice,
        "duration": duration,
        "address": address,
        "impactsocial": impactsocial,
        "IMAGE_URL": imageUrl,
        "cat_name": catName,
        "promotion": promotion,
        "translation_cat_name": translationCatName,
        "promo_code": promoCode,
        "translation_impactsocial": translationImpactsocial,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}
