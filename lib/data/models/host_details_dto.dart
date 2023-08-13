// To parse this JSON data, do
//
//     final hostDetails = hostDetailsFromJson(jsonString);

import 'dart:convert';

HostDetails hostDetailsFromJson(String str) =>
    HostDetails.fromJson(json.decode(str));

String hostDetailsToJson(HostDetails data) => json.encode(data.toJson());

class HostDetails {
  final Row? row;
  final List<Room>? rooms;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final List<Gallery>? galleryImagesUrl;
  final Map<String, Attribute>? attributes;
  final List<dynamic>? hotelRelated;
  final ReviewList? reviewList;

  HostDetails({
    this.row,
    this.rooms,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.attributes,
    this.hotelRelated,
    this.reviewList,
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
            : List<Gallery>.from(
                json["gallery_images_url"]!.map((x) => Gallery.fromJson(x))),
        attributes: Map.from(json["attributes"]!).map(
            (k, v) => MapEntry<String, Attribute>(k, Attribute.fromJson(v))),
        hotelRelated: json["hotel_related"] == null
            ? []
            : List<dynamic>.from(json["hotel_related"]!.map((x) => x)),
        reviewList: json["review_list"] == null
            ? null
            : ReviewList.fromJson(json["review_list"]),
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
        "hotel_related": hotelRelated == null
            ? []
            : List<dynamic>.from(hotelRelated!.map((x) => x)),
        "review_list": reviewList?.toJson(),
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

class Gallery {
  final dynamic large;
  final dynamic thumb;

  Gallery({
    this.large,
    this.thumb,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        large: json["large"] == false ? "" : json["large"],
        thumb: json["thumb"] == false ? "" : json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}

class ReviewList {
  final int? currentPage;
  final List<dynamic>? data;
  final String? firstPageUrl;
  final dynamic from;
  final int? lastPage;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final String? path;
  final String? perPage;
  final dynamic prevPageUrl;
  final dynamic to;
  final int? total;

  ReviewList({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<dynamic>.from(json["data"]!.map((x) => x)),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Room {
  final int? id;
  final String? title;
  final dynamic content;
  final String? imageId;
  final List<Gallery>? gallery;
  final dynamic video;
  final String? price;
  final int? parentId;
  final dynamic number;
  final int? beds;
  final dynamic size;
  final int? adults;
  final int? children;
  final String? status;
  final int? createUser;
  final dynamic updateUser;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic perpChildPrice;

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
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        imageId: json["image_id"] is String == true ? json["image_id"] : "",
        gallery: json["gallery"] == null || json["gallery"] is String == true
            ? []
            : List<Gallery>.from(
                json["gallery"]!.map((x) => Gallery.fromJson(x))),
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image_id": imageId,
        "gallery": gallery == null
            ? []
            : List<dynamic>.from(gallery!.map((x) => x.toJson())),
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
      };
}

class Row {
  final int? id;
  final String? title;
  final String? content;
  final dynamic isFeatured;
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
  final int? minPerson;
  final int? promoCode;
  final String? maxPerson;
  final dynamic extraPrice;
  final dynamic salePrice;
  final String? address;
  final dynamic impactsocial;
  final dynamic translationImpactsocial;
  final dynamic promotion;
  final dynamic minNuits;
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
        extraPrice: json["extra_price"],
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
        "extra_price": extraPrice,
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
