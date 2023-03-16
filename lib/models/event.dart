import 'imageGallery.dart';

class Event {
  int? id;
  String? title;
  String? start_date;
  int? number;
  int? is_featured;
  String? difficulty;
  String? duration;
  String? price;
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
      data['impactsocial'] == null
          ? ""
          : data['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
      data['is_featured'] == null ? -1 : data['is_featured'] as int,
      data['start_date'] == null ? "" : data['start_date'] as String,
      data['number'] == null ? -1 : data['number'] as int,
      data['prix'] == null ? "" : data['prix'] as String,
      data['duration'] == null ? "" : data['duration'] as String,
      data['difficulty'] == null ? "" : data['difficulty'] as String,
      data['term_name'] == null ? "" : data['term_name'] as String,
    );
  }
}

class EventDetails {
  int? id;
  String? title;
  String? content;
  String location_name;
  String? start_date;
  String? end_date;
  int? number;
  int? is_featured;
  String? difficulty;
  String? duration;
  String distance;
  String? price;
  String? address;
  String? impactsocial;
  String? terms_name;
  String? slug;
  String banner_image_url;
  List<Images> gallery_images_url;
  double? map_lat;
  double? map_lng;
  List<String>? convenience;

  EventDetails(
      this.id,
      this.title,
      this.content,
      this.address,
      this.impactsocial,
      this.location_name,
      this.is_featured,
      this.start_date,
      this.end_date,
      this.number,
      this.price,
      this.duration,
      this.distance,
      this.difficulty,
      this.terms_name,
      this.slug,
      this.banner_image_url,
      this.gallery_images_url,
      this.map_lat,
      this.map_lng,
      this.convenience);

  factory EventDetails.fromJson(Map<String?, dynamic> data) {
    dynamic row = data['row'];
    var listImages = data['gallery_images_url'] as List;
    List<Images> images = listImages.map((i) => Images.fromJson(i)).toList();
    images.removeLast();
    var convenienceFromJson = data['attributes']['10']['child'];
    List<String> conveniences = new List<String>.from(convenienceFromJson);
    return EventDetails(
      row['id'] as int,
      row['title'] == null ? "" : row['title'] as String,
      row['content'] == null ? "" : row['content'] as String,
      row['address'] == null ? "" : row['address'] as String,
      row['impactsocial'] == null
          ? ""
          : row['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
      row['location_name'] == null ? "" : row['location_name'] as String,
      row['is_featured'] == null ? -1 : row['is_featured'] as int,
      row['start_date'] == null ? "" : row['start_date'] as String,
      row['end_date'] == null ? "" : row['end_date'] as String,
      row['number'] == null ? -1 : row['number'] as int,
      row['prix'] == null ? "" : row['prix'] as String,
      row['duration'] == null ? "" : row['duration'] as String,
      row['distance'] == null ? "" : row['distance'] as String,
      row['difficulty'] == null ? "" : row['difficulty'] as String,
      row['term_name'] == null ? "" : row['term_name'] as String,
      row['slug'] == null ? "" : row['slug'] as String,
      data['banner_image_url'] == null
          ? ""
          : data['banner_image_url'] as String,
      data['gallery_images_url'] == null ? [] : images,
      row['map_lat'] == null ? 0 : double.parse(row['map_lat']),
      row['map_lng'] == null ? 0 : double.parse(row['map_lng']),
      data['attributes']['10']['child'] == null ? [] : conveniences,
    );
  }
}
