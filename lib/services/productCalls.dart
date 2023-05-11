import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/product.dart';
import 'package:idwey/utils/urls.dart';

class ProductCalls {
  static Future<Map> getAllProducts() async {
    List<Product> listProducts = [];
    Map result = {
      'list': [],
    };
    var url = Uri.parse('${Urls.URL_API}product/listProduct');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listProducts.add(Product.fromJson(i));
      }
      result["list"] = listProducts;

      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }
    return result;
  }

  static Future<Map> getProductList(int skip) async {
    List<Product> listProducts = [];

    var url = Uri.parse('${Urls.URL_API}product?limit=20&offset=$skip');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map result = {
      'list': [],
    };
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listProducts.add(Product.fromJson(i));
      }
      result["list"] = listProducts;
      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }
    return result;
  }

  static Future<Map> getProductDetails(int id) async {
    ProductDetails productDetails =
        ProductDetails(0, '', '', '', '', '', '', '', [], [], '', '', '');
    Map result = {
      'list': [],
    };
    var url = Uri.parse('${Urls.URL_API}product/detail/$id');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      productDetails = ProductDetails.fromJson(data);
      result["productDetails"] = productDetails;
      result["eur"] = data["eur"];
      result["usd"] = data["usd"];
    }

    return result;
  }
}
