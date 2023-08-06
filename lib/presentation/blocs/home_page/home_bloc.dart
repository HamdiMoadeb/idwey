import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/hostDTO.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/domain/usecases/get_list_activities_usecase.dart';
import 'package:idwey/domain/usecases/get_list_events_usecase.dart';
import 'package:idwey/domain/usecases/get_list_experiences_usecase.dart';
import 'package:idwey/domain/usecases/get_list_hosts.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<GetUserRole>(_getUserRole);
    on<GetListHost>(_getListHosts);
    on<GetListEvent>(_getListEvents);
    on<GetListActivities>(_getListActivities);
    on<GetListExperiences>(_getListExperiences);
  }

  _getUserRole(GetUserRole event, Emitter<HomeState> emit) {}

  setAtTheEndOfThePage() {
    emit(state.copyWith(
      atTheEndOfThePage: true,
    ));
  }

  _getListHosts(GetListHost event, Emitter<HomeState> emit) async {
    try {
      if (state.atTheEndOfThePage == true) {
        return;
      }
      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage =
          state.pageHosts ?? 0; // Use a default value if state.page is null

      final Either<Exception, List<Host>?> result =
          await GetIt.I<GetListHostsUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfThePage: false,
          isFetching: false,
        ));
      }, (List<Host>? success) async {
        if (success != null && success.isNotEmpty) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success.length < 10;

          emit(state.copyWith(
            status: StateStatus.success,
            listHosts: state.listHosts! + success,
            isFetching: false,
            atTheEndOfThePage: atTheEndOfThePage,
            pageHosts: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfThePage:
                true, // Mark atTheEndOfThePage as true when there is no more data
            isFetching: false,
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.error,
        isFetching: false,
      ));
    }
  }

  _getListEvents(GetListEvent event, Emitter<HomeState> emit) async {
    try {
      if (state.atTheEndOfThePage == true) {
        return;
      }
      emit(state.copyWith(
        statusEvent:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage =
          state.pageEvents ?? 0; // Use a default value if state.page is null

      final Either<Exception, List<Event>?> result =
          await GetIt.I<GetListEventsUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          statusEvent: StateStatus.error,
          atTheEndOfThePage: false,
          isFetching: false,
        ));
      }, (List<Event>? success) async {
        if (success != null && success.isNotEmpty) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success.length < 10;

          emit(state.copyWith(
            statusEvent: StateStatus.success,
            listEvents: state.listEvents! + success,
            isFetching: false,
            atTheEndOfThePage: atTheEndOfThePage,
            pageEvents: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusEvent: StateStatus.error,
            atTheEndOfThePage:
                true, // Mark atTheEndOfThePage as true when there is no more data
            isFetching: false,
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        statusEvent: StateStatus.error,
        isFetching: false,
      ));
    }
  }

  _getListExperiences(GetListExperiences event, Emitter<HomeState> emit) async {
    try {
      if (state.atTheEndOfThePage == true) {
        return;
      }
      emit(state.copyWith(
        statusExperiences:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.pageExperiences ??
          0; // Use a default value if state.page is null

      final Either<Exception, List<Experience>?> result =
          await GetIt.I<GetListExperiencesUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          statusExperiences: StateStatus.error,
          atTheEndOfThePage: false,
          isFetching: false,
        ));
      }, (List<Experience>? success) async {
        if (success != null && success.isNotEmpty) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success.length < 10;

          emit(state.copyWith(
            statusExperiences: StateStatus.success,
            listExperiences: state.listExperiences! + success,
            isFetching: false,
            atTheEndOfThePage: atTheEndOfThePage,
            pageExperiences: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusExperiences: StateStatus.error,
            atTheEndOfThePage:
                true, // Mark atTheEndOfThePage as true when there is no more data
            isFetching: false,
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        statusExperiences: StateStatus.error,
        isFetching: false,
      ));
    }
  }

  _getListActivities(GetListActivities event, Emitter<HomeState> emit) async {
    try {
      if (state.atTheEndOfThePage == true) return;

      emit(state.copyWith(
        statusActivities:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.pageActivities ??
          0; // Use a default value if state.page is null

      final Either<Exception, List<Activity>?> result =
          await GetIt.I<GetListActivitiesUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          statusActivities: StateStatus.error,
          atTheEndOfThePage: false,
          isFetching: false,
        ));
      }, (List<Activity>? success) async {
        if (success != null && success.isNotEmpty) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success.length < 10;

          emit(state.copyWith(
            statusActivities: StateStatus.success,
            listActivities: state.listActivities! + success,
            isFetching: false,
            atTheEndOfThePage: atTheEndOfThePage,
            pageActivities: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusActivities: StateStatus.error,
            atTheEndOfThePage:
                true, // Mark atTheEndOfThePage as true when there is no more data
            isFetching: false,
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        statusActivities: StateStatus.error,
        isFetching: false,
      ));
    }
  }
}
