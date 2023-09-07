part of 'details_experience_page_bloc.dart';

@freezed
class DetailsExperiencePageState with _$DetailsExperiencePageState {
  const factory DetailsExperiencePageState({
    String? title,
    StateStatus? status,
    ExperienceDetailsDto? experienceDetailsDto,
  }) = _DetailsExperiencePageState;

  factory DetailsExperiencePageState.initial() =>
      const DetailsExperiencePageState(
        title: "Home",
        status: StateStatus.init,
        experienceDetailsDto: null,
      );
}
