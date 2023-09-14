part of 'product_details_bloc.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    StateStatus? status,
    ProductDetailsDto? productDetailsDto,
  }) = _ProductDetailsState;

  factory ProductDetailsState.initial() => const ProductDetailsState(
        status: StateStatus.init,
        productDetailsDto: null,
      );
}
