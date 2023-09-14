import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/product_details_dto.dart';
import 'package:idwey/domain/usecases/get_products_details_usecase.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';
part 'product_details_bloc.freezed.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsState.initial()) {
    on<GetDetailsProduct>(_getDetailsProduct);
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
}
