part of 'article_details_bloc.dart';

@freezed
class ArticleDetailsEvent with _$ArticleDetailsEvent {
  const factory ArticleDetailsEvent.getArticleDetails(int id) =
      GetArticleDetails;
}
