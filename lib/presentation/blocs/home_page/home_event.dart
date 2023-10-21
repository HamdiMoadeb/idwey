part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getUserRole(String roleUser) = GetUserRole;

  const factory HomeEvent.getListHosts(bool isFetching) = GetListHost;
  const factory HomeEvent.getListLocations() = GetListLocations;
  const factory HomeEvent.getSearchListHosts(bool isFetching) =
      GetSearchListHost;

  const factory HomeEvent.getListEvents(bool isFetching) = GetListEvent;

  const factory HomeEvent.getSearchListEvents(bool isFetching) =
      GetSearchListEvent;

  const factory HomeEvent.getSearchListActivities(bool isFetching) =
      GetSearchListActivities;

  const factory HomeEvent.getSearchListExperiences(bool isFetching) =
      GetSearchListExperiences;

  const factory HomeEvent.getListActivities(bool isFetching) =
      GetListActivities;
  const factory HomeEvent.getListExperiences(bool isFetching) =
      GetListExperiences;

  const factory HomeEvent.setSelectedTab(int tab) = SetSelectedTab;
  const factory HomeEvent.changeStartDate(String startDate) = _ChangeStartDate;
  const factory HomeEvent.changeEndDate(String endDate) = _ChangeEndDate;
  const factory HomeEvent.changeCity(String city) = _ChangeCity;
  const factory HomeEvent.changeEmplacement(String city) = _ChangeEmplacement;
  const factory HomeEvent.changeGuests(int guests) = _ChangeGuests;
  const factory HomeEvent.onSetSearch(bool search) = _OnSetSearch;
}
