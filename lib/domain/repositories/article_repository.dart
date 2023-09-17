import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/article_details_dto.dart';
import 'package:idwey/data/models/models.dart';

abstract class ArticleRepository {
  Future<Either<Exception, List<ArticleDto>>> getListArticles(
      int limit, int offset);
  Future<Either<Exception, ArticleDetailsDto>> getArticle(int id);
}
