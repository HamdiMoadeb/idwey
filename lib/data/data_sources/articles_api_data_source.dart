import 'package:dio/dio.dart';
import 'package:idwey/data/models/article_details_dto.dart';
import '../models/models.dart';

abstract class ArticleApiDataSource {
  Future<List<ArticleDto>> getListArticles(int limit, int offset);
  Future<ArticleDetailsDto> getArticle(int id);
}

class ArticleApiDataSourceImpl implements ArticleApiDataSource {
  final Dio dio;

  ArticleApiDataSourceImpl(this.dio);

  @override
  Future<List<ArticleDto>> getListArticles(int limit, int offset) async {
    List<ArticleDto> listOfArticles = [];
    try {
      final response =
          await dio.get("https://idwey.tn/api/blog?offset=$offset&limit=10");

      response.data['rows'].forEach((data) {
        listOfArticles.add(ArticleDto.fromJson(data));
      });

      return listOfArticles;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<ArticleDetailsDto> getArticle(int id) async {
    try {
      final response = await dio.get("https://idwey.tn/api/blog/detail/$id");

      return ArticleDetailsDto.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
