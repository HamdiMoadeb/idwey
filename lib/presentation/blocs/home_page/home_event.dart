part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getUserRole(String roleUser) = GetUserRole;

  const factory HomeEvent.getListHosts(bool isFetching) = GetListHost;
  const factory HomeEvent.getListEvents(bool isFetching) = GetListEvent;
  const factory HomeEvent.getListActivities(bool isFetching) =
      GetListActivities;
  const factory HomeEvent.getListExperiences(bool isFetching) =
      GetListExperiences;
}
