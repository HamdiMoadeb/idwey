// To parse this JSON data, do
//
//     final eventDetailsDto = eventDetailsDtoFromJson(jsonString);

import 'dart:convert';

EventDetailsDto eventDetailsDtoFromJson(String str) =>
    EventDetailsDto.fromJson(json.decode(str));

String eventDetailsDtoToJson(EventDetailsDto data) =>
    json.encode(data.toJson());

class EventDetailsDto {
  final Row? row;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final dynamic galleryImagesUrl;
  final String? authorImageUrl;
  final Map<String, Attribute>? attributes;
  final List<CarRelated>? carRelated;
  final int? remainingPlaces;
  final ReviewList? reviewList;

  EventDetailsDto({
    this.row,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.authorImageUrl,
    this.attributes,
    this.carRelated,
    this.remainingPlaces,
    this.reviewList,
  });

  factory EventDetailsDto.fromJson(Map<String, dynamic> json) =>
      EventDetailsDto(
        row: json["row"] == null ? null : Row.fromJson(json["row"]),
        eur: json["eur"],
        usd: json["usd"],
        bannerImageUrl: json["banner_image_url"],
        galleryImagesUrl: json["gallery_images_url"],
        authorImageUrl: json["author_image_url"] is String
            ? json["author_image_url"]
            : null,
        attributes: Map.from(json["attributes"]!).map(
            (k, v) => MapEntry<String, Attribute>(k, Attribute.fromJson(v))),
        carRelated: json["car_related"] == null
            ? []
            : List<CarRelated>.from(
                json["car_related"]!.map((x) => CarRelated.fromJson(x))),
        remainingPlaces: json["remaining_places"],
        reviewList: json["review_list"] == null
            ? null
            : ReviewList.fromJson(json["review_list"]),
      );

  Map<String, dynamic> toJson() => {
        "row": row?.toJson(),
        "eur": eur,
        "usd": usd,
        "banner_image_url": bannerImageUrl,
        "gallery_images_url": galleryImagesUrl,
        "author_image_url": authorImageUrl,
        "attributes": Map.from(attributes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "car_related": carRelated == null
            ? []
            : List<dynamic>.from(carRelated!.map((x) => x.toJson())),
        "remaining_places": remainingPlaces,
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

class CarRelated {
  final int? id;
  final String? slug;
  final String? title;
  final DateTime? startDate;
  final int? number;
  final String? difficulty;
  final dynamic distance;
  final String? duration;
  final int? price;
  final dynamic salePrice;
  final dynamic address;
  final String? impactsocial;
  final int? imageId;
  final String? imageUrl;
  final String? termsName;

  CarRelated({
    this.id,
    this.slug,
    this.title,
    this.startDate,
    this.number,
    this.difficulty,
    this.distance,
    this.duration,
    this.price,
    this.salePrice,
    this.address,
    this.impactsocial,
    this.imageId,
    this.imageUrl,
    this.termsName,
  });

  factory CarRelated.fromJson(Map<String, dynamic> json) => CarRelated(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        number: json["number"],
        difficulty: json["difficulty"],
        distance: json["distance"],
        duration: json["duration"],
        price: json["price"],
        salePrice: json["sale_price"],
        address: json["address"],
        impactsocial: json["impactsocial"],
        imageId: json["image_id"],
        imageUrl: json["IMAGE_URL"],
        termsName: json["terms_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "number": number,
        "difficulty": difficulty,
        "distance": distance,
        "duration": duration,
        "price": price,
        "sale_price": salePrice,
        "address": address,
        "impactsocial": impactsocial,
        "image_id": imageId,
        "IMAGE_URL": imageUrl,
        "terms_name": termsName,
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

class Row {
  final int? id;
  final String? slug;
  final String? title;
  final String? content;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final int? bannerImageId;
  final String? locationName;
  final String? translationLocationName;
  final dynamic gallery;
  final DateTime? startDate;
  final int? isExpired;
  final DateTime? endDate;
  final dynamic isfull;
  final int? number;
  final String? distance;
  final String? difficulty;
  final int? promoCode;
  final String? translateDifficulty;
  final String? impactsocial;
  final ExtraPrice? extraPrice;
  final String? translationImpactsocial;
  final dynamic duration;
  final String? prix;
  final dynamic salePrix;
  final String? address;
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
        translationImpactsocial: json["translation_impactsocial"],
        duration: json["duration"],
        prix: json["prix"],
        salePrix: json["sale_prix"],
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
        "extra_price": extraPrice?.toJson(),
        "translation_impactsocial": translationImpactsocial,
        "duration": duration,
        "prix": prix,
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
  final String? address;
  final dynamic address2;
  final String? phone;
  final dynamic birthday;
  final String? city;
  final dynamic state;
  final String? country;
  final int? zipCode;
  final dynamic lastLoginAt;
  final int? avatarId;
  final String? bio;
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
  final String? job;
  final String? roleWp;
  final dynamic club;
  final List<String>? interest;

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
        interest: json["interest"] == null
            ? []
            : List<String>.from(json["interest"]!.map((x) => x)),
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
        "interest":
            interest == null ? [] : List<dynamic>.from(interest!.map((x) => x)),
      };
}

class ExtraPrice {
  final The4? the4;

  ExtraPrice({
    this.the4,
  });

  factory ExtraPrice.fromJson(Map<String, dynamic> json) => ExtraPrice(
        the4: json["4"] == null ? null : The4.fromJson(json["4"]),
      );

  Map<String, dynamic> toJson() => {
        "4": the4?.toJson(),
      };
}

class The4 {
  final String? name;
  final String? nameEn;
  final String? price;
  final String? type;

  The4({
    this.name,
    this.nameEn,
    this.price,
    this.type,
  });

  factory The4.fromJson(Map<String, dynamic> json) => The4(
        name: json["name"],
        nameEn: json["name_en"],
        price: json["price"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "name_en": nameEn,
        "price": price,
        "type": type,
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
