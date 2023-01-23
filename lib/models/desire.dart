class Desire {
  int? id;
  String? name;
  String? image_id;

  Desire(
    this.id,
    this.name,
    this.image_id,
  );

  factory Desire.fromJson(Map<String?, dynamic> data) {
    return Desire(
      data['id'] as int,
      data['name'] == null ? "" : data['name'] as String,
      data['image_id'] == null ? "" : data['image_id'] as String,
    );
  }
}
