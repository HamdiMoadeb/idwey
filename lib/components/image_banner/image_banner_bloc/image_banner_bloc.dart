import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/host_details_dto.dart';

part 'image_banner_event.dart';
part 'image_banner_state.dart';
part 'image_banner_bloc.freezed.dart';

class ImageBannerBloc extends Bloc<ImageBannerEvent, ImageBannerState> {
  ImageBannerBloc() : super(ImageBannerState.initial()) {
    on<SetListImages>(setListImages);
    on<SetCurrentImage>(setCurrentImage);
  }

  setListImages(SetListImages event, Emitter<ImageBannerState> emit) {
    emit(state.copyWith(
      listImages: event.listImages,
      status: StateStatus.success,
    ));
  }

  setCurrentImage(SetCurrentImage event, Emitter<ImageBannerState> emit) {
    emit(state.copyWith(
      currentImage: event.index,
    ));
  }
}
