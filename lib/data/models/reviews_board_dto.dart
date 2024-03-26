// To parse this JSON data, do
//
//     final reviewsBoardDto = reviewsBoardDtoFromJson(jsonString);

import 'dart:convert';

ReviewsBoardDto reviewsBoardDtoFromJson(String str) =>
    ReviewsBoardDto.fromJson(json.decode(str));

String reviewsBoardDtoToJson(ReviewsBoardDto data) =>
    json.encode(data.toJson());

class ReviewsBoardDto {
  final List<Review>? reviews;
  final Notreviewed? notreviewed;

  ReviewsBoardDto({
    this.reviews,
    this.notreviewed,
  });

  factory ReviewsBoardDto.fromJson(Map<String, dynamic> json) =>
      ReviewsBoardDto(
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        notreviewed: json["notreviewed"] == null
            ? null
            : Notreviewed.fromJson(json["notreviewed"]),
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "notreviewed": notreviewed?.toJson(),
      };
}

class Notreviewed {
  final int? totalbookings;
  final List<Bookingsnotreviewed>? bookingsnotreviewed;

  Notreviewed({
    this.totalbookings,
    this.bookingsnotreviewed,
  });

  factory Notreviewed.fromJson(Map<String, dynamic> json) => Notreviewed(
        totalbookings: json["totalbookings"],
        bookingsnotreviewed: json["bookingsnotreviewed"] == null
            ? []
            : List<Bookingsnotreviewed>.from(json["bookingsnotreviewed"]!
                .map((x) => Bookingsnotreviewed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalbookings": totalbookings,
        "bookingsnotreviewed": bookingsnotreviewed == null
            ? []
            : List<dynamic>.from(bookingsnotreviewed!.map((x) => x.toJson())),
      };
}

class Bookingsnotreviewed {
  final int? id;
  final DateTime? createdAt;
  final String? objectModel;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? total;
  final int? objectId;
  final String? title;
  final String? address;
  final int? guests;
  final String? image;

  Bookingsnotreviewed({
    this.id,
    this.createdAt,
    this.objectModel,
    this.startDate,
    this.endDate,
    this.total,
    this.objectId,
    this.title,
    this.address,
    this.guests,
    this.image,
  });

  factory Bookingsnotreviewed.fromJson(Map<String, dynamic> json) =>
      Bookingsnotreviewed(
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        objectModel: json["object_model"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        total: json["total"],
        objectId: json["object_id"],
        title: json["title"],
        address: json["address"],
        guests: json["guests"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "object_model": objectModel,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "total": total,
        "object_id": objectId,
        "title": title,
        "address": address,
        "guests": guests,
        "image": image,
      };
}

class Review {
  final int? id;
  final String? content;
  final DateTime? createdAt;
  final List<ReviewMeta>? reviewMeta;
  final String? serviceTitle;
  final String? address;
  final int? globalStars;
  final String? objectModel;
  final String? image;

  Review( {
    this.id,
    this.content,
    this.createdAt,
    this.reviewMeta,
    this.serviceTitle,
    this.address,
    this.globalStars,
    this.objectModel,
    this.image,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        content: json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        reviewMeta: json["review_meta"] == null
            ? []
            : List<ReviewMeta>.from(
                json["review_meta"]!.map((x) => ReviewMeta.fromJson(x))),
        serviceTitle: json["service_title"],
        address: json["address"],
        globalStars: json["global_stars"],
        objectModel: json["object_model"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "review_meta": reviewMeta == null
            ? []
            : List<dynamic>.from(reviewMeta!.map((x) => x.toJson())),
        "service_title": serviceTitle,
        "address": address,
        "global_stars": globalStars,
        "object_model": objectModel,
        "image": image,
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
