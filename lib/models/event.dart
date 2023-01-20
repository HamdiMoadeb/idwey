class Event {
  int? id;
  String? title;
  String? start_date;
  int? number;
  int? is_featured;
  String? difficulty;
  String? duration;
  int? price;
  String? address;
  String? impactsocial;
  String? IMAGE_URL;
  String? terms_name;

  Event(
    this.id,
    this.title,
    this.address,
    this.IMAGE_URL,
    this.impactsocial,
    this.is_featured,
    this.start_date,
    this.number,
    this.price,
    this.duration,
    this.difficulty,
    this.terms_name,
  );

  factory Event.fromJson(Map<String?, dynamic> data) {
    return Event(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['address'] == null ? "" : data['address'] as String,
      data['IMAGE_URL'] == null ? "" : data['IMAGE_URL'] as String,
      data['impactsocial'] == null ? "" : data['impactsocial'] as String,
      data['is_featured'] == null ? -1 : data['is_featured'] as int,
      data['start_date'] == null ? "" : data['start_date'] as String,
      data['number'] == null ? -1 : data['number'] as int,
      data['price'] == null ? -1 : data['price'] as int,
      data['duration'] == null ? "" : data['duration'] as String,
      data['difficulty'] == null ? "" : data['difficulty'] as String,
      data['terms_name'] == null ? "" : data['terms_name'] as String,
    );
  }
}
