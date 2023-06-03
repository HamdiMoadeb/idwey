// To parse this JSON data, do
//
//     final room = roomFromJson(jsonString);

import 'dart:convert';

import 'package:idwey/models/imageGallery.dart';

Room roomFromJson(String str) => Room.fromJson(json.decode(str));

String roomToJson(Room data) => json.encode(data.toJson());

class Room {
  final int? id;
  final String? title;
  final dynamic content;
  final String? imageId;
  final List<Images>? gallery;
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
        imageId: json["image_id"],
        gallery: json["gallery"] == null
            ? []
            : List<Images>.from(
                json["gallery"]!.map((x) => Images.fromJson(x))),
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
