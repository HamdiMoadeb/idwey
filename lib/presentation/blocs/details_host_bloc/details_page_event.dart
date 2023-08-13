part of 'details_page_bloc.dart';

@freezed
class DetailsPageEvent with _$DetailsPageEvent {
  const factory DetailsPageEvent.getHostDetails(int id) = GetHostDetails;
}
