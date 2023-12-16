import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/review_dto.dart';
import 'package:idwey/data/models/reviews_board_dto.dart';
import 'package:idwey/domain/usecases/get_dashboard_reviews.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'reviews_dashboard_event.dart';
part 'reviews_dashboard_state.dart';
part 'reviews_dashboard_bloc.freezed.dart';

class ReviewsDashboardBloc
    extends Bloc<ReviewsDashboardEvent, ReviewsDashboardState> {
  ReviewsDashboardBloc() : super(ReviewsDashboardState.initial()) {
    on<GetReviews>(getReviews);
    on<OnChangeType>(changeType);
  }

  void getReviews(GetReviews event, Emitter<ReviewsDashboardState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    print("getReviews");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId") ?? "";
    print("userId");
    print(userId);
    try {
      final Either<Exception, ReviewsBoardDto> result =
          await GetIt.I<GetDashboardReviews>()
              .call({"serviceId": userId, "type": state.type}).then((value) {
        return value;
      });
      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }, (ReviewsBoardDto success) {
        print("success");
        print(success);
        print(success.reviews);
        print(success.notreviewed);

        emit(state.copyWith(
          status: StateStatus.success,
          reviewsBoardDto: success,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }
  }

  void changeType(
      OnChangeType event, Emitter<ReviewsDashboardState> emit) async {
    print("changeType");
    emit(state.copyWith(type: event.type));
  }
}
