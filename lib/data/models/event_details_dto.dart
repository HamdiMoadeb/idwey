// To parse this JSON data, do
//
//     final eventDetailsDto = eventDetailsDtoFromJson(jsonString);

import 'dart:convert';

import 'package:idwey/data/models/review_dto.dart';

import 'review_scale_dto.dart';

EventDetailsDto eventDetailsDtoFromJson(String str) =>
    EventDetailsDto.fromJson(json.decode(str));

String eventDetailsDtoToJson(EventDetailsDto data) =>
    json.encode(data.toJson());

class EventDetailsDto {
  final Row? row;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final List<GalleryImagesUrl>? galleryImagesUrl;
  final bool? authorImageUrl;
  final Map<String, Attribute>? attributes;
  final List<Attribute>? attributes1;
  final int? remainingPlaces;
  final List<ReviewDto>? reviewList;
  final List<ReviewScale>? reviewScale;
  final int? moyRate;
  final int? canreview;

  EventDetailsDto({
    this.row,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.authorImageUrl,
    this.attributes,
    this.attributes1,
    this.remainingPlaces,
    this.reviewList,
    this.reviewScale,
    this.moyRate,
    this.canreview,
  });

  factory EventDetailsDto.fromJson(Map<String, dynamic> json) =>
      EventDetailsDto(
        row: json["row"] == null ? null : Row.fromJson(json["row"]),
        eur: json["eur"],
        usd: json["usd"],
        bannerImageUrl: json["banner_image_url"],
        galleryImagesUrl: json["gallery_images_url"] == null
            ? []
            : List<GalleryImagesUrl>.from(json["gallery_images_url"]!
                .map((x) => GalleryImagesUrl.fromJson(x))),
        authorImageUrl: true,
        attributes: Map.from(json["attributes"]!).map(
            (k, v) => MapEntry<String, Attribute>(k, Attribute.fromJson(v))),
        attributes1: json["attributes1"] == null
            ? []
            : List<Attribute>.from(
                json["attributes1"]!.map((x) => Attribute.fromJson(x))),
        remainingPlaces: json["remaining_places"],
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
        "author_image_url": authorImageUrl,
        "attributes": Map.from(attributes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "attributes1": attributes1 == null
            ? []
            : List<dynamic>.from(attributes1!.map((x) => x.toJson())),
        "remaining_places": remainingPlaces,
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

class Row {
  final int? id;
  final String? slug;
  final String? title;
  final String? content;
  final dynamic mapLat;
  final dynamic mapLng;
  final int? mapZoom;
  final int? bannerImageId;
  final String? locationName;
  final String? translationLocationName;
  final String? gallery;
  final DateTime? startDate;
  final dynamic isExpired;
  final DateTime? endDate;
  final dynamic isfull;
  final int? number;
  final String? distance;
  final String? difficulty;
  final int? promoCode;
  final String? translateDifficulty;
  final dynamic impactsocial;
  final dynamic extraPrice;
  final dynamic translationImpactsocial;
  final String? duration;
  final String? prix;
  final dynamic promotion;
  final dynamic salePrix;
  final dynamic address;
  final int? createUser;
  final int? imageId;
  final Author? author;
  final List<dynamic>? translations;
  final List<Term>? terms;

  Row({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.bannerImageId,
    this.locationName,
    this.translationLocationName,
    this.gallery,
    this.startDate,
    this.isExpired,
    this.endDate,
    this.isfull,
    this.number,
    this.distance,
    this.difficulty,
    this.promoCode,
    this.translateDifficulty,
    this.impactsocial,
    this.extraPrice,
    this.translationImpactsocial,
    this.duration,
    this.prix,
    this.promotion,
    this.salePrix,
    this.address,
    this.createUser,
    this.imageId,
    this.author,
    this.translations,
    this.terms,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        content: json["content"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        bannerImageId: json["banner_image_id"],
        locationName: json["location_name"],
        translationLocationName: json["translation_location_name"],
        gallery: json["gallery"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        isExpired: json["isExpired"],
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        isfull: json["isfull"],
        number: json["number"],
        distance: json["distance"],
        difficulty: json["difficulty"],
        promoCode: json["promo_code"],
        translateDifficulty: json["translate_difficulty"],
        impactsocial: json["impactsocial"],
        extraPrice: json["extra_price"],
        translationImpactsocial: json["translation_impactsocial"],
        duration: json["duration"],
        prix: json["prix"],
        salePrix: json["sale_prix"],
        promotion: json["promotion"],
        address: json["address"],
        createUser: json["create_user"],
        imageId: json["image_id"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        terms: json["terms"] == null
            ? []
            : List<Term>.from(json["terms"]!.map((x) => Term.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "content": content,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "banner_image_id": bannerImageId,
        "location_name": locationName,
        "translation_location_name": translationLocationName,
        "gallery": gallery,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "isExpired": isExpired,
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "isfull": isfull,
        "number": number,
        "distance": distance,
        "difficulty": difficulty,
        "promo_code": promoCode,
        "translate_difficulty": translateDifficulty,
        "impactsocial": impactsocial,
        "extra_price": extraPrice,
        "translation_impactsocial": translationImpactsocial,
        "duration": duration,
        "prix": prix,
        "promotion": promotion,
        "sale_prix": salePrix,
        "address": address,
        "create_user": createUser,
        "image_id": imageId,
        "author": author?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "terms": terms == null
            ? []
            : List<dynamic>.from(terms!.map((x) => x.toJson())),
      };
}

class Author {
  final int? id;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic address;
  final dynamic address2;
  final String? phone;
  final dynamic birthday;
  final dynamic city;
  final dynamic state;
  final dynamic country;
  final dynamic zipCode;
  final dynamic lastLoginAt;
  final dynamic avatarId;
  final dynamic bio;
  final String? status;
  final dynamic createUser;
  final dynamic updateUser;
  final dynamic vendorCommissionAmount;
  final dynamic vendorCommissionType;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic paymentGateway;
  final dynamic totalGuests;
  final dynamic locale;
  final String? businessName;
  final dynamic verifySubmitStatus;
  final dynamic isVerified;
  final dynamic job;
  final String? roleWp;
  final dynamic club;
  final dynamic interest;
  final int? monthPoint;
  final int? totalPoint;

  Author({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.address,
    this.address2,
    this.phone,
    this.birthday,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.lastLoginAt,
    this.avatarId,
    this.bio,
    this.status,
    this.createUser,
    this.updateUser,
    this.vendorCommissionAmount,
    this.vendorCommissionType,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.paymentGateway,
    this.totalGuests,
    this.locale,
    this.businessName,
    this.verifySubmitStatus,
    this.isVerified,
    this.job,
    this.roleWp,
    this.club,
    this.interest,
    this.monthPoint,
    this.totalPoint,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        address: json["address"],
        address2: json["address2"],
        phone: json["phone"],
        birthday: json["birthday"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
        lastLoginAt: json["last_login_at"],
        avatarId: json["avatar_id"],
        bio: json["bio"],
        status: json["status"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        vendorCommissionAmount: json["vendor_commission_amount"],
        vendorCommissionType: json["vendor_commission_type"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        paymentGateway: json["payment_gateway"],
        totalGuests: json["total_guests"],
        locale: json["locale"],
        businessName: json["business_name"],
        verifySubmitStatus: json["verify_submit_status"],
        isVerified: json["is_verified"],
        job: json["job"],
        roleWp: json["role_wp"],
        club: json["club"],
        interest: json["interest"],
        monthPoint: json["month_point"],
        totalPoint: json["total_point"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "address": address,
        "address2": address2,
        "phone": phone,
        "birthday": birthday,
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "last_login_at": lastLoginAt,
        "avatar_id": avatarId,
        "bio": bio,
        "status": status,
        "create_user": createUser,
        "update_user": updateUser,
        "vendor_commission_amount": vendorCommissionAmount,
        "vendor_commission_type": vendorCommissionType,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "payment_gateway": paymentGateway,
        "total_guests": totalGuests,
        "locale": locale,
        "business_name": businessName,
        "verify_submit_status": verifySubmitStatus,
        "is_verified": isVerified,
        "job": job,
        "role_wp": roleWp,
        "club": club,
        "interest": interest,
        "month_point": monthPoint,
        "total_point": totalPoint,
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
