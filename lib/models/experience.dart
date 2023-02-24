class Experience {
  int? id;
  String? title;
  int? max_people;
  int? is_featured;
  String? duration;
  String? price;
  String? address;
  String? impactsocial;
  String? IMAGE_URL;
  String? cat_name;

  Experience(
    this.id,
    this.title,
    this.address,
    this.IMAGE_URL,
    this.impactsocial,
    this.is_featured,
    this.duration,
    this.max_people,
    this.price,
    this.cat_name,
  );

  factory Experience.fromJson(Map<String?, dynamic> data) {
    return Experience(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['address'] == null ? "" : data['address'] as String,
      data['IMAGE_URL'] == null ? "" : data['IMAGE_URL'] as String,
      data['impactsocial'] == null
          ? ""
          : data['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
      data['is_featured'] == null ? -1 : data['is_featured'] as int,
      data['duration'] == null ? "" : data['duration'] as String,
      data['max_people'] == null ? -1 : data['max_people'] as int,
      data['price'] == null ? "" : data['price'] as String,
      data['cat_name'] == null ? "" : data['cat_name'] as String,
    );
  }
}
