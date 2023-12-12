part of 'add_review_bloc.dart';

@freezed
class AddReviewEvent with _$AddReviewEvent {
  const factory AddReviewEvent.getRateSettings() = GetRateSettings;
  const factory AddReviewEvent.addReview() = AddReview;
  const factory AddReviewEvent.updateReview() = UpdateReview;
  const factory AddReviewEvent.setRate(String title, int rate) = SetRate;
  const factory AddReviewEvent.setComment(String comment) = SetComment;
  const factory AddReviewEvent.setParams(String id, String type) = SetParams;
  const factory AddReviewEvent.setRateSettings(
      List<Map<String, dynamic>> listRates) = SetRateSettings;
}
