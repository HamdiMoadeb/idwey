// To parse this JSON data, do
//
//     final activityDetailsDto = activityDetailsDtoFromJson(jsonString);

import 'dart:convert';

ActivityDetailsDto activityDetailsDtoFromJson(String str) =>
    ActivityDetailsDto.fromJson(json.decode(str));

String activityDetailsDtoToJson(ActivityDetailsDto data) =>
    json.encode(data.toJson());

class ActivityDetailsDto {
  final Row? row;
  final int? eur;
  final int? usd;
  final String? bannerImageUrl;
  final List<GalleryImagesUrl>? galleryImagesUrl;
  final BookingData? bookingData;
  final Map<String, Attribute>? attributes;
  final List<dynamic>? tourRelated;

  ActivityDetailsDto({
    this.row,
    this.eur,
    this.usd,
    this.bannerImageUrl,
    this.galleryImagesUrl,
    this.bookingData,
    this.attributes,
    this.tourRelated,
  });

  factory ActivityDetailsDto.fromJson(Map<String, dynamic> json) =>
      ActivityDetailsDto(
        row: json["row"] == null ? null : Row.fromJson(json["row"]),
        eur: json["eur"],
        usd: json["usd"],
        bannerImageUrl: json["banner_image_url"],
        galleryImagesUrl: json["gallery_images_url"] == null
            ? []
            : List<GalleryImagesUrl>.from(json["gallery_images_url"]!
                .map((x) => GalleryImagesUrl.fromJson(x))),
        bookingData: json["booking_data"] == null
            ? null
            : BookingData.fromJson(json["booking_data"]),
        attributes: Map.from(json["attributes"]!).map(
            (k, v) => MapEntry<String, Attribute>(k, Attribute.fromJson(v))),
        tourRelated: json["tour_related"] == null
            ? []
            : List<dynamic>.from(json["tour_related"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "row": row?.toJson(),
        "eur": eur,
        "usd": usd,
        "banner_image_url": bannerImageUrl,
        "gallery_images_url": galleryImagesUrl == null
            ? []
            : List<dynamic>.from(galleryImagesUrl!.map((x) => x.toJson())),
        "booking_data": bookingData?.toJson(),
        "attributes": Map.from(attributes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "tour_related": tourRelated == null
            ? []
            : List<dynamic>.from(tourRelated!.map((x) => x)),
      };
}

class Attribute {
  final String? parent;
  final List<String>? translateParent;
  final List<String>? child;
  final List<String>? tranlation;

  Attribute({
    this.parent,
    this.translateParent,
    this.child,
    this.tranlation,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        parent: json["parent"],
        translateParent: json["translate parent"] == null
            ? []
            : List<String>.from(json["translate parent"]!.map((x) => x)),
        child: json["child"] == null
            ? []
            : List<String>.from(json["child"]!.map((x) => x)),
        tranlation: json["tranlation"] == null
            ? []
            : List<String>.from(json["tranlation"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "parent": parent,
        "translate parent": translateParent == null
            ? []
            : List<dynamic>.from(translateParent!.map((x) => x)),
        "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x)),
        "tranlation": tranlation == null
            ? []
            : List<dynamic>.from(tranlation!.map((x) => x)),
      };
}

class BookingData {
  final int? id;
  final List<BookingDataPersonType>? personTypes;
  final int? max;
  final List<dynamic>? openHours;
  final List<dynamic>? extraPrice;
  final String? minDate;
  final String? duration;
  final List<dynamic>? buyerFees;
  final String? startDate;
  final String? startDateHtml;
  final String? endDate;
  final String? endDateHtml;

  BookingData({
    this.id,
    this.personTypes,
    this.max,
    this.openHours,
    this.extraPrice,
    this.minDate,
    this.duration,
    this.buyerFees,
    this.startDate,
    this.startDateHtml,
    this.endDate,
    this.endDateHtml,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        id: json["id"],
        personTypes: json["person_types"] == null
            ? []
            : List<BookingDataPersonType>.from(json["person_types"]!
                .map((x) => BookingDataPersonType.fromJson(x))),
        max: json["max"],
        openHours: json["open_hours"] == null
            ? []
            : List<dynamic>.from(json["open_hours"]!.map((x) => x)),
        extraPrice: json["extra_price"] == null
            ? []
            : List<dynamic>.from(json["extra_price"]!.map((x) => x)),
        minDate: json["minDate"],
        duration: json["duration"],
        buyerFees: json["buyer_fees"] == null
            ? []
            : List<dynamic>.from(json["buyer_fees"]!.map((x) => x)),
        startDate: json["start_date"],
        startDateHtml: json["start_date_html"],
        endDate: json["end_date"],
        endDateHtml: json["end_date_html"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "person_types": personTypes == null
            ? []
            : List<dynamic>.from(personTypes!.map((x) => x.toJson())),
        "max": max,
        "open_hours": openHours == null
            ? []
            : List<dynamic>.from(openHours!.map((x) => x)),
        "extra_price": extraPrice == null
            ? []
            : List<dynamic>.from(extraPrice!.map((x) => x)),
        "minDate": minDate,
        "duration": duration,
        "buyer_fees": buyerFees == null
            ? []
            : List<dynamic>.from(buyerFees!.map((x) => x)),
        "start_date": startDate,
        "start_date_html": startDateHtml,
        "end_date": endDate,
        "end_date_html": endDateHtml,
      };
}

class BookingDataPersonType {
  final String? name;
  final dynamic desc;
  final String? nameEn;
  final dynamic descEn;
  final int? min;
  final String? price;
  final int? max;
  final int? number;
  final String? displayPrice;

  BookingDataPersonType({
    this.name,
    this.desc,
    this.nameEn,
    this.descEn,
    this.min,
    this.price,
    this.max,
    this.number,
    this.displayPrice,
  });

  factory BookingDataPersonType.fromJson(Map<String, dynamic> json) =>
      BookingDataPersonType(
        name: json["name"],
        desc: json["desc"],
        nameEn: json["name_en"],
        descEn: json["desc_en"],
        min: json["min"],
        price: json["price"],
        max: json["max"],
        number: json["number"],
        displayPrice: json["display_price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "name_en": nameEn,
        "desc_en": descEn,
        "min": min,
        "price": price,
        "max": max,
        "number": number,
        "display_price": displayPrice,
      };
}

class GalleryImagesUrl {
  final dynamic large;
  final dynamic thumb;

  GalleryImagesUrl({
    this.large,
    this.thumb,
  });

  factory GalleryImagesUrl.fromJson(Map<String, dynamic> json) =>
      GalleryImagesUrl(
        large: json["large"],
        thumb: json["thumb"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "thumb": thumb,
      };
}

class Row {
  final int? id;
  final String? slug;
  final String? title;
  final String? content;
  final String? catName;
  final String? translationCatName;
  final String? locationName;
  final String? translationLocationName;
  final int? maxPeople;
  final int? bannerImageId;
  final String? gallery;
  final int? isFeatured;
  final String? price;
  final dynamic salePrice;
  final String? duration;
  final String? address;
  final String? mapLat;
  final String? mapLng;
  final int? mapZoom;
  final dynamic impactsocial;
  final int? promoCode;
  final dynamic extraPrice;
  final dynamic translationImpactsocial;
  final dynamic location;
  final List<dynamic>? translations;
  final dynamic hasWishList;
  final List<TourTerm>? tourTerm;
  final Meta? meta;

  Row({
    this.id,
    this.slug,
    this.title,
    this.content,
    this.catName,
    this.translationCatName,
    this.locationName,
    this.translationLocationName,
    this.maxPeople,
    this.bannerImageId,
    this.gallery,
    this.isFeatured,
    this.price,
    this.salePrice,
    this.duration,
    this.address,
    this.mapLat,
    this.mapLng,
    this.mapZoom,
    this.impactsocial,
    this.promoCode,
    this.extraPrice,
    this.translationImpactsocial,
    this.location,
    this.translations,
    this.hasWishList,
    this.tourTerm,
    this.meta,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        content: json["content"],
        catName: json["cat_name"],
        translationCatName: json["translation_cat_name"],
        locationName: json["location_name"],
        translationLocationName: json["translation_location_name"],
        maxPeople: json["max_people"],
        bannerImageId: json["banner_image_id"],
        gallery: json["gallery"],
        isFeatured: json["is_featured"],
        price: json["price"],
        salePrice: json["sale_price"],
        duration: json["duration"],
        address: json["address"],
        mapLat: json["map_lat"],
        mapLng: json["map_lng"],
        mapZoom: json["map_zoom"],
        impactsocial: json["impactsocial"],
        promoCode: json["promo_code"],
        extraPrice: json["extra_price"],
        translationImpactsocial: json["translation_impactsocial"],
        location: json["location"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        hasWishList: json["has_wish_list"],
        tourTerm: json["tour_term"] == null
            ? []
            : List<TourTerm>.from(
                json["tour_term"]!.map((x) => TourTerm.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "content": content,
        "cat_name": catName,
        "translation_cat_name": translationCatName,
        "location_name": locationName,
        "translation_location_name": translationLocationName,
        "max_people": maxPeople,
        "banner_image_id": bannerImageId,
        "gallery": gallery,
        "is_featured": isFeatured,
        "price": price,
        "sale_price": salePrice,
        "duration": duration,
        "address": address,
        "map_lat": mapLat,
        "map_lng": mapLng,
        "map_zoom": mapZoom,
        "impactsocial": impactsocial,
        "promo_code": promoCode,
        "extra_price": extraPrice,
        "translation_impactsocial": translationImpactsocial,
        "location": location,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "has_wish_list": hasWishList,
        "tour_term": tourTerm == null
            ? []
            : List<dynamic>.from(tourTerm!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };
}

class Meta {
  final int? id;
  final int? tourId;
  final int? enablePersonTypes;
  final List<MetaPersonType>? personTypes;
  final dynamic enableExtraPrice;
  final dynamic extraPrice;
  final dynamic discountByPeople;
  final dynamic enableOpenHours;
  final dynamic openHours;
  final int? createUser;
  final int? updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Meta({
    this.id,
    this.tourId,
    this.enablePersonTypes,
    this.personTypes,
    this.enableExtraPrice,
    this.extraPrice,
    this.discountByPeople,
    this.enableOpenHours,
    this.openHours,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        id: json["id"],
        tourId: json["tour_id"],
        enablePersonTypes: json["enable_person_types"],
        personTypes: json["person_types"] == null
            ? []
            : List<MetaPersonType>.from(
                json["person_types"]!.map((x) => MetaPersonType.fromJson(x))),
        enableExtraPrice: json["enable_extra_price"],
        extraPrice: json["extra_price"],
        discountByPeople: json["discount_by_people"],
        enableOpenHours: json["enable_open_hours"],
        openHours: json["open_hours"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tour_id": tourId,
        "enable_person_types": enablePersonTypes,
        "person_types": personTypes == null
            ? []
            : List<dynamic>.from(personTypes!.map((x) => x.toJson())),
        "enable_extra_price": enableExtraPrice,
        "extra_price": extraPrice,
        "discount_by_people": discountByPeople,
        "enable_open_hours": enableOpenHours,
        "open_hours": openHours,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class MetaPersonType {
  final String? name;
  final dynamic desc;
  final String? nameEn;
  final dynamic descEn;
  final String? min;
  final String? price;
  final String? max;

  MetaPersonType({
    this.name,
    this.desc,
    this.nameEn,
    this.descEn,
    this.min,
    this.price,
    this.max,
  });

  factory MetaPersonType.fromJson(Map<String, dynamic> json) => MetaPersonType(
        name: json["name"],
        desc: json["desc"],
        nameEn: json["name_en"],
        descEn: json["desc_en"],
        min: json["min"],
        price: json["price"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "desc": desc,
        "name_en": nameEn,
        "desc_en": descEn,
        "min": min,
        "price": price,
        "max": max,
      };
}

class TourTerm {
  final int? id;
  final int? termId;
  final int? tourId;
  final int? createUser;
  final dynamic updateUser;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  TourTerm({
    this.id,
    this.termId,
    this.tourId,
    this.createUser,
    this.updateUser,
    this.createdAt,
    this.updatedAt,
  });

  factory TourTerm.fromJson(Map<String, dynamic> json) => TourTerm(
        id: json["id"],
        termId: json["term_id"],
        tourId: json["tour_id"],
        createUser: json["create_user"],
        updateUser: json["update_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "term_id": termId,
        "tour_id": tourId,
        "create_user": createUser,
        "update_user": updateUser,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
