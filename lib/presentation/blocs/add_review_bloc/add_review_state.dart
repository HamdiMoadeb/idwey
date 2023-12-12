part of 'add_review_bloc.dart';

@freezed
class AddReviewState with _$AddReviewState {
  const factory AddReviewState({
    StateStatus? status,
    StateStatus? statusRateSettings,
    StateStatus? updateReviewStatus,
    List<Map<String, dynamic>>? rates,
    List<Map<String, dynamic>>? ratesStars,
    String? review,
    String? serviceType,
    String? serviceID,
  }) = _AddReviewState;

  factory AddReviewState.initial() => const AddReviewState(
        status: StateStatus.init,
        statusRateSettings: StateStatus.init,
        updateReviewStatus: StateStatus.init,
        rates: [],
        ratesStars: [],
        review: "",
        serviceType: "",
        serviceID: "",
      );
}
