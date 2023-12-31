// To parse this JSON data, do
//
//     final eventPageDto = eventPageDtoFromJson(jsonString);

import 'dart:convert';

import 'package:idwey/data/models/translation.dart';

import 'attributz.dart';
import 'event_dto.dart';

EventPageDto eventPageDtoFromJson(String str) =>
    EventPageDto.fromJson(json.decode(str));

String eventPageDtoToJson(EventPageDto data) => json.encode(data.toJson());

class EventPageDto {
  final String? pageTitle;
  final String? pageTitleTranslation;
  final String? bannerImagePage;
  final int? eur;
  final int? usd;
  final int? total;
  final List<Event>? rows;
  final List<ListLocation>? listLocation;
  final List<String>? cities;
  final List<String>? eventMinMaxPrice;
  final List<AttributeDto>? attributes;

  EventPageDto({
    this.pageTitle,
    this.pageTitleTranslation,
    this.bannerImagePage,
    this.eur,
    this.usd,
    this.total,
    this.rows,
    this.listLocation,
    this.cities,
    this.eventMinMaxPrice,
    this.attributes,
  });

  factory EventPageDto.fromJson(Map<String, dynamic> json) => EventPageDto(
        pageTitle: json["page_title"],
        pageTitleTranslation: json["page_title_translation"],
        bannerImagePage: json["banner_image_page"],
        eur: json["eur"],
        usd: json["usd"],
        total: json["total"],
        rows: json["rows"] == null
            ? []
            : List<Event>.from(json["rows"]!.map((x) => Event.fromJson(x))),
        listLocation: json["list_location"] == null
            ? []
            : List<ListLocation>.from(
                json["list_location"]!.map((x) => ListLocation.fromJson(x))),
        cities: json["cities"] == null
            ? []
            : List<String>.from(json["cities"]!.map((x) => x)),
        eventMinMaxPrice: json["event_min_max_price"] == null
            ? []
            : List<String>.from(json["event_min_max_price"]!.map((x) => x)),
        attributes: json["attributes"] == null
            ? []
            : List<AttributeDto>.from(
                json["attributes"]!.map((x) => AttributeDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page_title": pageTitle,
        "page_title_translation": pageTitleTranslation,
        "banner_image_page": bannerImagePage,
        "eur": eur,
        "usd": usd,
        "total": total,
        "rows": rows == null
            ? []
            : List<dynamic>.from(rows!.map((x) => x.toJson())),
        "list_location": listLocation == null
            ? []
            : List<dynamic>.from(listLocation!.map((x) => x.toJson())),
        "cities":
            cities == null ? [] : List<dynamic>.from(cities!.map((x) => x)),
        "event_min_max_price": eventMinMaxPrice == null
            ? []
            : List<dynamic>.from(eventMinMaxPrice!.map((x) => x)),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

enum Locale { EN, FR }

final localeValues = EnumValues({"en": Locale.EN, "fr": Locale.FR});

class TripIdea {
  final dynamic imageId;
  final dynamic title;
  final dynamic link;
  final dynamic content;

  TripIdea({
    this.imageId,
    this.title,
    this.link,
    this.content,
  });

  factory TripIdea.fromJson(Map<String, dynamic> json) => TripIdea(
        imageId: json["image_id"],
        title: json["title"],
        link: json["link"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "image_id": imageId,
        "title": title,
        "link": link,
        "content": content,
      };
}

class ListLocation {
  final int? id;
  final String? name;
  final String? content;
  final String? slug;
  final int? imageId;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final String? status;
  final int? lft;
  final int? rgt;
  final dynamic parentId;
  final int? createUser;
  final int? updateUser;
  final dynamic deletedAt;
  final dynamic originId;
  final dynamic lang;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? bannerImageId;
  final List<TripIdea>? tripIdeas;
  final List<Translation>? translations;
  final List<dynamic>? children;

  ListLocation({
    this.id,
    this.name,
    this.content,
    this.slug,
    this.imageId,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.status,
    this.lft,
    this.rgt,
    this.parentId,
    this.createUser,
    this.updateUser,
    this.deletedAt,
    this.originId,
    this.lang,
    this.createdAt,
    this.updatedAt,
    this.bannerImageId,
    this.tripIdeas,
    this.translations,
    this.children,
  });

  factory ListLocation.fromJson(Map<String, dynamic> json) => ListLocation(
        id: json["id"],
        name: json["name"],
        content: json["content"],
        slug: json["slug"],
        imageId: json["image_id"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        status: json["status"],
        lft: json["_lft"],
        rgt: json["_rgt"],
        parentId: json["parent_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        deletedAt: json["deleted_at"],
        originId: json["origin_id"],
        lang: json["lang"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        bannerImageId: json["banner_image_id"],
        tripIdeas: json["trip_ideas"] == null
            ? []
            : List<TripIdea>.from(
                json["trip_ideas"]!.map((x) => TripIdea.fromJson(x))),
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
        children: json["children"] == null
            ? []
            : List<dynamic>.from(json["children"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
        "slug": slug,
        "image_id": imageId,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "status": status,
        "_lft": lft,
        "_rgt": rgt,
        "parent_id": parentId,
        "create_user": createUser,
        "update_user": updateUser,
        "deleted_at": deletedAt,
        "origin_id": originId,
        "lang": lang,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "banner_image_id": bannerImageId,
        "trip_ideas": tripIdeas == null
            ? []
            : List<dynamic>.from(tripIdeas!.map((x) => x.toJson())),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "children":
            children == null ? [] : List<dynamic>.from(children!.map((x) => x)),
      };
}

enum Difficulty { DIFFICILE, FACILE, MOYEN }

final difficultyValues = EnumValues({
  "Difficile": Difficulty.DIFFICILE,
  "Facile": Difficulty.FACILE,
  "Moyen": Difficulty.MOYEN
});

enum TranslateDifficulty { EASY, HARD, MEDIUM }

final translateDifficultyValues = EnumValues({
  "Easy": TranslateDifficulty.EASY,
  "Hard": TranslateDifficulty.HARD,
  "Medium": TranslateDifficulty.MEDIUM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
