import 'package:dio/dio.dart';
import 'package:idwey/data/models/product_details_dto.dart';
import 'package:idwey/data/models/product_dto.dart';

import '../models/models.dart';

abstract class ProductApiDataSource {
  Future<List<ProductDto>> getListProducts(int limit, int offset);
  Future<ProductDetailsDto> getProduct(int id);
  Future<List<ProductDto>> searchListProducts(int limit, int offset,
      String start, String end, int adults, String address);
}

class ProductApiDataSourceImpl implements ProductApiDataSource {
  final Dio dio;

  ProductApiDataSourceImpl(this.dio);

  @override
  Future<List<ProductDto>> getListProducts(int limit, int offset) async {
    List<ProductDto> listOfArticles = [];
    try {
      final response =
          await dio.get("https://idwey.tn/api/product?offset=$offset&limit=10");

      response.data['rows'].forEach((data) {
        listOfArticles.add(ProductDto.fromJson(data));
      });

      return listOfArticles;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ProductDetailsDto> getProduct(int id) async {
    try {
      final response = await dio.get("https://idwey.tn/api/product/detail/$id");
      print(response.data.toString());
      return ProductDetailsDto.fromJson(response.data);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<List<ProductDto>> searchListProducts(int limit, int offset,
      String start, String end, int adults, String address) async {
    List<ProductDto> listOfHosts = [];

    final response = await dio.get(
        "https://idwey.tn/api/product?offset=$offset&limit=$limit&start=$start&end=$end&address=$address&adults=$adults");

    response.data['rows'].forEach((data) {
      listOfHosts.add(ProductDto.fromJson(data));
    });

    return listOfHosts;
  }
}
