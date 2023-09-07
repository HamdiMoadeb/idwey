import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/experience_details_dto.dart';
import 'package:idwey/domain/usecases/usecases.dart';

part 'details_experience_page_event.dart';
part 'details_experience_page_bloc.freezed.dart';
part 'details_experience_page_state.dart';

class DetailsExperiencePageBloc
    extends Bloc<DetailsExperiencePageEvent, DetailsExperiencePageState> {
  DetailsExperiencePageBloc() : super(DetailsExperiencePageState.initial()) {
    on<GetExperienceDetails>(_getDetailsExperience);
  }

  _getDetailsExperience(GetExperienceDetails event,
      Emitter<DetailsExperiencePageState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final Either<Exception, ExperienceDetailsDto?> result =
        await GetIt.I<GetExperienceDetailsUseCase>().call(event.id);
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (ExperienceDetailsDto? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          experienceDetailsDto: success,
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }
}
