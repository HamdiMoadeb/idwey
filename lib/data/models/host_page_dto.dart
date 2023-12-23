// To parse this JSON data, do
//
//     final hostPageDto = hostPageDtoFromJson(jsonString);

import 'dart:convert';

import 'package:idwey/data/models/host_dto.dart';

import 'attribute_dto.dart';
import 'attributz.dart';

HostPageDto hostPageDtoFromJson(String str) =>
    HostPageDto.fromJson(json.decode(str));

String hostPageDtoToJson(HostPageDto data) => json.encode(data.toJson());

class HostPageDto {
  final String? pageTitle;
  final String? pageTitleTranslation;
  final String? bannerImagePage;
  final int? eur;
  final int? usd;
  final int? total;
  final List<Host>? rows;
  final List<String>? hotelMinMaxPrice;
  final List<String>? cities;
  final List<AttributeDto>? attributes;

  HostPageDto({
    this.pageTitle,
    this.pageTitleTranslation,
    this.bannerImagePage,
    this.eur,
    this.usd,
    this.total,
    this.rows,
    this.hotelMinMaxPrice,
    this.cities,
    this.attributes,
  });

  factory HostPageDto.fromJson(Map<String, dynamic> json) => HostPageDto(
        pageTitle: json["page_title"],
        pageTitleTranslation: json["page_title_translation"],
        bannerImagePage: json["banner_image_page"],
        eur: json["eur"],
        usd: json["usd"],
        total: json["total"],
        rows: json["rows"] == null
            ? []
            : List<Host>.from(json["rows"]!.map((x) => Host.fromJson(x))),
        hotelMinMaxPrice: json["hotel_min_max_price"] == null
            ? []
            : List<String>.from(json["hotel_min_max_price"]!.map((x) => x)),
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
        "hotel_min_max_price": hotelMinMaxPrice == null
            ? []
            : List<dynamic>.from(hotelMinMaxPrice!.map((x) => x)),
        "cities":
            cities == null ? [] : List<dynamic>.from(cities!.map((x) => x)),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

class Term {
  final int? id;
  final String? name;
  final dynamic content;
  final int? attrId;
  final String? slug;
  final int? createUser;
  final int? updateUser;
  final dynamic originId;
  final dynamic lang;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final dynamic imageId;
  final String? icon;
  final List<Translation>? translations;

  Term({
    this.id,
    this.name,
    this.content,
    this.attrId,
    this.slug,
    this.createUser,
    this.updateUser,
    this.originId,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageId,
    this.icon,
    this.translations,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        attrId: json["attr_id"],
        slug: json["slug"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        imageId: json["image_id"],
        icon: json["icon"],
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "attr_id": attrId,
        "slug": slug,
        "create_user": createUser,
        "update_user": updateUser,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "image_id": imageId,
        "icon": icon,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}

class Translation {
  final int? id;
  final int? originId;
  final String? locale;
  final String? name;
  final dynamic content;
  final int? createUser;
  final int? updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Translation({
    this.id,
    this.originId,
    this.locale,
    this.name,
    this.content,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        originId: json["origin_id"],
        locale: json["locale"],
        name: json["name"],
        content: json["content"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "origin_id": originId,
        "locale": locale,
        "name": name,
        "content": content,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Row {
  final int? id;
  final String? slug;
  final String? title;
  final String? perPerson;
  final int? isFeatured;
  final String? imageUrl;
  final String? termName;
  final String? translationTermName;
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
  final String? impactsocial;
  final String? translationImpactsocial;
  final dynamic promotion;
  final List<dynamic>? translations;

  Row({
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
    this.impactsocial,
    this.translationImpactsocial,
    this.promotion,
    this.translations,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
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
        impactsocial: json["impactsocial"],
        translationImpactsocial: json["translation_impactsocial"],
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
        "impactsocial": impactsocial,
        "translation_impactsocial": translationImpactsocial,
        "promotion": promotion,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}
