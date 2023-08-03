part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    String? title,
    StateStatus? status,
    StateStatus? statusEvent,
    List<Host>? listHosts,
    List<Event>? listEvents,
    bool? isFetching,
    bool? atTheEndOfThePage,
    int? page,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
      title: "Home",
      status: StateStatus.init,
      statusEvent: StateStatus.init,
      listHosts: [],
      listEvents: [],
      isFetching: false,
      atTheEndOfThePage: false,
      page: 0);
}
