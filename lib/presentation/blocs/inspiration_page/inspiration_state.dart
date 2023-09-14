part of 'inspiration_bloc.dart';

@freezed
class InspirationState with _$InspirationState {
  const factory InspirationState({
    String? title,
    StateStatus? status,
    List<ArticleDto>? listArticles,
    bool? isFetching,
    bool? atTheEndOfThePage,
    int? page,
  }) = _InspirationState;

  factory InspirationState.initial() => const InspirationState(
      title: "Home",
      status: StateStatus.init,
      isFetching: false,
      listArticles: [],
      atTheEndOfThePage: false,
      page: 0);
}
