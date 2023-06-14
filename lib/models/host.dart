import 'dart:convert';

import 'package:idwey/models/room.dart';

import 'imageGallery.dart';

class Host {
  int? id;
  String? title;
  int? max_person;
  int? is_featured;
  int? has_room;
  String? per_person;
  String? location_name;
  String? price;
  String? address;
  String? impactsocial;
  String? IMAGE_URL;
  String? term_name;
  String? typeHost;
  final List<Room>? rooms;

  Host(
    this.id,
    this.title,
    this.address,
    this.IMAGE_URL,
    this.impactsocial,
    this.is_featured,
    this.per_person,
    this.location_name,
    this.max_person,
    this.price,
    this.term_name,
    this.has_room,
    this.typeHost,
    this.rooms,
  );

  factory Host.fromJson(Map<String?, dynamic> data) {
    return Host(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['address'] == null ? "" : data['address'] as String,
      data['IMAGE_URL'] == null ? "" : data['IMAGE_URL'] as String,
      data['impactsocial'] == null
          ? ""
          : data['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
      data['is_featured'] == null ? -1 : data['is_featured'] as int,
      data['per_person'] == null ? "" : data['per_person'] as String,
      data['location_name'] == null ? "" : data['location_name'] as String,
      data['max_person'] == null ? -1 : data['max_person'] as int,
      data['price'] == null ? "" : data['price'] as String,
      data['term_name'] == null ? "" : data['term_name'] as String,
      data['has_room'] == null ? -1 : data['has_room'] as int,
      data['type_host'] == null ? "" : data['type_host'] as String,
      data["rooms"] == null
          ? []
          : List<Room>.from(data["rooms"]!.map((x) => Room.fromJson(x))),
    );
  }
}

class HostDetail {
  int id;
  String title;
  int max_person;
  int is_featured;
  String per_person;
  String location_name;
  String price;
  String address;
  String impactsocial;
  String term_name;
  String content;
  String banner_image_url;
  List<Images> gallery_images_url;
  String check_in_time;
  String check_out_time;
  List<String> type;
  double? map_lat;
  double? map_lng;
  List<String>? convenience;
  String? typeHost;
  List<Room>? rooms;

  HostDetail(
    this.id,
    this.title,
    this.content,
    this.address,
    this.impactsocial,
    this.type,
    this.is_featured,
    this.per_person,
    this.location_name,
    this.max_person,
    this.price,
    this.term_name,
    this.banner_image_url,
    this.gallery_images_url,
    this.check_in_time,
    this.check_out_time,
    this.map_lat,
    this.map_lng,
    this.convenience,
    this.typeHost,
    this.rooms,
  );

  factory HostDetail.fromJson(Map<String?, dynamic> data) {
    var listImages = data['gallery_images_url'] as List;
    List<Images> images = listImages.map((i) => Images.fromJson(i)).toList();
    images.removeLast();
    var row = data['row'];
    var typeFromJson = data['attributes']['5']['child'];
    List<String> types = List<String>.from(typeFromJson);
    print("conveniences666666");
    print(data['attributes']);
    var convenienceFromJson =
        data['attributes']['6'] == null ? [] : data['attributes']['6']['child'];
    print("conveniencde from json");
    print(convenienceFromJson);
    List<String> conveniences =
        convenienceFromJson == [] || convenienceFromJson == null
            ? []
            : List<String>.from(convenienceFromJson);

    return HostDetail(
      row['id'] == null ? 0 : row['id'] as int,
      row['title'] == null ? "" : row['title'] as String,
      row['content'] == null ? "" : row['content'] as String,
      row['address'] == null ? "" : row['address'] as String,
      row['impactsocial'] == null
          ? ""
          : row['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
      data['attributes']['5']['child'] == null ? [] : types,
      row['is_featured'] == null ? -1 : row['is_featured'] as int,
      row['per_person'] == null ? "" : row['per_person'] as String,
      row['location_name'] == null ? "" : row['location_name'] as String,
      row['max_person'] == null ? -1 : int.parse(row['max_person'].toString()),
      row['price'] == null ? "" : row['price'] as String,
      row['term_name'] == null ? "" : row['term_name'] as String,
      data['banner_image_url'] == null
          ? ""
          : data['banner_image_url'] as String,
      data['gallery_images_url'] == null ? [] : images,
      row['check_in_time'] == null ? "" : row['check_in_time'] as String,
      row['check_out_time'] == null ? "" : row['check_out_time'] as String,
      row['map_lat'] == null ? 0 : double.parse(row['map_lat']),
      row['map_lng'] == null ? 0 : double.parse(row['map_lng']),
      data['attributes']['6'] == null ? [] : conveniences as List<String>,
      row['type_host'] == null ? "" : row['type_host'] as String,
      data["rooms"] == null
          ? []
          : List<Room>.from(data["rooms"]!.map((x) => Room.fromJson(x))),
    );
  }
}
