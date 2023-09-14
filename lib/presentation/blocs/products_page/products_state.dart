part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    String? title,
    StateStatus? status,
    List<ProductDto>? listArticles,
    bool? isFetching,
    bool? atTheEndOfThePage,
    int? page,
  }) = _ProductsState;

  factory ProductsState.initial() => const ProductsState(
      status: StateStatus.init,
      isFetching: false,
      listArticles: [],
      atTheEndOfThePage: false,
      page: 0);
}
