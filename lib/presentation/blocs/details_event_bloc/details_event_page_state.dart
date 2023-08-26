part of 'details_event_page_bloc.dart';

@freezed
class DetailsEventPageState with _$DetailsEventPageState {
  const factory DetailsEventPageState({
    String? title,
    StateStatus? status,
    EventDetailsDto? eventDetailsDto,
  }) = _DetailsEventPageState;

  factory DetailsEventPageState.initial() => const DetailsEventPageState(
        title: "Home",
        status: StateStatus.init,
        eventDetailsDto: null,
      );
}
