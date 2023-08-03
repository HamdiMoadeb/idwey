import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/hostDTO.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/domain/usecases/get_list_events_usecase.dart';
import 'package:idwey/domain/usecases/get_list_hosts.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<GetUserRole>(_getUserRole);
    on<GetListHost>(_getListHosts);
    on<GetListEvent>(_getListEvents);
  }

  _getUserRole(GetUserRole event, Emitter<HomeState> emit) {

  }

  setAtTheEndOfThePage() {
    emit(state.copyWith(
      atTheEndOfThePage: true,
    ));
  }

  _getListHosts(GetListHost event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(
        status: StateStatus.loading,
        isFetching: true,
      ));

      int nextPage =
          state.page ?? 0; // Use a default value if state.page is null

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
            page: nextPage,
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
      print("state.listHosts!.length");
      print(state.listHosts!.length);
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.error,
        isFetching: false,
      ));
    }
  }

  _getListEvents(GetListEvent event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(
        statusEvent: StateStatus.loading,
        isFetching: true,
      ));

      int nextPage =
          state.page ?? 0; // Use a default value if state.page is null

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
            page: nextPage,
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
      print("state.listHosts!.length");
      print(state.listHosts!.length);
    } catch (e) {
      emit(state.copyWith(
        statusEvent: StateStatus.error,
        isFetching: false,
      ));
    }
  }
}
