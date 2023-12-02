import 'package:dartz/dartz.dart';
import 'package:idwey/domain/repositories/article_repository.dart';
import '../../data/models/models.dart';
import 'usecase.dart';

class GetListArticlesUseCase
    implements UseCase<List<ArticleDto>?, Map<String, dynamic>> {
  final ArticleRepository repository;

  GetListArticlesUseCase(this.repository);

  @override
  Future<Either<Exception, List<ArticleDto>>> call(
      Map<String, dynamic> body) async {

    return await repository.getListArticles(body['limit'], body['offset']);
  }
}
