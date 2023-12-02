import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/product_details_dto.dart';
import 'package:idwey/domain/usecases/confirm_reservation_usecase.dart';
import 'package:idwey/domain/usecases/get_products_details_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsState.initial()) {
    on<GetDetailsProduct>(_getDetailsProduct);
    on<AddProduct>(_addProduct);
    on<AddToCart>(addToCart);
  }

  _getDetailsProduct(
      GetDetailsProduct event, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final Either<Exception, ProductDetailsDto?> result =
        await GetIt.I<GetProductDetailsUseCase>().call(event.id);
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (ProductDetailsDto? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          productDetailsDto: success,
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }

  _addProduct(AddProduct event, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(productNumber: event.id));
  }

  void addToCart(AddToCart event, Emitter<ProductDetailsState> emit) async {
    emit(state.copyWith(
        addToCartStatus: StateStatus.loading, status: StateStatus.success));
    //  try {
    Map<String, dynamic> map = {};
    map = {
      "number": state.productNumber,
      "extra_price": [],
      "promo_code": "",
      "service_id": state.productDetailsDto?.row?.id,
      "service_type": "product"
    };

    final result = await GetIt.I<ConfirmReservationUseCase>().call(map);

    result.fold((l) async {

      emit(state.copyWith(
          addToCartStatus: StateStatus.error, status: StateStatus.success));
    }, (r) async {

      emit(state.copyWith(
          addToCartStatus: StateStatus.success, status: StateStatus.success));
      GetIt.I<AppRouter>().push(ConfirmReservationRoute(
        price: state.productDetailsDto?.row?.price,
        typeReservation: event.typeReservation,
        url: state.productDetailsDto?.bannerImageUrl ?? "",
        hostName: state.productDetailsDto?.row?.title ?? "",
        // dateDebut: state.checkIn ?? "",
        // dateFin: state.checkOut ?? "",
        adultes: state.productNumber.toString() ?? "",
        total: (state.productNumber! *
                double.parse(state.productDetailsDto?.row?.price ?? ""))
            .toInt()
            .toString(),
        //  nuits: state.nbNights ?? "",
        id: state.productDetailsDto?.toString(),
        code: r['booking']['code'],
        customerId: "",
        // selectedRooms: selectedRooms,
      ));
    });

    // } catch (e) {
    //   emit(state.copyWith(
    //     addToCartStatus: StateStatus.error,
    //   ));
    // }
  }
}
