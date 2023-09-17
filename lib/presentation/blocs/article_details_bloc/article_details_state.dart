part of 'article_details_bloc.dart';

@freezed
class ArticleDetailsState with _$ArticleDetailsState {
  const factory ArticleDetailsState({
    StateStatus? status,
    ArticleDetailsDto? articleDetailsDto,
  }) = _ArticleDetailsState;

  factory ArticleDetailsState.initial() => const ArticleDetailsState(
        status: StateStatus.init,
        articleDetailsDto: null,
      );
}
