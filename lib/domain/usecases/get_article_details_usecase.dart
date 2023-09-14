import 'package:dartz/dartz.dart';
import 'package:idwey/data/models/article_details_dto.dart';
import 'package:idwey/data/models/event_details_dto.dart';
import 'package:idwey/domain/repositories/repositories.dart';

import 'usecase.dart';

/// get event details usecase

class GetArticleDetailsUseCase extends UseCase<ArticleDetailsDto, int> {
  final ArticleRepository _articleRepository;

  GetArticleDetailsUseCase(this._articleRepository);

  @override
  Future<Either<Exception, ArticleDetailsDto>> call(int params) async {
    return await _articleRepository.getArticle(params);
  }
}
