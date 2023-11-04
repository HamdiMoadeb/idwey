// To parse this JSON data, do
//
//     final activity = activityFromJson(jsonString);

import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  final int? id;
  final String? slug;
  final String? imageUrl;
  final String? promotion;
  final String? catName;
  final String? translationCatName;
  final String? title;
  final int? maxPeople;
  final int? isFeatured;
  final String? price;
  final dynamic salePrice;
  final String? duration;
  final String? address;
  final dynamic impactsocial;
  final dynamic translationImpactsocial;
  final List<dynamic>? translations;

  Activity({
    this.id,
    this.slug,
    this.imageUrl,
    this.promotion,
    this.catName,
    this.translationCatName,
    this.title,
    this.maxPeople,
    this.isFeatured,
    this.price,
    this.salePrice,
    this.duration,
    this.address,
    this.impactsocial,
    this.translationImpactsocial,
    this.translations,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        slug: json["slug"],
        imageUrl: json["IMAGE_URL"],
        catName: json["cat_name"],
        translationCatName: json["translation_cat_name"],
        title: json["title"],
        maxPeople: json["max_people"],
        isFeatured: json["is_featured"],
        price: json["price"],
        salePrice: json["sale_price"],
        promotion: json["promotion"],
        duration: json["duration"],
        address: json["address"],
        impactsocial: json["impactsocial"],
        translationImpactsocial: json["translation_impactsocial"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "IMAGE_URL": imageUrl,
        "cat_name": catName,
        "translation_cat_name": translationCatName,
        "title": title,
        "max_people": maxPeople,
        "is_featured": isFeatured,
        "price": price,
        "sale_price": salePrice,
        "promotion": promotion,
        "duration": duration,
        "address": address,
        "impactsocial": impactsocial,
        "translation_impactsocial": translationImpactsocial,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}
