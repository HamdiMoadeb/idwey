import 'package:dio/dio.dart';
import 'package:idwey/data/models/activity_details_dto.dart';
import 'package:idwey/data/models/article_details_dto.dart';
import 'package:idwey/data/models/product_details_dto.dart';
import 'package:idwey/data/models/product_dto.dart';
import '../models/models.dart';

abstract class ProductApiDataSource {
  Future<List<ProductDto>> getListProducts(int limit, int offset);
  Future<ProductDetailsDto> getProduct(int id);
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

      return ProductDetailsDto.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}