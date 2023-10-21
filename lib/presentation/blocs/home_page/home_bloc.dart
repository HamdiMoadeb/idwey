import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/locations_dto.dart';
import 'package:idwey/data/models/models.dart';

import '../../../domain/usecases/get_locations_usecase.dart';
import '../../../domain/usecases/usecases.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<GetUserRole>(_getUserRole);
    on<GetListHost>(_getListHosts);
    on<GetSearchListHost>(_getListSearchHosts);
    on<GetListEvent>(_getListEvents);
    on<GetListActivities>(_getListActivities);
    on<GetListExperiences>(_getListExperiences);
    on<SetSelectedTab>(_setSelectedTab);
    on<_ChangeStartDate>(changeStartDate);
    on<_ChangeEndDate>(changeEndDate);
    on<_ChangeCity>(changeCity);
    on<_ChangeEmplacement>(changeEmplacement);
    on<_ChangeGuests>(changeGuests);
    on<_OnSetSearch>(setSearch);
    on<GetSearchListEvent>(_getListSearchEvents);
    on<GetListLocations>(getListLocations);
    on<GetSearchListActivities>(_getListSearchActivities);
    on<GetSearchListExperiences>(_getListSearchExperiences);
  }

  _getUserRole(GetUserRole event, Emitter<HomeState> emit) {}

  _getListHosts(GetListHost event, Emitter<HomeState> emit) async {
    print("state.atTheEndOfThePageHosts");
    print(state.atTheEndOfThePageHosts);
    try {
      if (state.isSearch == true) {
        emit(state.copyWith(
          listHosts: [],
          isSearch: false,
          pageHosts: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
        ));
      }
      if (state.atTheEndOfThePageHosts == true) {
        return;
      }
      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));
      int nextPage =
          state.pageHosts ?? 0; // Use a default value if state.page is null
      final Either<Exception, List<Host>?> result;

      print("******* is not sezrch");
      result = await GetIt.I<GetListHostsUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfThePageHosts: false,
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
            atTheEndOfThePageHosts: atTheEndOfThePage,
            pageHosts: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfThePageHosts:
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

  /// get list search hosts

  _getListSearchHosts(GetSearchListHost event, Emitter<HomeState> emit) async {
    print("state.atTheEndOfTheSearchPageHosts");
    print(state.atTheEndOfTheSearchPageHosts);
    print(state.isSearch);
    print(event.isFetching);
    try {
      /// if is search and is not loading more empty list hosts to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listHosts: [],
          searchPageHosts: 0,
          atTheEndOfTheSearchPageHosts: false,
        ));
      }

      if (state.atTheEndOfTheSearchPageHosts == true) {
        return;
      }

      print("state.listHosts");
      print(state.listHosts);

      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.searchPageHosts ??
          0; // Use a default value if state.page is null
      final Either<Exception, List<Host>?> result;
      print("event.isSearch");
      emit(state.copyWith(isSearch: true));
      result = await GetIt.I<SearchListHostsUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "address": state.city,
        "start": state.startDate,
        "end": state.endDate,
        "adults": state.guests,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfTheSearchPageHosts: false,
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
            atTheEndOfTheSearchPageHosts: atTheEndOfThePage,
            searchPageHosts: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfThePageHosts:
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
      if (state.atTheEndOfThePageEvents == true) {
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
          atTheEndOfThePageEvents: false,
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
            atTheEndOfThePageEvents: atTheEndOfThePage,
            pageEvents: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusEvent: StateStatus.error,
            atTheEndOfThePageEvents:
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
      if (state.atTheEndOfThePageExperiences == true) {
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
          atTheEndOfThePageExperiences: false,
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
            atTheEndOfThePageExperiences: atTheEndOfThePage,
            pageExperiences: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusExperiences: StateStatus.error,
            atTheEndOfThePageExperiences:
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
      if (state.atTheEndOfThePageActivities == true) return;

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
          atTheEndOfThePageActivities: false,
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
            atTheEndOfThePageActivities: atTheEndOfThePage,
            pageActivities: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusActivities: StateStatus.error,
            atTheEndOfThePageActivities:
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

  _setSelectedTab(SetSelectedTab event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      selectedTab: event.tab,
    ));
  }

  void changeStartDate(_ChangeStartDate event, Emitter<HomeState> emit) {
    emit(state.copyWith(startDate: event.startDate));
    print("state.startDate");
    print(state.startDate);
  }

  void changeEndDate(_ChangeEndDate event, Emitter<HomeState> emit) {
    emit(state.copyWith(endDate: event.endDate));
    print("state.endDate");
    print(state.endDate);
  }

  void changeCity(_ChangeCity event, Emitter<HomeState> emit) {
    emit(state.copyWith(city: event.city));
    print("state.city");
    print(state.city);
  }

  void changeEmplacement(_ChangeEmplacement event, Emitter<HomeState> emit) {
    emit(state.copyWith(emplacement: event.city));
    print("state.location");
    print(state.emplacement);
  }

  void changeGuests(_ChangeGuests event, Emitter<HomeState> emit) {
    emit(state.copyWith(guests: event.guests));
  }

  void setSearch(_OnSetSearch event, Emitter<HomeState> emit) {
    emit(state.copyWith(isSearch: event.search));
  }

  /// get list search events

  _getListSearchEvents(
      GetSearchListEvent event, Emitter<HomeState> emit) async {
    print("state.atTheEndOfThePageEvents");
    print(state.atTheEndOfTheSearchPageEvents);
    print(state.isSearch);
    print(event.isFetching);
    try {
      /// if is search and is not loading more empty list hosts to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listEvents: [],
          pageSearchEvents: 0,
          atTheEndOfTheSearchPageEvents: false,
        ));
      }

      if (state.atTheEndOfTheSearchPageEvents == true) {
        return;
      }

      print("state.listEvents");
      print(state.listEvents);

      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.pageSearchEvents ??
          0; // Use a default value if state.page is null
      final Either<Exception, List<Event>?> result;
      print("event.isSearch");
      emit(state.copyWith(isSearch: true));
      result = await GetIt.I<SearchListEventsUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "address": state.city,
        "start": state.startDate,
        "end": state.endDate,
        "adults": state.guests,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfTheSearchPageEvents: false,
          isFetching: false,
        ));
      }, (List<Event>? success) async {
        if (success != null && success.isNotEmpty) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success.length < 10;

          emit(state.copyWith(
            status: StateStatus.success,
            listEvents: state.listEvents! + success,
            isFetching: false,
            atTheEndOfTheSearchPageEvents: atTheEndOfThePage,
            pageSearchEvents: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfTheSearchPageEvents:
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

  ///get list search activities

  _getListSearchActivities(
      GetSearchListActivities event, Emitter<HomeState> emit) async {
    print("state.atTheEndOfThePageActivities");
    print(state.atTheEndOfTheSearchPageActivities);
    print(state.isSearch);
    print(event.isFetching);
    try {
      /// if is search and is not loading more empty list hosts to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listActivities: [],
          pageSearchActivities: 0,
          atTheEndOfTheSearchPageActivities: false,
        ));
      }

      if (state.atTheEndOfTheSearchPageActivities == true) {
        return;
      }

      print("state.listActivities");
      print(state.listActivities);

      emit(state.copyWith(
        statusActivities:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.pageSearchActivities ??
          0; // Use a default value if state.page is null
      final Either<Exception, List<Activity>?> result;
      print("event.isSearch");
      emit(state.copyWith(isSearch: true));
      result = await GetIt.I<SearchListActivityUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "address": state.city,
        "start": state.startDate,
        "end": state.endDate,
        "adults": state.guests,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          statusActivities: StateStatus.error,
          atTheEndOfTheSearchPageActivities: false,
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
            atTheEndOfTheSearchPageActivities: atTheEndOfThePage,
            pageSearchActivities: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusActivities: StateStatus.error,
            atTheEndOfTheSearchPageActivities:
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

  /// get list search experiences

  _getListSearchExperiences(
      GetSearchListExperiences event, Emitter<HomeState> emit) async {
    print("state.atTheEndOfTheSearchPageExperiences");
    print(state.atTheEndOfTheSearchPageExperiences);
    print(state.isSearch);
    print(event.isFetching);
    try {
      /// if is search and is not loading more empty list hosts to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listExperiences: [],
          pageSearchExperiences: 0,
          atTheEndOfTheSearchPageExperiences: false,
        ));
      }

      if (state.atTheEndOfTheSearchPageExperiences == true) {
        return;
      }

      print("state.listExperiences");
      print(state.listExperiences);

      emit(state.copyWith(
        statusExperiences:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.pageSearchExperiences ??
          0; // Use a default value if state.page is null
      final Either<Exception, List<Experience>?> result;
      print("event.isSearch");
      emit(state.copyWith(isSearch: true));
      result = await GetIt.I<SearchListExperienceUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "address": state.city,
        "start": state.startDate,
        "end": state.endDate,
        "adults": state.guests,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          statusExperiences: StateStatus.error,
          atTheEndOfTheSearchPageExperiences: false,
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
            atTheEndOfTheSearchPageExperiences: atTheEndOfThePage,
            pageSearchExperiences: nextPage,
          ));
        } else {
          emit(state.copyWith(
            statusExperiences: StateStatus.error,
            atTheEndOfTheSearchPageExperiences:
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

  getListLocations(GetListLocations event, Emitter<HomeState> emit) async {
    try {
      final Either<Exception, List<LocationsDto>?> result =
          await GetIt.I<GetLocationsUseCase>().call({});

      result.fold((Exception failure) {}, (List<LocationsDto>? success) async {
        if (success != null && success.isNotEmpty) {
          List<String> list = [];
          for (var element in success) {
            list.add(element.name ?? "");
          }
          emit(state.copyWith(
            listLocations: success,
            emplacementList: list,
          ));
        } else {}
      });
    } catch (e) {
      print(e);
    }
  }
}
