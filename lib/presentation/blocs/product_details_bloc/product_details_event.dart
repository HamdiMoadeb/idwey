part of 'product_details_bloc.dart';

@freezed
class ProductDetailsEvent with _$ProductDetailsEvent {
  const factory ProductDetailsEvent.getDetailsProduct(int id) =
      GetDetailsProduct;

  const factory ProductDetailsEvent.addProduct(int id) = AddProduct;

  const factory ProductDetailsEvent.addToCart(TypeReservation typeReservation) =
      AddToCart;
}
