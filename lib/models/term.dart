import 'package:idwey/models/models.dart';

class Term {
  final int? id;
  final String? name;
  final dynamic content;
  final int? attrId;
  final String? slug;
  final int? createUser;
  final int? updateUser;
  final dynamic originId;
  final dynamic lang;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final dynamic imageId;
  final String? icon;
  final List<Translation>? translations;

  Term({
    this.id,
    this.name,
    this.content,
    this.attrId,
    this.slug,
    this.createUser,
    this.updateUser,
    this.originId,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageId,
    this.icon,
    this.translations,
  });

  factory Term.fromJson(Map<String, dynamic> json) => Term(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        attrId: json["attr_id"],
        slug: json["slug"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        imageId: json["image_id"],
        icon: json["icon"],
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "attr_id": attrId,
        "slug": slug,
        "create_user": createUser,
        "update_user": updateUser,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "image_id": imageId,
        "icon": icon,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}
