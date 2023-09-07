part of 'details_event_page_bloc.dart';

@freezed
class DetailsEventPageEvent with _$DetailsEventPageEvent {
  const factory DetailsEventPageEvent.getEventDetails(int id) = GetEventDetails;
}
