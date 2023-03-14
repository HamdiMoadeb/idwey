import 'host.dart';

class Product {
  int? id;
  String? title;
  String? price;
  String? IMAGE_URL;
  String? term_name;

  Product(
    this.id,
    this.title,
    this.price,
    this.IMAGE_URL,
    this.term_name,
  );

  factory Product.fromJson(Map<String?, dynamic> data) {
    return Product(
      data['id'] as int,
      data['title'] == null ? "" : data['title'] as String,
      data['price'] == null ? "" : data['price'] as String,
      data['IMAGE_URL'] == null ? "" : data['IMAGE_URL'] as String,
      data['term_name'] == null ? "" : data['term_name'] as String,
    );
  }
}

class ProductDetails {
  int? id;
  String? title;
  String? slug;
  String? content;
  String? price;
  String? sale_price;
  String? term_name;
  String banner_image_url;
  List<Images> gallery_images_url;
  List<String> type;

  ProductDetails(
      this.id,
      this.title,
      this.slug,
      this.content,
      this.price,
      this.sale_price,
      this.term_name,
      this.banner_image_url,
      this.gallery_images_url,
      this.type);

  factory ProductDetails.fromJson(Map<String?, dynamic> data) {
    var listImages = data['gallery_images_url'] as List;
    List<Images> images = listImages.map((i) => Images.fromJson(i)).toList();
    images.removeLast();
    var row = data['row'];
    var typeFromJson = data['attributes']['3']['child'];
    List<String> types = new List<String>.from(typeFromJson);

    return ProductDetails(
      row['id'] as int,
      row['title'] == null ? "" : row['title'] as String,
      row['slug'] == null ? "" : row['slug'] as String,
      row['content'] == null ? "" : row['content'] as String,
      row['price'] == null ? "" : row['price'] as String,
      row['sale_price'] == null ? "" : row['sale_price'] as String,
      row['term_name'] == null ? "" : row['term_name'] as String,
      data['banner_image_url'] == null
          ? ""
          : data['banner_image_url'] as String,
      data['gallery_images_url'] == null ? [] : images,
      data['attributes']['3']['child'] == null ? [] : types,
    );
  }
}
