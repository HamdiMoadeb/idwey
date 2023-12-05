import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/domain/usecases/get_host_details_usecase.dart';

import '../../../data/models/extra_price_dto.dart';

part 'details_page_event.dart';
part 'details_page_bloc.freezed.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc() : super(DetailsPageState.initial()) {
    on<GetHostDetails>(_getDetailsHost);
    on<_OnExtraPriceChecked>(onExtraPriceChecked);
    on<_OnExtraPriceUnChecked>(onExtraPriceUnChecked);
  }

  _getDetailsHost(GetHostDetails event, Emitter<DetailsPageState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
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
    final updatedExtraPrice = List<ExtraPrice>.from(state.extraPrice ?? []);
    updatedExtraPrice.add(event.extraPrice);

    // Update the state with the new list
    emit(state.copyWith(extraPrice: updatedExtraPrice));

    print("state.extraPrice");
    print(updatedExtraPrice); // Print the updated list
  }

  void onExtraPriceUnChecked(
      _OnExtraPriceUnChecked event, Emitter<DetailsPageState> emit) async {
    // Create a new list with the updated values
    final updatedExtraPrice = List<ExtraPrice>.from(state.extraPrice ?? []);
    updatedExtraPrice.remove(event.extraPrice);

    // Update the state with the new list
    emit(state.copyWith(extraPrice: updatedExtraPrice));

    print("state.extraPrice");
    print(updatedExtraPrice); // Print the updated list
  }
}
