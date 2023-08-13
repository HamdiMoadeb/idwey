import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/domain/usecases/get_host_details_usecase.dart';

part 'details_page_event.dart';
part 'details_page_bloc.freezed.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DetailsPageBloc() : super(DetailsPageState.initial()) {
    on<GetHostDetails>(_getDetailsHost);
  }

  _getDetailsHost(GetHostDetails event, Emitter<DetailsPageState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final Either<Exception, HostDetails?> result =
        await GetIt.I<GetHostUseCase>().call({"id": event.id});
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (HostDetails? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          hostDetails: success,
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }
}
