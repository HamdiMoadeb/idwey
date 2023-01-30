import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/product.dart';
import 'package:idwey/utils/urls.dart';

class ProductCalls {
  static Future<List<Product>> getAllProducts() async {
    List<Product> listProducts = [];

    var url = Uri.parse('${Urls.URL_API}product/listProduct');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        print(i);
        listProducts.add(Product.fromJson(i));
      }
    }
    return listProducts;
  }

  static Future<List<Product>> getProductList() async {
    List<Product> listProducts = [];

    var url = Uri.parse('${Urls.URL_API}product');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        print(i);
        listProducts.add(Product.fromJson(i));
      }
    }
    return listProducts;
  }
}
