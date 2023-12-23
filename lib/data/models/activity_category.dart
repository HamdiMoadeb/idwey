import 'package:idwey/data/models/translation.dart';

class ActivityCategory {
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
  final dynamic originId;
  final dynamic lang;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Translation>? translations;
  final List<dynamic>? children;

  ActivityCategory({
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
    this.originId,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.translations,
    this.children,
  });

  factory ActivityCategory.fromJson(Map<String, dynamic> json) =>
      ActivityCategory(
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
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
        children: json["children"] == null
            ? []
            : List<dynamic>.from(json["children"]!.map((x) => x)),
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
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}
