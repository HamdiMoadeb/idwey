class Destination {
  int? id;
  String? name;
  String? image_id;

  Destination(
    this.id,
    this.name,
    this.image_id,
  );

  factory Destination.fromJson(Map<String?, dynamic> data) {
    return Destination(
      data['id'] as int,
      data['name'] == null ? "" : data['name'] as String,
      data['image_id'] == null ? "" : data['image_id'] as String,
    );
  }
}
