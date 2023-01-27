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
