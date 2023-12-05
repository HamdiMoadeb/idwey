// To parse this JSON data, do
//
//     final hostDetails = hostDetailsFromJson(jsonString);

import 'dart:convert';

import 'extra_price_dto.dart';

HostDetails hostDetailsFromJson(String str) =>
    HostDetails.fromJson(json.decode(str));

String hostDetailsToJson(HostDetails data) => json.encode(data.toJson());

class HostDetails {
  final Row? row;
  final List<Room>? rooms;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final List<GalleryImagesUrl>? galleryImagesUrl;
  final Map<String, Attribute>? attributes;
  final List<Attribute>? attributes1;
  final List<HotelRelated>? hotelRelated;
  final List<dynamic>? reviewList;
  final List<ReviewScale>? reviewScale;
  final int? moyRate;
  final int? canreview;

  HostDetails({
    this.row,
    this.rooms,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.attributes,
    this.attributes1,
    this.hotelRelated,
    this.reviewList,
    this.reviewScale,
    this.moyRate,
    this.canreview,
  });

  factory HostDetails.fromJson(Map<String, dynamic> json) => HostDetails(
        row: json["row"] == null ? null : Row.fromJson(json["row"]),
        rooms: json["rooms"] == null
            ? []
            : List<Room>.from(json["rooms"]!.map((x) => Room.fromJson(x))),
        eur: json["eur"],
        usd: json["usd"],
        bannerImageUrl: json["banner_image_url"],
        galleryImagesUrl: json["gallery_images_url"] == null
            ? []
            : List<GalleryImagesUrl>.from(json["gallery_images_url"]!
                .map((x) => GalleryImagesUrl.fromJson(x))),
        attributes: Map.from(json["attributes"]!).map(
            (k, v) => MapEntry<String, Attribute>(k, Attribute.fromJson(v))),
        attributes1: json["attributes1"] == null
            ? []
            : List<Attribute>.from(
                json["attributes1"]!.map((x) => Attribute.fromJson(x))),
        hotelRelated: json["hotel_related"] == null
            ? []
            : List<HotelRelated>.from(
                json["hotel_related"]!.map((x) => HotelRelated.fromJson(x))),
        reviewList: json["review_list"] == null
            ? []
            : List<dynamic>.from(json["review_list"]!.map((x) => x)),
        reviewScale: json["review_scale"] == null
            ? []
            : List<ReviewScale>.from(
                json["review_scale"]!.map((x) => ReviewScale.fromJson(x))),
        moyRate: json["moy_rate"],
        canreview: json["canreview"],
      );

  Map<String, dynamic> toJson() => {
        "row": row?.toJson(),
        "rooms": rooms == null
            ? []
            : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "eur": eur,
        "usd": usd,
        "banner_image_url": bannerImageUrl,
        "gallery_images_url": galleryImagesUrl == null
            ? []
            : List<dynamic>.from(galleryImagesUrl!.map((x) => x.toJson())),
        "attributes": Map.from(attributes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "attributes1": attributes1 == null
            ? []
            : List<dynamic>.from(attributes1!.map((x) => x.toJson())),
        "hotel_related": hotelRelated == null
            ? []
            : List<dynamic>.from(hotelRelated!.map((x) => x.toJson())),
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

class Attribute {
  final String? parent;
  final List<String>? translateParent;
  final List<String>? child;
  final List<String>? tranlation;

  Attribute({
    this.parent,
    this.translateParent,
    this.child,
    this.tranlation,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        parent: json["parent"],
        translateParent: json["translate parent"] == null
            ? []
            : List<String>.from(json["translate parent"]!.map((x) => x)),
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

class HotelRelated {
  final int? id;
  final String? slug;
  final String? title;
  final int? perpMaxPersons;
  final int? perPerson;
  final dynamic isFeatured;
  final int? locationId;
  final String? price;
  final dynamic salePrice;
  final String? address;
  final String? impactsocial;
  final dynamic promotion;
  final int? imageId;
  final String? imageUrl;
  final String? termName;
  final List<Room>? rooms;
  final Location? location;
  final List<dynamic>? translations;
  final dynamic hasWishList;

  HotelRelated({
    this.id,
    this.slug,
    this.title,
    this.perpMaxPersons,
    this.perPerson,
    this.isFeatured,
    this.locationId,
    this.price,
    this.salePrice,
    this.address,
    this.impactsocial,
    this.promotion,
    this.imageId,
    this.imageUrl,
    this.termName,
    this.rooms,
    this.location,
    this.translations,
    this.hasWishList,
  });

  factory HotelRelated.fromJson(Map<String, dynamic> json) => HotelRelated(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        perpMaxPersons: json["perp_max_persons"],
        perPerson: json["per_person"],
        isFeatured: json["is_featured"],
        locationId: json["location_id"],
        price: json["price"],
        salePrice: json["sale_price"],
        address: json["address"],
        impactsocial: json["impactsocial"],
        promotion: json["promotion"],
        imageId: json["image_id"],
        imageUrl: json["IMAGE_URL"],
        termName: json["term_name"],
        rooms: json["rooms"] == null
            ? []
            : List<Room>.from(json["rooms"]!.map((x) => Room.fromJson(x))),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        hasWishList: json["has_wish_list"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "perp_max_persons": perpMaxPersons,
        "per_person": perPerson,
        "is_featured": isFeatured,
        "location_id": locationId,
        "price": price,
        "sale_price": salePrice,
        "address": address,
        "impactsocial": impactsocial,
        "promotion": promotion,
        "image_id": imageId,
        "IMAGE_URL": imageUrl,
        "term_name": termName,
        "rooms": rooms == null
            ? []
            : List<dynamic>.from(rooms!.map((x) => x.toJson())),
        "location": location?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "has_wish_list": hasWishList,
      };
}

class Location {
  final int? id;
  final String? name;
  final String? content;
  final String? slug;
  final int? imageId;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final String? status;
  final int? lft;
  final int? rgt;
  final dynamic parentId;
  final int? createUser;
  final int? updateUser;
  final dynamic deletedAt;
  final dynamic originId;
  final dynamic lang;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? bannerImageId;
  final List<TripIdea>? tripIdeas;
  final List<Translation>? translations;

  Location({
    this.id,
    this.name,
    this.content,
    this.slug,
    this.imageId,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.status,
    this.lft,
    this.rgt,
    this.parentId,
    this.createUser,
    this.updateUser,
    this.deletedAt,
    this.originId,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.bannerImageId,
    this.tripIdeas,
    this.translations,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        slug: json["slug"],
        imageId: json["image_id"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        status: json["status"],
        lft: json["_lft"],
        rgt: json["_rgt"],
        parentId: json["parent_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        bannerImageId: json["banner_image_id"],
        tripIdeas: json["trip_ideas"] == null
            ? []
            : List<TripIdea>.from(
                json["trip_ideas"]!.map((x) => TripIdea.fromJson(x))),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "slug": slug,
        "image_id": imageId,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "status": status,
        "_lft": lft,
        "_rgt": rgt,
        "parent_id": parentId,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "banner_image_id": bannerImageId,
        "trip_ideas": tripIdeas == null
            ? []
            : List<dynamic>.from(tripIdeas!.map((x) => x.toJson())),
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
  final String? content;
  final int? createUser;
  final int? updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<TripIdea>? tripIdeas;

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
    this.tripIdeas,
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
        tripIdeas: json["trip_ideas"] == null
            ? []
            : List<TripIdea>.from(
                json["trip_ideas"]!.map((x) => TripIdea.fromJson(x))),
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
        "trip_ideas": tripIdeas == null
            ? []
            : List<dynamic>.from(tripIdeas!.map((x) => x.toJson())),
      };
}

class TripIdea {
  final dynamic imageId;
  final dynamic title;
  final dynamic link;
  final dynamic content;

  TripIdea({
    this.imageId,
    this.title,
    this.link,
    this.content,
  });

  factory TripIdea.fromJson(Map<String, dynamic> json) => TripIdea(
        imageId: json["image_id"],
        title: json["title"],
        link: json["link"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "title": title,
        "link": link,
        "content": content,
      };
}

class Room {
  final int? id;
  final String? title;
  final String? content;
  final int? imageId;
  final String? gallery;
  final dynamic video;
  final String? price;
  final int? parentId;
  final int? number;
  final int? beds;
  final dynamic size;
  final int? adults;
  final int? children;
  final String? status;
  final int? createUser;
  final int? updateUser;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic perpChildPrice;
  final List<dynamic>? translations;

  Room({
    this.id,
    this.title,
    this.content,
    this.imageId,
    this.gallery,
    this.video,
    this.price,
    this.parentId,
    this.number,
    this.beds,
    this.size,
    this.adults,
    this.children,
    this.status,
    this.createUser,
    this.updateUser,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.perpChildPrice,
    this.translations,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageId: json["image_id"],
        gallery: json["gallery"],
        video: json["video"],
        price: json["price"],
        parentId: json["parent_id"],
        number: json["number"],
        beds: json["beds"],
        size: json["size"],
        adults: json["adults"],
        children: json["children"],
        status: json["status"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        perpChildPrice: json["perp_child_price"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image_id": imageId,
        "gallery": gallery,
        "video": video,
        "price": price,
        "parent_id": parentId,
        "number": number,
        "beds": beds,
        "size": size,
        "adults": adults,
        "children": children,
        "status": status,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "perp_child_price": perpChildPrice,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}

class ReviewScale {
  final String? title;
  final int? stars;

  ReviewScale({
    this.title,
    this.stars,
  });

  factory ReviewScale.fromJson(Map<String, dynamic> json) => ReviewScale(
        title: json["title"],
        stars: json["stars"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "stars": stars,
      };
}

class Row {
  final int? id;
  final String? title;
  final String? content;
  final int? isFeatured;
  final int? bannerImageId;
  final String? gallery;
  final String? checkInTime;
  final String? checkOutTime;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final String? locationName;
  final String? translationLocationName;
  final String? price;
  final String? perPerson;
  final String? perPersonTranslation;
  final dynamic minPerson;
  final int? promoCode;
  final String? maxPerson;
  final List<ExtraPrice>? extraPrice;
  final dynamic salePrice;
  final String? address;
  final String? impactsocial;
  final String? translationImpactsocial;
  final dynamic promotion;
  final int? minNuits;
  final dynamic location;
  final List<dynamic>? translations;
  final List<Term>? terms;

  Row({
    this.id,
    this.title,
    this.content,
    this.isFeatured,
    this.bannerImageId,
    this.gallery,
    this.checkInTime,
    this.checkOutTime,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.locationName,
    this.translationLocationName,
    this.price,
    this.perPerson,
    this.perPersonTranslation,
    this.minPerson,
    this.promoCode,
    this.maxPerson,
    this.extraPrice,
    this.salePrice,
    this.address,
    this.impactsocial,
    this.translationImpactsocial,
    this.promotion,
    this.minNuits,
    this.location,
    this.translations,
    this.terms,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        isFeatured: json["is_featured"],
        bannerImageId: json["banner_image_id"],
        gallery: json["gallery"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        locationName: json["location_name"],
        translationLocationName: json["translation_location_name"],
        price: json["price"],
        perPerson: json["per_person"],
        perPersonTranslation: json["per_person_translation"],
        minPerson: json["min_person"],
        promoCode: json["promo_code"],
        maxPerson: json["max_person"],
        extraPrice: json["extra_price"] == null
            ? []
            : List<ExtraPrice>.from(
                json["extra_price"]!.map((x) => ExtraPrice.fromJson(x))),
        salePrice: json["sale_price"],
        address: json["address"],
        impactsocial: json["impactsocial"],
        translationImpactsocial: json["translation_impactsocial"],
        promotion: json["promotion"],
        minNuits: json["min_nuits"],
        location: json["location"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        terms: json["terms"] == null
            ? []
            : List<Term>.from(json["terms"]!.map((x) => Term.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "is_featured": isFeatured,
        "banner_image_id": bannerImageId,
        "gallery": gallery,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "location_name": locationName,
        "translation_location_name": translationLocationName,
        "price": price,
        "per_person": perPerson,
        "per_person_translation": perPersonTranslation,
        "min_person": minPerson,
        "promo_code": promoCode,
        "max_person": maxPerson,
        "extra_price": extraPrice == null
            ? []
            : List<dynamic>.from(extraPrice!.map((x) => x.toJson())),
        "sale_price": salePrice,
        "address": address,
        "impactsocial": impactsocial,
        "translation_impactsocial": translationImpactsocial,
        "promotion": promotion,
        "min_nuits": minNuits,
        "location": location,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "terms": terms == null
            ? []
            : List<dynamic>.from(terms!.map((x) => x.toJson())),
      };
}

class Term {
  final int? id;
  final int? termId;
  final int? targetId;
  final int? createUser;
  final dynamic updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Term({
    this.id,
    this.termId,
    this.targetId,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        id: json["id"],
        termId: json["term_id"],
        targetId: json["target_id"],
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
        "target_id": targetId,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
