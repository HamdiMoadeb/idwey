class Testimonial {
  String? name;
  String? desc;
  int? number_star;
  String? avatar_url;

  Testimonial(
    this.name,
    this.desc,
    this.avatar_url,
    this.number_star,
  );

  factory Testimonial.fromJson(Map<String?, dynamic> data) {
    return Testimonial(
      data['name'] == null ? "" : data['name'] as String,
      data['desc'] == null ? "" : data['desc'] as String,
      data['avatar_url'] == null ? "" : data['avatar_url'] as String,
      data['number_star'] as int,
    );
  }
}
