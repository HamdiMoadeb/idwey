import 'dart:convert';

import 'package:idwey/data/models/host_details_dto.dart';

ProductDetailsDto productDetailsDtoFromJson(String str) =>
    ProductDetailsDto.fromJson(json.decode(str));

String productDetailsDtoToJson(ProductDetailsDto data) =>
    json.encode(data.toJson());

class ProductDetailsDto {
  final Row? row;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final List<Gallery>? galleryImagesUrl;
  final bool? authorImageUrl;
  final Attributes? attributes;
  final int? availableNumber;

  ProductDetailsDto({
    this.row,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.authorImageUrl,
    this.attributes,
    this.availableNumber,
  });

  factory ProductDetailsDto.fromJson(Map<String, dynamic> json) =>
      ProductDetailsDto(
        row: json["row"] == null ? null : Row.fromJson(json["row"]),
        eur: json["eur"],
        usd: json["usd"],
        bannerImageUrl: json["banner_image_url"],
        galleryImagesUrl: json["gallery_images_url"] == null
            ? []
            : List<Gallery>.from(
                json["gallery_images_url"]!.map((x) => Gallery.fromJson(x))),
        authorImageUrl: json["author_image_url"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
        availableNumber: json["availableNumber"],
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
        "attributes": attributes?.toJson(),
        "availableNumber": availableNumber,
      };
}

class Attributes {
  final The3? the3;

  Attributes({
    this.the3,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        the3: json["3"] == null ? null : The3.fromJson(json["3"]),
      );

  Map<String, dynamic> toJson() => {
        "3": the3?.toJson(),
      };
}

class The3 {
  final String? parent;
  final List<String>? translateParent;
  final List<String>? child;
  final List<String>? tranlation;

  The3({
    this.parent,
    this.translateParent,
    this.child,
    this.tranlation,
  });

  factory The3.fromJson(Map<String, dynamic> json) => The3(
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
  final String? price;
  final int? promoCode;
  final dynamic extraPrice;
  final dynamic salePrice;
  final dynamic promotion;
  final int? bannerImageId;
  final String? gallery;
  final int? createUser;
  final Author? author;
  final List<dynamic>? translations;
  final List<Term>? terms;

  Row({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.price,
    this.promoCode,
    this.extraPrice,
    this.salePrice,
    this.bannerImageId,
    this.gallery,
    this.promotion,
    this.createUser,
    this.author,
    this.translations,
    this.terms,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        content: json["content"],
        price: json["price"],
        promoCode: json["promo_code"],
        extraPrice: json["extra_price"],
        salePrice: json["sale_price"],
        bannerImageId: json["banner_image_id"],
        gallery: json["gallery"],
        promotion: json["promotion"],
        createUser: json["create_user"],
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
        "price": price,
        "promo_code": promoCode,
        "extra_price": extraPrice,
        "sale_price": salePrice,
        "banner_image_id": bannerImageId,
        "gallery": gallery,
        "create_user": createUser,
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
        interest: json["interest"],
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
      };
}

class Term {
  final int? id;
  final int? termId;
  final int? targetId;
  final int? createUser;
  final int? updateUser;
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
