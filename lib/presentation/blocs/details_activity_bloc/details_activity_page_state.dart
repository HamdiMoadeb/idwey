part of 'details_activity_page_bloc.dart';

@freezed
class DetailsActivityPageState with _$DetailsActivityPageState {
  const factory DetailsActivityPageState({
    String? title,
    StateStatus? status,
    ActivityDetailsDto? activityDetailsDto,
  }) = _DetailsActivityPageState;

  factory DetailsActivityPageState.initial() => const DetailsActivityPageState(
        title: "Home",
        status: StateStatus.init,
        activityDetailsDto: null,
      );
}
