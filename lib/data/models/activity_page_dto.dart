// To parse this JSON data, do
//
//     final activityPageDto = activityPageDtoFromJson(jsonString);

import 'dart:convert';

import 'package:idwey/data/models/attributz.dart';

import 'activity_category.dart';

ActivityPageDto activityPageDtoFromJson(String str) =>
    ActivityPageDto.fromJson(json.decode(str));

String activityPageDtoToJson(ActivityPageDto data) =>
    json.encode(data.toJson());

class ActivityPageDto {
  final String? pageTitle;
  final String? pageTitleTranslation;
  final String? bannerImagePage;
  final int? eur;
  final int? usd;
  final int? total;
  final List<Row>? rows;
  final List<ActivityCategory>? activityCategory;
  final List<String>? activityMinMaxPrice;
  final List<String>? cities;
  final List<AttributeDto>? attributes;

  ActivityPageDto({
    this.pageTitle,
    this.pageTitleTranslation,
    this.bannerImagePage,
    this.eur,
    this.usd,
    this.total,
    this.rows,
    this.activityCategory,
    this.activityMinMaxPrice,
    this.cities,
    this.attributes,
  });

  factory ActivityPageDto.fromJson(Map<String, dynamic> json) =>
      ActivityPageDto(
        pageTitle: json["page_title"],
        pageTitleTranslation: json["page_title_translation"],
        bannerImagePage: json["banner_image_page"],
        eur: json["eur"],
        usd: json["usd"],
        total: json["total"],
        rows: json["rows"] == null
            ? []
            : List<Row>.from(json["rows"]!.map((x) => Row.fromJson(x))),
        activityCategory: json["activity_category"] == null
            ? []
            : List<ActivityCategory>.from(json["activity_category"]!
                .map((x) => ActivityCategory.fromJson(x))),
        activityMinMaxPrice: json["activity_min_max_price"] == null
            ? []
            : List<String>.from(json["activity_min_max_price"]!.map((x) => x)),
        cities: json["cities"] == null
            ? []
            : List<String>.from(json["cities"]!.map((x) => x)),
        attributes: json["attributes"] == null
            ? []
            : List<AttributeDto>.from(
                json["attributes"]!.map((x) => AttributeDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page_title": pageTitle,
        "page_title_translation": pageTitleTranslation,
        "banner_image_page": bannerImagePage,
        "eur": eur,
        "usd": usd,
        "total": total,
        "rows": rows == null
            ? []
            : List<dynamic>.from(rows!.map((x) => x.toJson())),
        "activity_category": activityCategory == null
            ? []
            : List<dynamic>.from(activityCategory!.map((x) => x.toJson())),
        "activity_min_max_price": activityMinMaxPrice == null
            ? []
            : List<dynamic>.from(activityMinMaxPrice!.map((x) => x)),
        "cities":
            cities == null ? [] : List<dynamic>.from(cities!.map((x) => x)),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

class Row {
  final int? id;
  final String? slug;
  final String? imageUrl;
  final String? catName;
  final String? translationCatName;
  final String? title;
  final int? maxPeople;
  final dynamic isFeatured;
  final String? price;
  final dynamic salePrice;
  final String? duration;
  final String? address;
  final String? impactsocial;
  final String? translationImpactsocial;
  final List<dynamic>? translations;

  Row({
    this.id,
    this.slug,
    this.imageUrl,
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

  factory Row.fromJson(Map<String, dynamic> json) => Row(
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
        "duration": duration,
        "address": address,
        "impactsocial": impactsocial,
        "translation_impactsocial": translationImpactsocial,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}
