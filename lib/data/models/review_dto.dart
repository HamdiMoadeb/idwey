// To parse this JSON data, do
//
//     final reviewDto = reviewDtoFromJson(jsonString);

import 'dart:convert';

ReviewDto reviewDtoFromJson(String str) => ReviewDto.fromJson(json.decode(str));

String reviewDtoToJson(ReviewDto data) => json.encode(data.toJson());

class ReviewDto {
  final int? id;
  final String? content;
  final int? rateNumber;
  final List<ReviewMeta>? reviewMeta;
  final int? createUser;
  final DateTime? createdAt;
  final Author? author;

  ReviewDto({
    this.id,
    this.content,
    this.rateNumber,
    this.reviewMeta,
    this.createUser,
    this.createdAt,
    this.author,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) => ReviewDto(
        id: json["id"],
        content: json["content"],
        rateNumber: json["rate_number"],
        reviewMeta: json["review_meta"] == null
            ? []
            : List<ReviewMeta>.from(
                json["review_meta"]!.map((x) => ReviewMeta.fromJson(x))),
        createUser: json["create_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "rate_number": rateNumber,
        "review_meta": reviewMeta == null
            ? []
            : List<dynamic>.from(reviewMeta!.map((x) => x.toJson())),
        "create_user": createUser,
        "created_at": createdAt?.toIso8601String(),
        "author": author?.toJson(),
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
  final String? country;
  final dynamic zipCode;
  final dynamic lastLoginAt;
  final dynamic avatarId;
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
  final dynamic businessName;
  final dynamic verifySubmitStatus;
  final dynamic isVerified;
  final dynamic job;
  final String? roleWp;
  final dynamic club;
  final List<String>? interest;
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
        interest: json["interest"] == null
            ? []
            : List<String>.from(json["interest"]!.map((x) => x)),
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
        "interest":
            interest == null ? [] : List<dynamic>.from(interest!.map((x) => x)),
        "month_point": monthPoint,
        "total_point": totalPoint,
      };
}

class ReviewMeta {
  final String? stars;
  final String? title;

  ReviewMeta({
    this.stars,
    this.title,
  });

  factory ReviewMeta.fromJson(Map<String, dynamic> json) => ReviewMeta(
        stars: json["stars"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "stars": stars,
        "title": title,
      };
}
