// To parse this JSON data, do
//
//     final hostDetail = hostDetailFromJson(jsonString);

import 'dart:convert';

import 'package:idwey/models/room.dart';

import 'imageGallery.dart';
import 'models.dart';

HostDetail hostDetailFromJson(String str) =>
    HostDetail.fromJson(json.decode(str));

String hostDetailToJson(HostDetail data) => json.encode(data.toJson());

class HostDetail {
  final Host? host;
  final List<Room>? rooms;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final List<Gallery>? galleryImagesUrl;
  final Map<String, dynamic>? attributes;
  final List<dynamic>? hotelRelated;
  final ReviewList? reviewList;
  List<String>? conveniences;
  List<String>? type;

  HostDetail({
    this.host,
    this.rooms,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.attributes,
    this.hotelRelated,
    this.reviewList,
    this.conveniences,
    this.type,
  });

  factory HostDetail.fromJson(Map<String, dynamic> json) {
    var typeFromJson = json['attributes']['5']['child'];
    List<String> types = new List<String>.from(typeFromJson);
    var convenienceFromJson = json['attributes']['6']['child'];
    List<String> conveniences = new List<String>.from(convenienceFromJson);
    var listImages = json['gallery_images_url'] as List;
    List<Gallery> images = listImages.map((i) => Gallery.fromJson(i)).toList();
    images.removeLast();
    return HostDetail(
      host: json["row"] == null ? null : Host.fromJson(json["row"]),
      rooms: json["rooms"] == null
          ? []
          : List<Room>.from(json["rooms"]!.map((x) => Room.fromJson(x))),
      eur: json["eur"],
      usd: json["usd"],
      bannerImageUrl: json["banner_image_url"],
      galleryImagesUrl: json["gallery_images_url"] == null ? [] : images,
      attributes: Map.from(json["attributes"])
          .map((k, v) => MapEntry<String, dynamic>(k, v)),
      hotelRelated: json["hotel_related"] == null
          ? []
          : List<dynamic>.from(json["hotel_related"]!.map((x) => x)),
      reviewList: json["review_list"] == null
          ? null
          : ReviewList.fromJson(json["review_list"]),
      conveniences: conveniences,
      type: types,
    );
  }

  Map<String, dynamic> toJson() => {
        "row": host?.toJson(),
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
