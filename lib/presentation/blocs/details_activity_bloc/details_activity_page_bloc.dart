import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/activity_details_dto.dart';
import 'package:idwey/domain/usecases/usecases.dart';

part 'details_activity_page_event.dart';
part 'details_activity_page_bloc.freezed.dart';
part 'details_activity_page_state.dart';

class DetailsActivityPageBloc
    extends Bloc<DetailsActivityPageEvent, DetailsActivityPageState> {
  DetailsActivityPageBloc() : super(DetailsActivityPageState.initial()) {
    on<GetActivityDetails>(_getDetailsActivity);
  }

  _getDetailsActivity(
      GetActivityDetails event, Emitter<DetailsActivityPageState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final Either<Exception, ActivityDetailsDto?> result =
        await GetIt.I<GetActivityDetailsUseCase>().call(event.id);
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (ActivityDetailsDto? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          activityDetailsDto: success,
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }
}
