part of 'details_activity_page_bloc.dart';

@freezed
class DetailsActivityPageEvent with _$DetailsActivityPageEvent {
  const factory DetailsActivityPageEvent.getActivityDetails(int id) =
      GetActivityDetails;
}
