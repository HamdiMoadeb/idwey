part of 'reviews_dashboard_bloc.dart';

@freezed
class ReviewsDashboardState with _$ReviewsDashboardState {
  const factory ReviewsDashboardState({
    StateStatus? status,
    ReviewsBoardDto? reviewsBoardDto,
    String? type,
  }) = _ReviewsDashboardState;

  factory ReviewsDashboardState.initial() => const ReviewsDashboardState(
        status: StateStatus.init,
        reviewsBoardDto: null,
        type: "host",
      );
}
