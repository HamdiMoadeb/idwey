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
    );
  }
}
