import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/domain/usecases/get_host_details_usecase.dart';

import '../../../data/models/extra_price_dto.dart';

part 'details_page_bloc.freezed.dart';
part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc() : super(DetailsPageState.initial()) {
    on<GetHostDetails>(_getDetailsHost);
    on<_OnExtraPriceChecked>(onExtraPriceChecked);
    on<_OnExtraPriceUnChecked>(onExtraPriceUnChecked);
    on<_OnExtraPriceQuantityChanged>(onExtraPriceQuantityChanged);
  }

  _getDetailsHost(GetHostDetails event, Emitter<DetailsPageState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
      extraPrice: [],
      extraPriceTotal: 0.0,
    ));
    final Either<Exception, HostDetails?> result =
        await GetIt.I<GetHostUseCase>().call({"id": event.id});
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (HostDetails? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          hostDetails: success,
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }

  String getFirstImage(List<GalleryImagesUrl>? gallery) {
    String image = "";
    for (var i = 0; i < gallery!.length; i++) {
      if (gallery[i].large != null && gallery[i].large!.isNotEmpty) {
        image = gallery[i].large!;
        break;
      }
    }
    return image;
  }

  void onExtraPriceChecked(
      _OnExtraPriceChecked event, Emitter<DetailsPageState> emit) async {
    // Create a new list with the updated values
    print("event.extraPrice.quantity");
    print(event.extraPrice.quantity);
    final updatedExtraPrice = List<ExtraPrice>.from(state.extraPrice ?? []);

    final index = updatedExtraPrice
        .indexWhere((element) => element.name == event.extraPrice.name);

    if (index != -1) {
      print("alreaady exist");
      // updatedExtraPrice[index] = event.extraPrice;
    } else {
      updatedExtraPrice.add(event.extraPrice);
    }

    /// print list of extra price

    for (var i = 0; i < updatedExtraPrice.length; i++) {
      print(updatedExtraPrice[i].name);
      print(updatedExtraPrice[i].quantity);
    }

    // Update the state with the new list
    emit(state.copyWith(
        extraPrice: updatedExtraPrice,
        extraPriceTotal: updatedExtraPrice.fold(
            0,
            (previousValue, element) =>
                previousValue! +
                double.parse(element.price ?? "0.00") *
                    (element.quantity ?? 1))));

    print("state.extraPrice");
    print(updatedExtraPrice); // Print the updated list
  }

  void onExtraPriceUnChecked(
      _OnExtraPriceUnChecked event, Emitter<DetailsPageState> emit) async {
    // Create a new list with the updated values
    print("event.extraPrice.quantityremoove");
    print(event.extraPrice.quantity);
    final updatedExtraPrice = List<ExtraPrice>.from(state.extraPrice ?? []);
    updatedExtraPrice
        .removeWhere((element) => element.name == event.extraPrice.name);
    print("event.extraPrice.quantityremoove");
    print(updatedExtraPrice);
    // Update the state with the new list
    /// remove the extra price prices from the extra price total

    emit(state.copyWith(
        extraPrice: updatedExtraPrice,
        extraPriceTotal: updatedExtraPrice.fold(
            0,
            (previousValue, element) =>
                previousValue! +
                double.parse(element.price ?? "0.00") *
                    (element.quantity ?? 1))));

    print("state.extraPriceTotal");
    print(state.extraPriceTotal); // Print the updated list
  }

  /// This method is called when the user changes the quantity of an extra price

  void onExtraPriceQuantityChanged(_OnExtraPriceQuantityChanged event,
      Emitter<DetailsPageState> emit) async {
    /// Create a new list with the updated values
    /// check if the extra price is already in the list

    if (state.extraPrice != null && state.extraPrice!.isNotEmpty) {
      final index = state.extraPrice!
          .indexWhere((element) => element.name == event.extraPrice.name);
      if (index != -1) {
        final updatedExtraPrice = List<ExtraPrice>.from(state.extraPrice ?? []);
        updatedExtraPrice[index] = event.extraPrice;

        /// Update the state with the new list
        emit(state.copyWith(
            extraPrice: updatedExtraPrice,
            extraPriceTotal: updatedExtraPrice.fold(
                0,
                (previousValue, element) =>
                    previousValue! +
                    double.parse(element.price ?? "0.00") *
                        (element.quantity ?? 1))));

        print("state.extraPricetotlaaa");
        print(state.extraPriceTotal); // Print the updated list
      } else {
        ///update git the extra price
        print("doexn't exist in the list******");
      }
    } else {
      /// change user test
      // final updatedExtraPrice = List<ExtraPrice>.from(state.extraPrice ?? []);
      // updatedExtraPrice.add(event.extraPrice);
      // emit(state.copyWith(extraPrice: updatedExtraPrice));

      print("state.updatedExtraPrice");
      print(state.extraPrice); // Print the updated list
    }
  }
}
