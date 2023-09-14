// To parse this JSON data, do
//
//     final productDto = productDtoFromJson(jsonString);

import 'dart:convert';

ProductDto productDtoFromJson(String str) =>
    ProductDto.fromJson(json.decode(str));

String productDtoToJson(ProductDto data) => json.encode(data.toJson());

class ProductDto {
  final int? id;
  final String? slug;
  final String? title;
  final String? price;
  final dynamic salePrice;
  final String? imageUrl;
  final String? termName;
  final String? translationTermName;
  final List<dynamic>? translations;
  final dynamic location;
  final dynamic hasWishList;

  ProductDto({
    this.id,
    this.slug,
    this.title,
    this.price,
    this.salePrice,
    this.imageUrl,
    this.termName,
    this.translationTermName,
    this.translations,
    this.location,
    this.hasWishList,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) => ProductDto(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        price: json["price"],
        salePrice: json["sale_price"],
        imageUrl: json["IMAGE_URL"],
        termName: json["term_name"],
        translationTermName: json["translation_term_name"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        location: json["location"],
        hasWishList: json["has_wish_list"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "price": price,
        "sale_price": salePrice,
        "IMAGE_URL": imageUrl,
        "term_name": termName,
        "translation_term_name": translationTermName,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "location": location,
        "has_wish_list": hasWishList,
      };
}
