import 'package:dartz/dartz.dart';
import 'package:idwey/data/data_sources/articles_api_data_source.dart';
import 'package:idwey/data/models/article_details_dto.dart';
import 'package:idwey/data/models/article_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleApiDataSource dataSource;
  ArticleRepositoryImpl(this.dataSource);
  @override
  Future<Either<Exception, List<ArticleDto>>> getListArticles(
      int limit, int offset) async {
    try {
      final result = await dataSource.getListArticles(limit, offset);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, ArticleDetailsDto>> getArticle(int id) async {
    try {
      final result = await dataSource.getArticle(id);

      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
