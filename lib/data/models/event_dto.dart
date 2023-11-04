// To parse this JSON data, do
//
//     final event = eventFromJson(jsonString);

import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  final int? id;
  final String? slug;
  final String? title;
  final DateTime? startDate;
  final dynamic isExpired;
  final DateTime? endDate;
  final dynamic isfull;
  final int? number;
  final String? promotion;
  final String? difficulty;
  final String? duration;
  final String? prix;
  final dynamic salePrix;
  final dynamic address;
  final dynamic impactsocial;
  final String? imageUrl;
  final String? termName;
  final String? translationTermName;
  final String? translateDifficulty;
  final dynamic translationImpactsocial;
  final List<dynamic>? translations;

  Event({
    this.id,
    this.slug,
    this.promotion,
    this.title,
    this.startDate,
    this.isExpired,
    this.endDate,
    this.isfull,
    this.number,
    this.difficulty,
    this.duration,
    this.prix,
    this.salePrix,
    this.address,
    this.impactsocial,
    this.imageUrl,
    this.termName,
    this.translationTermName,
    this.translateDifficulty,
    this.translationImpactsocial,
    this.translations,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        isExpired: json["isExpired"],
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        isfull: json["isfull"],
        number: json["number"],
        difficulty: json["difficulty"],
        duration: json["duration"],
        prix: json["prix"],
        salePrix: json["sale_prix"],
        promotion: json["promotion"],
        address: json["address"],
        impactsocial: json["impactsocial"],
        imageUrl: json["IMAGE_URL"],
        termName: json["term_name"],
        translationTermName: json["translation_term_name"],
        translateDifficulty: json["translate_difficulty"],
        translationImpactsocial: json["translation_impactsocial"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "isExpired": isExpired,
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "isfull": isfull,
        "promotion": promotion,
        "number": number,
        "difficulty": difficulty,
        "duration": duration,
        "prix": prix,
        "sale_prix": salePrix,
        "address": address,
        "impactsocial": impactsocial,
        "IMAGE_URL": imageUrl,
        "term_name": termName,
        "translation_term_name": translationTermName,
        "translate_difficulty": translateDifficulty,
        "translation_impactsocial": translationImpactsocial,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
      };
}
