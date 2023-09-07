part of 'details_page_bloc.dart';

@freezed
class DetailsPageState with _$DetailsPageState {
  const factory DetailsPageState({
    String? title,
    StateStatus? status,
    HostDetails? hostDetails,
  }) = _DetailsPageState;

  factory DetailsPageState.initial() => const DetailsPageState(
        title: "Home",
        status: StateStatus.init,
        hostDetails: null,
      );
}
