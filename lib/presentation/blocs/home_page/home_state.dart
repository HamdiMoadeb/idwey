part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    String? title,
    StateStatus? status,
    StateStatus? statusEvent,
    StateStatus? statusActivities,
    StateStatus? statusExperiences,
    List<Host>? listHosts,
    List<Event>? listEvents,
    List<Activity>? listActivities,
    List<Experience>? listExperiences,
    bool? isFetching,
    bool? atTheEndOfThePageHosts,
    bool? atTheEndOfThePageEvents,
    bool? atTheEndOfThePageActivities,
    bool? atTheEndOfThePageExperiences,
    int? pageHosts,
    int? pageActivities,
    int? pageExperiences,
    int? pageEvents,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
      title: "Home",
      status: StateStatus.init,
      statusEvent: StateStatus.init,
      statusActivities: StateStatus.init,
      statusExperiences: StateStatus.init,
      listHosts: [],
      listEvents: [],
      listActivities: [],
      listExperiences: [],
      isFetching: false,
      atTheEndOfThePageHosts: false,
      atTheEndOfThePageActivities: false,
      atTheEndOfThePageEvents: false,
      atTheEndOfThePageExperiences: false,
      pageActivities: 0,
      pageEvents: 0,
      pageExperiences: 0,
      pageHosts: 0);
}
