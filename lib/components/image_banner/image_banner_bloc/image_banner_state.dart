part of 'image_banner_bloc.dart';

@freezed
class ImageBannerState with _$ImageBannerState {
  const factory ImageBannerState({
    StateStatus? status,
    List<Gallery>? listImages,
    int? currentImage,
  }) = _ImageBannerState;

  factory ImageBannerState.initial() => const ImageBannerState(
        status: StateStatus.init,
        listImages: [],
        currentImage: 0,
      );
}
