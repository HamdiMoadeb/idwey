part of 'image_banner_bloc.dart';

@freezed
class ImageBannerEvent with _$ImageBannerEvent {
  const factory ImageBannerEvent.started() = _Started;
  const factory ImageBannerEvent.setListImages(
      List<GalleryImagesUrl> listImages) = SetListImages;
  const factory ImageBannerEvent.setCurrentImage(int index) = SetCurrentImage;
}
