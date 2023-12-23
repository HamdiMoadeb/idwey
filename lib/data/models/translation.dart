class Translation {
  final int? id;
  final int? originId;
  final String? locale;
  final String? name;
  final dynamic content;
  final int? createUser;
  final dynamic updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Translation({
    this.id,
    this.originId,
    this.locale,
    this.name,
    this.content,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        originId: json["origin_id"],
        locale: json["locale"],
        name: json["name"],
        content: json["content"],
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
        "origin_id": originId,
        "locale": locale,
        "name": name,
        "content": content,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
