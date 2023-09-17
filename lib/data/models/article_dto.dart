import 'dart:convert';

ArticleDto articleDtoFromJson(String str) =>
    ArticleDto.fromJson(json.decode(str));

String articleDtoToJson(ArticleDto data) => json.encode(data.toJson());

class ArticleDto {
  final int? id;
  final String? slug;
  final String? title;
  final String? content;
  final int? catId;
  final String? imageId;
  final DateTime? createdAt;
  final String? catName;
  final List<dynamic>? getAuthor;
  final List<dynamic>? translations;
  final GetCategory? getCategory;

  ArticleDto({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.catId,
    this.imageId,
    this.createdAt,
    this.catName,
    this.getAuthor,
    this.translations,
    this.getCategory,
  });

  factory ArticleDto.fromJson(Map<String, dynamic> json) => ArticleDto(
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
        getAuthor: json["get_author"] == null
            ? []
            : List<dynamic>.from(json["get_author"]!.map((x) => x)),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        getCategory: json["get_category"] == null
            ? null
            : GetCategory.fromJson(json["get_category"]),
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
        "get_author": getAuthor == null
            ? []
            : List<dynamic>.from(getAuthor!.map((x) => x)),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "get_category": getCategory?.toJson(),
      };
}

class GetCategory {
  final int? id;
  final String? name;
  final dynamic content;
  final String? slug;
  final String? status;
  final int? lft;
  final int? rgt;
  final dynamic parentId;
  final int? createUser;
  final int? updateUser;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic originId;
  final dynamic lang;

  GetCategory({
    this.id,
    this.name,
    this.content,
    this.slug,
    this.status,
    this.lft,
    this.rgt,
    this.parentId,
    this.createUser,
    this.updateUser,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.originId,
    this.lang,
  });

  factory GetCategory.fromJson(Map<String, dynamic> json) => GetCategory(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        slug: json["slug"],
        status: json["status"],
        lft: json["_lft"],
        rgt: json["_rgt"],
        parentId: json["parent_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        originId: json["origin_id"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "slug": slug,
        "status": status,
        "_lft": lft,
        "_rgt": rgt,
        "parent_id": parentId,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "origin_id": originId,
        "lang": lang,
      };
}
