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
    List<LocationsDto>? listLocations,
    List<String>? emplacementList,
    bool? isFetching,
    bool? atTheEndOfThePageHosts,
    bool? atTheEndOfTheSearchPageHosts,
    bool? atTheEndOfThePageEvents,
    bool? atTheEndOfTheSearchPageEvents,
    bool? atTheEndOfThePageActivities,
    bool? atTheEndOfTheSearchPageActivities,
    bool? atTheEndOfThePageExperiences,
    bool? atTheEndOfTheSearchPageExperiences,
    bool? isSearch,
    int? pageHosts,
    int? searchPageHosts,
    int? pageActivities,
    int? pageSearchActivities,
    int? pageExperiences,
    int? pageSearchExperiences,
    int? pageEvents,
    int? pageSearchEvents,
    int? selectedTab,
    String? startDate,
    String? endDate,
    String? city,
    String? emplacement,
    int? guests,
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
      listLocations: [],
      emplacementList: [],
      isFetching: false,
      atTheEndOfThePageHosts: false,
      atTheEndOfTheSearchPageHosts: false,
      atTheEndOfThePageActivities: false,
      atTheEndOfThePageEvents: false,
      atTheEndOfThePageExperiences: false,
      isSearch: false,
      pageActivities: 0,
      pageEvents: 0,
      searchPageHosts: 0,
      pageExperiences: 0,
      selectedTab: 0,
      startDate: "",
      endDate: "",
      city: "",
      emplacement: "",
      guests: 1,
      pageSearchActivities: 0,
      pageSearchExperiences: 0,
      pageSearchEvents: 0,
      atTheEndOfTheSearchPageActivities: false,
      atTheEndOfTheSearchPageExperiences: false,
      atTheEndOfTheSearchPageEvents: false,
      pageHosts: 0);
}
