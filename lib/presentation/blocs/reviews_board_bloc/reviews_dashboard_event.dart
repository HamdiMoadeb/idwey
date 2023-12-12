part of 'reviews_dashboard_bloc.dart';

@freezed
class ReviewsDashboardEvent with _$ReviewsDashboardEvent {
  const factory ReviewsDashboardEvent.started() = _Started;
  const factory ReviewsDashboardEvent.getReviews() = GetReviews;
  const factory ReviewsDashboardEvent.onChangeType(String type) = OnChangeType;
}
