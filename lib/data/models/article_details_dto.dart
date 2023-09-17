// To parse this JSON data, do
//
//     final articleDetailsDto = articleDetailsDtoFromJson(jsonString);

import 'dart:convert';

ArticleDetailsDto articleDetailsDtoFromJson(String str) =>
    ArticleDetailsDto.fromJson(json.decode(str));

String articleDetailsDtoToJson(ArticleDetailsDto data) =>
    json.encode(data.toJson());

class ArticleDetailsDto {
  final Row? row;
  final String? imageUrl;

  ArticleDetailsDto({
    this.row,
    this.imageUrl,
  });

  factory ArticleDetailsDto.fromJson(Map<String, dynamic> json) =>
      ArticleDetailsDto(
        row: json["row"] == null ? null : Row.fromJson(json["row"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "row": row?.toJson(),
        "image_url": imageUrl,
      };
}

class Row {
  final int? id;
  final String? slug;
  final String? title;
  final String? content;
  final int? catId;
  final int? imageId;
  final DateTime? createdAt;
  final String? catName;
  final dynamic catNameTranslation;

  Row({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.catId,
    this.imageId,
    this.createdAt,
    this.catName,
    this.catNameTranslation,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        content: json["content"],
        catId: json["cat_id"],
        imageId: json["image_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        catName: json["cat_name"],
        catNameTranslation: json["cat_name_translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "content": content,
        "cat_id": catId,
        "image_id": imageId,
        "created_at": createdAt?.toIso8601String(),
        "cat_name": catName,
        "cat_name_translation": catNameTranslation,
      };
}
