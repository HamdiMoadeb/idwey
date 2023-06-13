import 'imageGallery.dart';

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

class ExperienceDetails {
  int? id;
  String? title;
  String slug;
  String content;
  String location_name;
  int? max_people;
  int? is_featured;
  String? duration;
  String? price;
  String? address;
  String? impactsocial;
  String? cat_name;
  String banner_image_url;
  List<Gallery> gallery_images_url;
  double map_lat;
  double map_lng;
  List<String>? convenience;

  ExperienceDetails(
      this.id,
      this.title,
      this.slug,
      this.content,
      this.location_name,
      this.address,
      this.impactsocial,
      this.is_featured,
      this.duration,
      this.max_people,
      this.price,
      this.cat_name,
      this.banner_image_url,
      this.gallery_images_url,
      this.map_lat,
      this.map_lng,
      this.convenience);

  factory ExperienceDetails.fromJson(Map<String?, dynamic> data) {
    var listImages = data['gallery_images_url'] == null
        ? []
        : data['gallery_images_url'] as List;

    List<Gallery> images = [];
    if (listImages.length != 0) {
      images = listImages.map((i) => Gallery.fromJson(i)).toList();
      images.removeLast();
    }
    var row = data['row'];
    var convenienceFromJson = data['attributes']['11']['child'];
    List<String> conveniences = new List<String>.from(convenienceFromJson);

    return ExperienceDetails(
      row['id'] as int,
      row['title'] == null ? "" : row['title'] as String,
      row['slug'] == null ? "" : row['slug'] as String,
      row['content'] == null ? "" : row['content'] as String,
      row['location_name'] == null ? "" : row['location_name'] as String,
      row['address'] == null ? "" : row['address'] as String,
      row['impactsocial'] == null
          ? ""
          : row['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
      row['is_featured'] == null ? -1 : row['is_featured'] as int,
      row['duration'] == null ? "" : row['duration'] as String,
      row['max_people'] == null ? 0 : row['max_people'] as int,
      row['price'] == null ? "" : row['price'] as String,
      row['cat_name'] == null ? "" : row['cat_name'] as String,
      data['banner_image_url'] == null
          ? ""
          : data['banner_image_url'] as String,
      data['gallery_images_url'] == null ? [] : images,
      row['map_lat'] == null ? 0 : double.parse(row['map_lat']),
      row['map_lng'] == null ? 0 : double.parse(row['map_lng']),
      data['attributes']['11'] == null ? [] : conveniences,
    );
  }
}
