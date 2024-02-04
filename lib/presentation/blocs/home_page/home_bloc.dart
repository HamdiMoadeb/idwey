import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/activity_category.dart';
import 'package:idwey/data/models/activity_page_dto.dart';
import 'package:idwey/data/models/attributz.dart';
import 'package:idwey/data/models/event_page_dto.dart';
import 'package:idwey/data/models/experience_page_dto.dart';
import 'package:idwey/data/models/host_page_dto.dart';
import 'package:idwey/data/models/locations_dto.dart';
import 'package:idwey/data/models/models.dart';
import 'package:idwey/domain/usecases/get_activity_page_usecase.dart';
import 'package:idwey/domain/usecases/get_event_page_usecase.dart';
import 'package:idwey/domain/usecases/get_experience_page_usecase.dart';
import 'package:idwey/domain/usecases/get_host_page_usecase.dart';

import '../../../domain/usecases/get_locations_usecase.dart';
import '../../../domain/usecases/usecases.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

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
    on<GetEventPageData>(_getEventPageData);
    on<GetHostPageData>(_getHostPageData);
    on<GetExperiencePageData>(_getExperiencePageData);
    on<GetActivityPageData>(_getActivityPageData);
    on<SetSelectedActivityCategory>(setSelectedIdsActivity);
    on<SetSelectedAttributesId>(setSelectedIds);
    on<SetRangePrices>(setPriceRanges);
    on<GetFilterListHostsPageData>(_getListFilterHosts);
    on<GetFilterListEventsPageData>(_getListFilterEvents);
    on<GetFilterListActivitiesPageData>(_getListFilterActivities);
    on<GetFilterListExperiencesPageData>(_getListFilterExperiences);
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
      if (state.isFilter == true) {
        emit(state.copyWith(
          listHosts: [],
          isFilter: false,
          pageHosts: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
          selectedAttributesId: [],
          selectedActivityCategoriesId: [],
          selectedPriceRanges: [
            state.minPriceRange ?? "0",
            state.maxPriceRange ?? "1000"
          ],
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
            listAttributes: state.listAttributes,
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
    print("state.isFilter111111");
    print(state.isFilter);

    try {
      if (state.isSearch == true) {
        emit(state.copyWith(
          listEvents: [],
          isSearch: false,
          pageEvents: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
        ));
      }
      if (state.isFilter == true) {
        emit(state.copyWith(
          listEvents: [],
          isFilter: false,
          pageEvents: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
          selectedAttributesId: [],
          selectedActivityCategoriesId: [],
          selectedPriceRanges: [
            state.minPriceRange ?? "0",
            state.maxPriceRange ?? "1000"
          ],
        ));
      }
      if (state.atTheEndOfThePageEvents == true) {
        print("state.atTheEndOfThePageEvents");
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

          print("success");
          print(success.length);

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

  _getEventPageData(GetEventPageData event, Emitter<HomeState> emit) async {
    try {
      final Either<Exception, EventPageDto?> result =
          await GetIt.I<GetEventPageUseCase>().call({
        "limit": 10,
        "offset": 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          statusEvent: StateStatus.error,
        ));
      }, (EventPageDto? success) async {
        emit(state.copyWith(
          statusEvent: StateStatus.success,
          eventPageDto: success,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        statusEvent: StateStatus.error,
      ));
    }
  }

  /// get host page data
  _getHostPageData(GetHostPageData event, Emitter<HomeState> emit) async {
    try {
// Use a default value if state.page is null
      emit(state.copyWith());

      final Either<Exception, HostPageDto?> result =
          await GetIt.I<GetHostPageUseCase>().call({
        "limit": 10,
        "offset": 10,
      });

      result.fold((Exception failure) {}, (HostPageDto? success) async {
        print("success");
        print(success?.hotelMinMaxPrice);
        emit(state.copyWith(
          hostPageDto: success,
          listAttributes: success?.attributes,
          minPriceRange: success?.hotelMinMaxPrice?[0],
          maxPriceRange: success?.hotelMinMaxPrice?[1],
        ));
        print("minPriceRange ${state.minPriceRange}");
        print("maxPriceRange ${state.maxPriceRange}");
      });
    } catch (e) {
      emit(state.copyWith());
    }
  }

  /// get activity page data
  _getActivityPageData(
      GetActivityPageData event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(
        status: StateStatus.loading,
      ));

      final Either<Exception, ActivityPageDto?> result =
          await GetIt.I<GetActivityPageUseCase>().call({
        "limit": 10,
        "offset": 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }, (ActivityPageDto? success) async {
        emit(state.copyWith(
          status: StateStatus.success,
          activityPageDto: success,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        statusEvent: StateStatus.error,
      ));
    }
  }

  /// get experience page data

  _getExperiencePageData(
      GetExperiencePageData event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(
        status: StateStatus.loading,
      ));

      final Either<Exception, ExperiencePageDto?> result =
          await GetIt.I<GetExperiencePageUseCase>().call({
        "limit": 10,
        "offset": 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }, (ExperiencePageDto? success) async {
        emit(state.copyWith(
          status: StateStatus.success,
          experiencePageDto: success,
        ));
      });
    } catch (e) {
      emit(state.copyWith(
        statusEvent: StateStatus.error,
      ));
    }
  }

  _getListExperiences(GetListExperiences event, Emitter<HomeState> emit) async {
    try {
      if (state.isSearch == true) {
        emit(state.copyWith(
          listExperiences: [],
          isSearch: false,
          pageExperiences: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
        ));
      }
      if (state.isFilter == true) {
        emit(state.copyWith(
          listExperiences: [],
          isFilter: false,
          pageExperiences: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
          selectedAttributesId: [],
          selectedActivityCategoriesId: [],
          selectedPriceRanges: [
            state.minPriceRange ?? "0",
            state.maxPriceRange ?? "1000"
          ],
        ));
      }
      if (state.atTheEndOfThePageExperiences == true) {
        print("atTheEndOfThePageExperiences");
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
        if (success != null) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success!.length < 10;
          print("success");
          print(success.length);

          emit(state.copyWith(
            statusExperiences: StateStatus.success,
            listExperiences: state.listExperiences! + success!,
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
      if (state.isSearch == true) {
        emit(state.copyWith(
          listActivities: [],
          isSearch: false,
          pageActivities: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
        ));
      }
      if (state.isFilter == true) {
        emit(state.copyWith(
          listActivities: [],
          isFilter: false,
          pageActivities: 0,
          startDate: "",
          endDate: "",
          city: "",
          guests: 0,
          selectedAttributesId: [],
          selectedActivityCategoriesId: [],
          selectedPriceRanges: [
            state.minPriceRange ?? "0",
            state.maxPriceRange ?? "1000"
          ],
        ));
      }
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
    /// switch selected tab => min max range
    print(event.tab);
    switch (event.tab) {
      case 0:
        emit(state.copyWith(
          selectedTab: event.tab,
          minPriceRange: state.hostPageDto?.hotelMinMaxPrice![0],
          maxPriceRange: state.hostPageDto?.hotelMinMaxPrice![1],
          listAttributes: state.hostPageDto?.attributes,
        ));
        break;
      case 1:
        emit(state.copyWith(
          selectedTab: event.tab,
          minPriceRange: state.eventPageDto!.eventMinMaxPrice![0],
          maxPriceRange: state.eventPageDto!.eventMinMaxPrice![1],
          listAttributes: state.eventPageDto?.attributes,
        ));
        break;
      case 2:
        emit(state.copyWith(
          selectedTab: event.tab,
          minPriceRange: state.activityPageDto!.activityMinMaxPrice![0],
          maxPriceRange: state.activityPageDto!.activityMinMaxPrice![1],
          listAttributes: state.activityPageDto?.attributes,
          listActivityCategories: state.activityPageDto?.activityCategory,
        ));
        break;
      case 3:
        emit(state.copyWith(
          selectedTab: event.tab,
          minPriceRange: state.experiencePageDto?.activityMinMaxPrice![0],
          maxPriceRange: state.experiencePageDto?.activityMinMaxPrice![1],
          listAttributes: state.experiencePageDto?.attributes,
        ));
        break;
    }

    print("state.selectedTab");
    print(state.selectedTab);
    print("state.minPriceRange");
    print(state.minPriceRange);
    print("state.maxPriceRange");
    print(state.maxPriceRange);
    print("state.listAttributes");
    print(state.listAttributes![0].toJson());
    print("state.listActivityCategories");
    print(state.listActivityCategories![0].toJson());
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

  /// set selected ids
  setSelectedIds(SetSelectedAttributesId event, Emitter<HomeState> emit) async {
    List<String> selectedIds = List.from(state.selectedAttributesId ?? []);
    if (selectedIds.contains(event.attributesId)) {
      selectedIds.remove(event.attributesId);
    } else {
      selectedIds.add(event.attributesId);
    }
    emit(state.copyWith(
      selectedAttributesId: selectedIds ?? [],
    ));
    print("state.selectedAttributesId");
    print(state.selectedAttributesId);
  }

  /// set selected ids
  setSelectedIdsActivity(
      SetSelectedActivityCategory event, Emitter<HomeState> emit) async {
    List<String> selectedIds =
        List.from(state.selectedActivityCategoriesId ?? []);
    if (selectedIds.contains(event.id)) {
      selectedIds.remove(event.id);
    } else {
      selectedIds.add(event.id);
    }
    emit(state.copyWith(
      selectedActivityCategoriesId: selectedIds ?? [],
    ));
  }

  /// set price ranges
  setPriceRanges(SetRangePrices event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      selectedPriceRanges: event.str,
    ));
    print("event.str");
    print(state.selectedPriceRanges);
  }

  /// filter list hosts by selected ids
  _getListFilterHosts(
      GetFilterListHostsPageData event, Emitter<HomeState> emit) async {
    try {
      /// if is search and is not loading more empty list hosts to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listHosts: [],
          filterPageHosts: 0,
          atTheEndOfTheFilterPageHosts: false,
        ));
      }

      if (state.atTheEndOfTheFilterPageHosts == true) {
        return;
      }

      print("state.listHosts");
      print(state.listHosts);

      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.filterPageHosts ??
          0; // Use a default value if state.page is null
      final Either<Exception, List<Host>?> result;
      print("event.isFilter");
      emit(state.copyWith(isFilter: true));
      result = await GetIt.I<FilterListHostsUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "price_range": getSelectedPriceRanges(state.selectedPriceRanges ?? []),
        "terms": getSelectedIds(state.selectedAttributesId ?? []),
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfTheFilterPageHosts: false,
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
            atTheEndOfTheFilterPageHosts: atTheEndOfThePage,
            filterPageHosts: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfTheFilterPageHosts:
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

  /// filter list events by selected ids

  _getListFilterEvents(
      GetFilterListEventsPageData event, Emitter<HomeState> emit) async {
    print("event.isFiiilter");
    print(state.atTheEndOfTheFilterPageEvents);
    print(state.isFilter);
    print(event.isFetching);
    try {
      /// if is search and is not loading more empty list events to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listEvents: [],
          pageFilterEvents: 0,
          atTheEndOfTheFilterPageEvents: false,
        ));
      }

      if (state.atTheEndOfTheFilterPageEvents == true) {
        return;
      }

      print("state.listEvents");
      print(state.listEvents);

      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.pageFilterEvents ??
          0; // Use a default value if state.page is null
      emit(state.copyWith(isFilter: true));

      final Either<Exception, List<Event>?> result;
      print("event.isSearch");
      emit(state.copyWith(isSearch: true));
      result = await GetIt.I<FilterListEventsUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "price_range": getSelectedPriceRanges(state.selectedPriceRanges ?? []),
        "terms": getSelectedIds(state.selectedAttributesId ?? []),
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfTheFilterPageEvents: false,
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
            atTheEndOfTheFilterPageEvents: atTheEndOfThePage,
            pageFilterEvents: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfTheFilterPageEvents:
                true, // Mark atTheEndOfThePage as true when
            // there is no more data

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

  /// filter list activities by selected ids

  _getListFilterActivities(
      GetFilterListActivitiesPageData event, Emitter<HomeState> emit) async {
    print(state.atTheEndOfTheFilterPageActivities);
    print(state.isFilter);
    print(event.isFetching);
    try {
      /// if is search and is not loading more empty list activities to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listActivities: [],
          pageFilterActivities: 0,
          atTheEndOfTheFilterPageActivities: false,
        ));
      }

      if (state.atTheEndOfTheFilterPageActivities == true) {
        return;
      }

      print("state.listActivities");
      print(state.listActivities);

      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage = state.pageFilterActivities ??
          0; // Use a default value if state.page is null
      emit(state.copyWith(isFilter: true));

      final Either<Exception, List<Activity>?> result;
      print("event.isSearch");
      emit(state.copyWith(isSearch: true));
      result = await GetIt.I<FilterListActivitiesUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "price_range": getSelectedPriceRanges(state.selectedPriceRanges ?? []),
        "terms": getSelectedIds(state.selectedAttributesId ?? []),
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
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
            status: StateStatus.success,
            listActivities: state.listActivities! + success,
            isFetching: false,
            atTheEndOfTheFilterPageActivities: atTheEndOfThePage,
            pageFilterActivities: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfTheFilterPageActivities:
                true, // Mark atTheEndOfThePage as true when
            // there is no more data

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

  /// filter experiences by selected ids

  _getListFilterExperiences(
      GetFilterListExperiencesPageData event, Emitter<HomeState> emit) async {
    print(state.atTheEndOfTheFilterPageExperiences);
    print(state.isFilter);
    print(event.isFetching);
    try {
      /// if is search and is not loading more empty list experiences to load new data
      if (event.isFetching == false) {
        emit(state.copyWith(
          listExperiences: [],
          pageFilterExperiences: 0,
          atTheEndOfThePageExperiences: false,
          atTheEndOfTheFilterPageExperiences: false,
        ));
      }

      if (state.atTheEndOfTheFilterPageExperiences == true) {
        return;
      }

      print("state.listExperiences");
      print(state.listExperiences);

      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));
      int nextPage = state.pageFilterExperiences ??
          0; // Use a default value if state.page is null
      emit(state.copyWith(isFilter: true));
      final Either<Exception, List<Experience>?> result;
      print("event.isSearch");
      emit(state.copyWith(isSearch: true));
      result = await GetIt.I<FilterListExperiencesUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
        "price_range": getSelectedPriceRanges(state.selectedPriceRanges ?? []),
        "terms": getSelectedIds(state.selectedAttributesId ?? []),
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfTheFilterPageExperiences: false,
          isFetching: false,
        ));
      }, (List<Experience>? success) async {
        if (success != null && success.isNotEmpty) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success.length < 10;

          emit(state.copyWith(
            status: StateStatus.success,
            listExperiences: state.listExperiences! + success,
            isFetching: false,
            atTheEndOfTheFilterPageExperiences: atTheEndOfThePage,
            pageFilterExperiences: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfTheFilterPageExperiences: true, // Mark atThe
            // there is no more data

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

  String getSelectedPriceRanges(List<String> stringsList) {
    String concatenatedString = "";
    if (state.selectedPriceRanges != null) {
      concatenatedString = stringsList.join(';');
    }
    print("concatenatedString");
    print(concatenatedString);
    return concatenatedString;
  }

  String getSelectedIds(List<String> stringsList) {
    String concatenatedString = "";
    if (state.selectedPriceRanges != null) {
      concatenatedString = stringsList.join(',');
    }
    return concatenatedString;
  }
}
