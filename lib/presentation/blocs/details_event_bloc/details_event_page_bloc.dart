import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/event_details_dto.dart';
import 'package:idwey/domain/usecases/usecases.dart';

part 'details_event_page_event.dart';
part 'details_event_page_bloc.freezed.dart';
part 'details_event_page_state.dart';

class DetailsEventPageBloc
    extends Bloc<DetailsEventPageEvent, DetailsEventPageState> {
  DetailsEventPageBloc() : super(DetailsEventPageState.initial()) {
    on<GetEventDetails>(_getDetailsEvent);
  }

  _getDetailsEvent(
      GetEventDetails event, Emitter<DetailsEventPageState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final Either<Exception, EventDetailsDto?> result =
        await GetIt.I<GetEventDetailsUseCase>().call(event.id);
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (EventDetailsDto? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          eventDetailsDto: success,
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }
}
