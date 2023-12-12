// To parse this JSON data, do
//
//     final experienceDetailsDto = experienceDetailsDtoFromJson(jsonString);

import 'dart:convert';

import 'review_dto.dart';
import 'review_scale_dto.dart';

ExperienceDetailsDto experienceDetailsDtoFromJson(String str) =>
    ExperienceDetailsDto.fromJson(json.decode(str));

String experienceDetailsDtoToJson(ExperienceDetailsDto data) =>
    json.encode(data.toJson());

class ExperienceDetailsDto {
  final Row? row;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final List<GalleryImagesUrl>? galleryImagesUrl;
  final Attributes? attributes;
  final List<Attributes1>? attributes1;
  final List<ReviewDto>? reviewList;
  final List<ReviewScale>? reviewScale;
  final int? moyRate;
  final int? canreview;

  ExperienceDetailsDto({
    this.row,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.attributes,
    this.attributes1,
    this.reviewList,
    this.reviewScale,
    this.moyRate,
    this.canreview,
  });

  factory ExperienceDetailsDto.fromJson(Map<String, dynamic> json) =>
      ExperienceDetailsDto(
        row: json["row"] == null ? null : Row.fromJson(json["row"]),
        eur: json["eur"],
        usd: json["usd"],
        bannerImageUrl: json["banner_image_url"],
        galleryImagesUrl: json["gallery_images_url"] == null
            ? []
            : List<GalleryImagesUrl>.from(json["gallery_images_url"]!
                .map((x) => GalleryImagesUrl.fromJson(x))),
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        attributes1: json["attributes1"] == null
            ? []
            : List<Attributes1>.from(
                json["attributes1"]!.map((x) => Attributes1.fromJson(x))),
        reviewList: json["review_list"] == null
            ? []
            : List<ReviewDto>.from(
                json["review_list"]!.map((x) => ReviewDto.fromJson(x))),
        reviewScale: json["review_scale"] == null
            ? []
            : List<ReviewScale>.from(
                json["review_scale"]!.map((x) => ReviewScale.fromJson(x))),
        moyRate: json["moy_rate"],
        canreview: json["canreview"],
      );

  Map<String, dynamic> toJson() => {
        "row": row?.toJson(),
        "eur": eur,
        "usd": usd,
        "banner_image_url": bannerImageUrl,
        "gallery_images_url": galleryImagesUrl == null
            ? []
            : List<dynamic>.from(galleryImagesUrl!.map((x) => x.toJson())),
        "attributes": attributes?.toJson(),
        "attributes1": attributes1 == null
            ? []
            : List<dynamic>.from(attributes1!.map((x) => x.toJson())),
        "review_list": reviewList == null
            ? []
            : List<dynamic>.from(reviewList!.map((x) => x)),
        "review_scale": reviewScale == null
            ? []
            : List<dynamic>.from(reviewScale!.map((x) => x.toJson())),
        "moy_rate": moyRate,
        "canreview": canreview,
      };
}

class Attributes {
  final Attributes1? the11;

  Attributes({
    this.the11,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        the11: json["11"] == null ? null : Attributes1.fromJson(json["11"]),
      );

  Map<String, dynamic> toJson() => {
        "11": the11?.toJson(),
      };
}

class Attributes1 {
  final String? parent;
  final List<dynamic>? translateParent;
  final List<String>? child;
  final List<String>? tranlation;

  Attributes1({
    this.parent,
    this.translateParent,
    this.child,
    this.tranlation,
  });

  factory Attributes1.fromJson(Map<String, dynamic> json) => Attributes1(
        parent: json["parent"],
        translateParent: json["translate parent"] == null
            ? []
            : List<dynamic>.from(json["translate parent"]!.map((x) => x)),
        child: json["child"] == null
            ? []
            : List<String>.from(json["child"]!.map((x) => x)),
        tranlation: json["tranlation"] == null
            ? []
            : List<String>.from(json["tranlation"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "parent": parent,
        "translate parent": translateParent == null
            ? []
            : List<dynamic>.from(translateParent!.map((x) => x)),
        "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x)),
        "tranlation": tranlation == null
            ? []
            : List<dynamic>.from(tranlation!.map((x) => x)),
      };
}

class GalleryImagesUrl {
  final String? large;
  final String? thumb;

  GalleryImagesUrl({
    this.large,
    this.thumb,
  });

  factory GalleryImagesUrl.fromJson(Map<String, dynamic> json) =>
      GalleryImagesUrl(
        large: json["large"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}

class Row {
  final int? id;
  final String? slug;
  final String? title;
  final String? content;
  final int? maxPeople;
  final int? isFeatured;
  final String? price;
  final dynamic salePrice;
  final String? duration;
  final String? address;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final dynamic impactsocial;
  final int? bannerImageId;
  final String? gallery;
  final String? catName;
  final String? translationCatName;
  final String? locationName;
  final String? translationLocationName;
  final List<ExtraPrice>? extraPrice;
  final dynamic translationImpactsocial;
  final dynamic location;
  final List<dynamic>? translations;
  final dynamic hasWishList;
  final List<ExperienceTerm>? experienceTerm;
  final dynamic promotion;

  Row({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.maxPeople,
    this.isFeatured,
    this.price,
    this.salePrice,
    this.duration,
    this.address,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.impactsocial,
    this.bannerImageId,
    this.gallery,
    this.catName,
    this.translationCatName,
    this.locationName,
    this.translationLocationName,
    this.extraPrice,
    this.translationImpactsocial,
    this.location,
    this.translations,
    this.hasWishList,
    this.experienceTerm,
    this.promotion,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        content: json["content"],
        maxPeople: json["max_people"],
        isFeatured: json["is_featured"],
        price: json["price"],
        salePrice: json["sale_price"],
        duration: json["duration"],
        address: json["address"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        impactsocial: json["impactsocial"],
        bannerImageId: json["banner_image_id"],
        gallery: json["gallery"],
        catName: json["cat_name"],
        translationCatName: json["translation_cat_name"],
        locationName: json["location_name"],
        translationLocationName: json["translation_location_name"],
        extraPrice: json["extra_price"] == null
            ? []
            : List<ExtraPrice>.from(
                json["extra_price"]!.map((x) => ExtraPrice.fromJson(x))),
        translationImpactsocial: json["translation_impactsocial"],
        location: json["location"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        hasWishList: json["has_wish_list"],
        experienceTerm: json["experience_term"] == null
            ? []
            : List<ExperienceTerm>.from(json["experience_term"]!
                .map((x) => ExperienceTerm.fromJson(x))),
        promotion: json["promotion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "content": content,
        "max_people": maxPeople,
        "is_featured": isFeatured,
        "price": price,
        "sale_price": salePrice,
        "duration": duration,
        "address": address,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "impactsocial": impactsocial,
        "banner_image_id": bannerImageId,
        "gallery": gallery,
        "cat_name": catName,
        "translation_cat_name": translationCatName,
        "location_name": locationName,
        "translation_location_name": translationLocationName,
        "extra_price": extraPrice == null
            ? []
            : List<dynamic>.from(extraPrice!.map((x) => x.toJson())),
        "translation_impactsocial": translationImpactsocial,
        "location": location,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "has_wish_list": hasWishList,
        "experience_term": experienceTerm == null
            ? []
            : List<dynamic>.from(experienceTerm!.map((x) => x.toJson())),
        "promotion": promotion,
      };
}

class ExperienceTerm {
  final int? id;
  final int? termId;
  final int? experienceId;
  final int? createUser;
  final dynamic updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ExperienceTerm({
    this.id,
    this.termId,
    this.experienceId,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
  });

  factory ExperienceTerm.fromJson(Map<String, dynamic> json) => ExperienceTerm(
        id: json["id"],
        termId: json["term_id"],
        experienceId: json["experience_id"],
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
        "term_id": termId,
        "experience_id": experienceId,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

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
