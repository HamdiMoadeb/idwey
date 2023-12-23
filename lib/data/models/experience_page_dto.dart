// To parse this JSON data, do
//
//     final experiencePageDto = experiencePageDtoFromJson(jsonString);

import 'dart:convert';

import 'activity_category.dart';
import 'activity_page_dto.dart';
import 'attribute_dto.dart';
import 'attributz.dart';
import 'host_details_dto.dart';

ExperiencePageDto experiencePageDtoFromJson(String str) =>
    ExperiencePageDto.fromJson(json.decode(str));

String experiencePageDtoToJson(ExperiencePageDto data) =>
    json.encode(data.toJson());

class ExperiencePageDto {
  final String? pageTitle;
  final String? pageTitleTranslation;
  final String? bannerImagePage;
  final int? eur;
  final int? usd;
  final int? total;
  final List<dynamic>? rows;
  final List<ActivityCategory>? activityCategory;
  final List<String>? activityMinMaxPrice;
  final List<String>? cities;
  final List<AttributeDto>? attributes;

  ExperiencePageDto({
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

  factory ExperiencePageDto.fromJson(Map<String, dynamic> json) =>
      ExperiencePageDto(
        pageTitle: json["page_title"],
        pageTitleTranslation: json["page_title_translation"],
        bannerImagePage: json["banner_image_page"],
        eur: json["eur"],
        usd: json["usd"],
        total: json["total"],
        rows: json["rows"] == null
            ? []
            : List<dynamic>.from(json["rows"]!.map((x) => x)),
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
        "rows": rows == null ? [] : List<dynamic>.from(rows!.map((x) => x)),
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
