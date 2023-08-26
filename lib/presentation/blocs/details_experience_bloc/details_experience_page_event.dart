part of 'details_experience_page_bloc.dart';

@freezed
class DetailsExperiencePageEvent with _$DetailsExperiencePageEvent {
  const factory DetailsExperiencePageEvent.getExperienceDetails(int id) =
      GetExperienceDetails;
}
