// import 'package:idwey/models/room.dart';
//
// import 'imageGallery.dart';
//
// class Host {
//   int? id;
//   String? title;
//   int? max_person;
//   int? is_featured;
//   int? has_room;
//   String? per_person;
//   String? location_name;
//   String? price;
//   String? address;
//   String? impactsocial;
//   String? IMAGE_URL;
//   String? term_name;
//   String? typeHost;
//   final List<Room>? rooms;
//
//   Host(
//     this.id,
//     this.title,
//     this.address,
//     this.IMAGE_URL,
//     this.impactsocial,
//     this.is_featured,
//     this.per_person,
//     this.location_name,
//     this.max_person,
//     this.price,
//     this.term_name,
//     this.has_room,
//     this.typeHost,
//     this.rooms,
//   );
//
//   factory Host.fromJson(Map<String?, dynamic> data) {
//     return Host(
//       data['id'] as int,
//       data['title'] == null ? "" : data['title'] as String,
//       data['address'] == null ? "" : data['address'] as String,
//       data['IMAGE_URL'] == null ? "" : data['IMAGE_URL'] as String,
//       data['impactsocial'] == null
//           ? ""
//           : data['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
//       data['is_featured'] == null ? -1 : data['is_featured'] as int,
//       data['per_person'] == null ? "" : data['per_person'] as String,
//       data['location_name'] == null ? "" : data['location_name'] as String,
//       data['max_person'] == null ? -1 : data['max_person'] as int,
//       data['price'] == null ? "" : data['price'] as String,
//       data['term_name'] == null ? "" : data['term_name'] as String,
//       data['has_room'] == null ? -1 : data['has_room'] as int,
//       data['type_host'] == null ? "" : data['type_host'] as String,
//       data["rooms"] == null
//           ? []
//           : List<Room>.from(data["rooms"]!.map((x) => Room.fromJson(x))),
//     );
//   }
// }
//
// class HostDetail {
//   int id;
//   String title;
//   int max_person;
//   int is_featured;
//   String per_person;
//   String location_name;
//   String price;
//   String address;
//   String impactsocial;
//   String term_name;
//   String content;
//   String banner_image_url;
//   List<Images> gallery_images_url;
//   String check_in_time;
//   String check_out_time;
//   List<String> type;
//   double? map_lat;
//   double? map_lng;
//   List<String>? convenience;
//   String? typeHost;
//   List<Room>? rooms;
//
//   HostDetail(
//     this.id,
//     this.title,
//     this.content,
//     this.address,
//     this.impactsocial,
//     this.type,
//     this.is_featured,
//     this.per_person,
//     this.location_name,
//     this.max_person,
//     this.price,
//     this.term_name,
//     this.banner_image_url,
//     this.gallery_images_url,
//     this.check_in_time,
//     this.check_out_time,
//     this.map_lat,
//     this.map_lng,
//     this.convenience,
//     this.typeHost,
//     this.rooms,
//   );
//
//   factory HostDetail.fromJson(Map<String?, dynamic> data) {
//     var listImages = data['gallery_images_url'] as List;
//     List<Images> images = listImages.map((i) => Images.fromJson(i)).toList();
//     images.removeLast();
//     var row = data['row'];
//     var typeFromJson = data['attributes']['5']['child'];
//     List<String> types = new List<String>.from(typeFromJson);
//     var convenienceFromJson = data['attributes']['6']['child'];
//     List<String> conveniences = new List<String>.from(convenienceFromJson);
//
//     return HostDetail(
//       row['id'] == null ? 0 : row['id'] as int,
//       row['title'] == null ? "" : row['title'] as String,
//       row['content'] == null ? "" : row['content'] as String,
//       row['address'] == null ? "" : row['address'] as String,
//       row['impactsocial'] == null
//           ? ""
//           : row['impactsocial'] as String, // IF NOT NULL RETURNS "Oui"
//       data['attributes']['5']['child'] == null ? [] : types,
//       row['is_featured'] == null ? -1 : row['is_featured'] as int,
//       row['per_person'] == null ? "" : row['per_person'] as String,
//       row['location_name'] == null ? "" : row['location_name'] as String,
//       row['max_person'] == null ? -1 : int.parse(row['max_person'].toString()),
//       row['price'] == null ? "" : row['price'] as String,
//       row['term_name'] == null ? "" : row['term_name'] as String,
//       data['banner_image_url'] == null
//           ? ""
//           : data['banner_image_url'] as String,
//       data['gallery_images_url'] == null ? [] : images,
//       row['check_in_time'] == null ? "" : row['check_in_time'] as String,
//       row['check_out_time'] == null ? "" : row['check_out_time'] as String,
//       row['map_lat'] == null ? 0 : double.parse(row['map_lat']),
//       row['map_lng'] == null ? 0 : double.parse(row['map_lng']),
//       data['attributes']['6']['child'] == null ? [] : conveniences,
//       row['type_host'] == null ? "" : row['type_host'] as String,
//       data["rooms"] == null
//           ? []
//           : List<Room>.from(data["rooms"]!.map((x) => Room.fromJson(x))),
//     );
//   }
// }

import 'package:idwey/models/models.dart';

import '../utils/enums.dart';

class Host {
  final int? id;
  final String? slug;
  final String? title;
  final PerPerson? perPerson;
  final dynamic isFeatured;
  final String? price;
  final PerPersonTranslation? perPersonTranslation;
  final int? hasRoom;
  final TypeHostTranslation? typeHostTranslation;
  final TypeHost? typeHost;
  final int? maxPerson;
  final dynamic salePrice;
  final String? address;
  final String? impactsocial;
  final String? translationImpactsocial;
  final dynamic promotion;
  final String? imageUrl;
  final TermName? termName;
  final TranslationTermName? translationTermName;
  final String? locationName;
  final String? translationLocationName;
  final List<dynamic>? translations;
  final String? content;
  final int? bannerImageId;
  final String? gallery;
  final String? checkInTime;
  final String? checkOutTime;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final int? minPerson;
  final dynamic location;
  final List<Term>? terms;

  Host({
    this.content,
    this.bannerImageId,
    this.gallery,
    this.checkInTime,
    this.checkOutTime,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.minPerson,
    this.location,
    this.terms,
    this.id,
    this.slug,
    this.title,
    this.perPerson,
    this.isFeatured,
    this.price,
    this.perPersonTranslation,
    this.hasRoom,
    this.typeHostTranslation,
    this.typeHost,
    this.maxPerson,
    this.salePrice,
    this.address,
    this.impactsocial,
    this.translationImpactsocial,
    this.promotion,
    this.imageUrl,
    this.termName,
    this.translationTermName,
    this.locationName,
    this.translationLocationName,
    this.translations,
  });

  factory Host.fromJson(Map<String, dynamic> json) => Host(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        perPerson: perPersonValues.map[json["per_person"]]!,
        isFeatured: json["is_featured"],
        price: json["price"],
        perPersonTranslation:
            perPersonTranslationValues.map[json["per_person_translation"]]!,
        hasRoom: json["has_room"],
        typeHostTranslation:
            typeHostTranslationValues.map[json["type_host_translation"]] != null
                ? typeHostTranslationValues.map[json["type_host_translation"]]!
                : TypeHostTranslation.ENTIRE_HOUSING,
        typeHost: typeHostValues.map[json["type_host"]],
        maxPerson: json["max_person"] is String
            ? int.tryParse(json["max_person"])
            : json["max_person"],
        salePrice: json["sale_price"],
        address: json["address"],
        impactsocial: json["impactsocial"],
        translationImpactsocial: json["translation_impactsocial"],
        promotion: json["promotion"],
        imageUrl: json["IMAGE_URL"],
        termName: termNameValues.map[json["term_name"]],
        translationTermName:
            translationTermNameValues.map[json["translation_term_name"]] ??
                TranslationTermName.HOSTEL,
        locationName: json["location_name"],
        translationLocationName: json["translation_location_name"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        terms: json["terms"] == null
            ? []
            : List<Term>.from(json["terms"]!.map((x) => Term.fromJson(x))),
        content: json["content"],
        bannerImageId: json["banner_image_id"],
        gallery: json["gallery"],
        checkInTime: json["check_in_time"],
        checkOutTime: json["check_out_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "per_person": perPersonValues.reverse[perPerson],
        "is_featured": isFeatured,
        "price": price,
        "per_person_translation":
            perPersonTranslationValues.reverse[perPersonTranslation],
        "has_room": hasRoom,
        "type_host_translation":
            typeHostTranslationValues.reverse[typeHostTranslation],
        "type_host": typeHostValues.reverse[typeHost],
        "max_person": maxPerson,
        "sale_price": salePrice,
        "address": address,
        "impactsocial": impactsocial,
        "translation_impactsocial": translationImpactsocial,
        "promotion": promotion,
        "IMAGE_URL": imageUrl,
        "term_name": termNameValues.reverse[termName],
        "translation_term_name":
            translationTermNameValues.reverse[translationTermName],
        "location_name": locationName,
        "translation_location_name": translationLocationName,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "content": content,
        "banner_image_id": bannerImageId,
        "gallery": gallery,
        "check_in_time": checkInTime,
        "check_out_time": checkOutTime,
      };
}
