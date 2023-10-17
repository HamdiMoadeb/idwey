part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    StateStatus? status,
    StateStatus? addToCartStatus,
    ProductDetailsDto? productDetailsDto,
    int? productNumber,
  }) = _ProductDetailsState;

  factory ProductDetailsState.initial() => const ProductDetailsState(
        status: StateStatus.init,
        addToCartStatus: StateStatus.init,
        productDetailsDto: null,
        productNumber: 1,
      );
}
