import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/domain/usecases/get_monthly_points_usecase.dart';
import 'package:idwey/domain/usecases/get_total_points_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'fidelity_program_bloc.freezed.dart';
part 'fidelity_program_event.dart';
part 'fidelity_program_state.dart';

class FidelityProgramBloc
    extends Bloc<FidelityProgramEvent, FidelityProgramState> {
  FidelityProgramBloc() : super(FidelityProgramState.initial()) {
    on<GetMonthlyPoints>(getMontlyPoints);
    on<GetTotalPoints>(getTotalPoints);
  }

  getMontlyPoints(
      GetMonthlyPoints event, Emitter<FidelityProgramState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final Either<Exception, Map<String, dynamic>?> result =
        await GetIt.I<GetMonthlyPointsUseCase>().call(userId ?? "");
    print("result");
    print(result);
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (Map<String, dynamic>? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          monthlyPoints: success["month_point"].toString(),
          rank: success["rank"].toString(),
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }

  getTotalPoints(
      GetTotalPoints event, Emitter<FidelityProgramState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    emit(state.copyWith(
      statusRange: StateStatus.loading,
    ));
    final Either<Exception, Map<String, dynamic>?> result =
        await GetIt.I<GetTotalPointsUseCase>().call(userId ?? "");
    print("result");
    print(result);
    result.fold((Exception failure) {
      emit(state.copyWith(
        statusRange: StateStatus.error,
      ));
    }, (Map<String, dynamic>? success) async {
      if (success != null) {
        emit(state.copyWith(
          statusRange: StateStatus.success,
          totalPoints: success["pointniveau1"].toString(),
          totalPoints2: success["pointniveau2"].toString(),
          points: success["point"].toString(),
        ));
        print(state.totalPoints);
        print(state.totalPoints2);
      } else {
        emit(state.copyWith(
          statusRange: StateStatus.error,
        ));
      }
    });
  }
}
