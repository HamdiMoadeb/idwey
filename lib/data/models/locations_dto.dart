// To parse this JSON data, do
//
//     final locationsDto = locationsDtoFromJson(jsonString);

import 'dart:convert';

LocationsDto locationsDtoFromJson(String str) =>
    LocationsDto.fromJson(json.decode(str));

String locationsDtoToJson(LocationsDto data) => json.encode(data.toJson());

class LocationsDto {
  final int? id;
  final String? name;
  final String? imageId;
  final int? nbHotels;
  final String? hotel;
  final String? translationHotel;
  final int? nbEvents;
  final String? event;
  final String? translationEvent;
  final int? nbActivits;
  final String? activity;
  final String? translationActivity;
  final int? nbExperiences;
  final String? experience;
  final String? translationExperience;
  final List<Translation>? translations;

  LocationsDto({
    this.id,
    this.name,
    this.imageId,
    this.nbHotels,
    this.hotel,
    this.translationHotel,
    this.nbEvents,
    this.event,
    this.translationEvent,
    this.nbActivits,
    this.activity,
    this.translationActivity,
    this.nbExperiences,
    this.experience,
    this.translationExperience,
    this.translations,
  });

  factory LocationsDto.fromJson(Map<String, dynamic> json) => LocationsDto(
        id: json["id"],
        name: json["name"],
        imageId: json["image_id"],
        nbHotels: json["nb_hotels"],
        hotel: json["hotel"],
        translationHotel: json["translation_hotel"],
        nbEvents: json["nb_events"],
        event: json["event"],
        translationEvent: json["translation_event"],
        nbActivits: json["nb_activités"],
        activity: json["activity"],
        translationActivity: json["translation_activity"],
        nbExperiences: json["nb_experiences"],
        experience: json["experience"],
        translationExperience: json["translation_experience"],
        translations: json["translations"] == null
            ? []
            : List<Translation>.from(
                json["translations"]!.map((x) => Translation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_id": imageId,
        "nb_hotels": nbHotels,
        "hotel": hotel,
        "translation_hotel": translationHotel,
        "nb_events": nbEvents,
        "event": event,
        "translation_event": translationEvent,
        "nb_activités": nbActivits,
        "activity": activity,
        "translation_activity": translationActivity,
        "nb_experiences": nbExperiences,
        "experience": experience,
        "translation_experience": translationExperience,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
      };
}

class Translation {
  final int? id;
  final int? originId;
  final String? locale;
  final String? name;
  final String? content;
  final int? createUser;
  final int? updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic tripIdeas;

  Translation({
    this.id,
    this.originId,
    this.locale,
    this.name,
    this.content,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
    this.tripIdeas,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        originId: json["origin_id"],
        locale: json["locale"],
        name: json["name"],
        content: json["content"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        tripIdeas: json["trip_ideas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "origin_id": originId,
        "locale": locale,
        "name": name,
        "content": content,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "trip_ideas": tripIdeas,
      };
}
