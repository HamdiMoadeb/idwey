import 'imageGallery.dart';

class Activity {
  int? id;
  String? title;
  int? max_people;
  int? is_featured;
  String? price;
  String? address;
  String? impactsocial;
  String? IMAGE_URL;
  String? cat_name;
  String? duration;

  Activity(
    this.id,
    this.title,
    this.max_people,
    this.address,
    this.IMAGE_URL,
    this.impactsocial,
    this.is_featured,
    this.price,
    this.cat_name,
    this.duration,
  );

  factory Activity.fromJson(Map<String?, dynamic> data) {
    return Activity(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['max_people'] == null ? -1 : data['max_people'] as int,
      data['address'] == null ? "" : data['address'] as String,
      data['IMAGE_URL'] == null ? "" : data['IMAGE_URL'] as String,
      data['impactsocial'] == null ? "" : data['impactsocial'] as String,
      data['is_featured'] == null ? -1 : data['is_featured'] as int,
      data['price'] == null ? "" : data['price'] as String,
      data['cat_name'] == null ? "" : data['cat_name'] as String,
      data['duration'] == null ? "" : data['duration'] as String,
    );
  }
}

class ActivityDetail {
  int id;
  String title;
  String slug;
  String content;
  String location_name;
  int max_people;
  int is_featured;
  String price;
  String address;
  String impactsocial;
  String cat_name;
  String duration;
  String banner_image_url;
  List<Images> gallery_images_url;
  List<String> style;
  double map_lat;
  double map_lng;
  List<String>? convenience;

  ActivityDetail(
      this.id,
      this.title,
      this.slug,
      this.content,
      this.location_name,
      this.max_people,
      this.is_featured,
      this.price,
      this.address,
      this.impactsocial,
      this.cat_name,
      this.duration,
      this.banner_image_url,
      this.gallery_images_url,
      this.style,
      this.map_lat,
      this.map_lng,
      this.convenience);

  factory ActivityDetail.fromJson(Map<String?, dynamic> data) {
    var listImages = data['gallery_images_url'] == null
        ? []
        : data['gallery_images_url'] as List;
    List<Images> images = [];
    List<String> conveniences = [];
    if (listImages.length != 0) {
      images = listImages.map((i) => Images.fromJson(i)).toList();
      images.removeLast();
    }
    var row = data['row'];
    var styleFromJson = data['attributes']['1']['child'];
    List<String> styles = new List<String>.from(styleFromJson);
    var convenienceFromJson = data['attributes']['2'] ?? [] as List;

    if (convenienceFromJson.length != 0) {
      conveniences = new List<String>.from(convenienceFromJson['child']);
    }

    return ActivityDetail(
      row['id'] == null ? 0 : row['id'] as int,
      row['title'] == null ? "" : row['title'] as String,
      row['slug'] == null ? "" : row['slug'] as String,
      row['content'] == null ? "" : row['content'] as String,
      row['location_name'] == null ? "" : row['location_name'] as String,
      row['max_people'] == null ? -1 : row['max_people'] as int,
      row['is_featured'] == null ? -1 : row['is_featured'] as int,
      row['price'] == null ? "" : row['price'] as String,
      row['address'] == null ? "" : row['address'] as String,
      row['impactsocial'] == null
          ? ""
          : row['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
      row['cat_name'] == null ? "" : row['cat_name'] as String,
      row['duration'] == null ? "" : row['duration'] as String,
      data['banner_image_url'] == null
          ? ""
          : data['banner_image_url'] as String,
      data['gallery_images_url'] == null ? [] : images,
      data['attributes']['1']['child'] == null ? [] : styles,
      row['map_lat'] == null ? 0 : double.parse(row['map_lat']),
      row['map_lng'] == null ? 0 : double.parse(row['map_lng']),
      data['attributes']['2'] == null ? [] : conveniences,
    );
  }
}
