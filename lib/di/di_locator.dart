import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/data/data_sources/data_sources.dart';
import 'package:idwey/data/data_sources/event_api_data_source.dart';
import 'package:idwey/data/repositories_impl/activity_repository_impl.dart';
import 'package:idwey/data/repositories_impl/event_repository_impl.dart';
import 'package:idwey/data/repositories_impl/experience_repository_impl.dart';
import 'package:idwey/data/repositories_impl/host_repository_impl.dart';
import 'package:idwey/domain/repositories/activity_repository.dart';
import 'package:idwey/domain/repositories/event_repository.dart';
import 'package:idwey/domain/repositories/exeperience_repository.dart';
import 'package:idwey/domain/repositories/host_repository.dart';
import 'package:idwey/domain/usecases/get_list_activities_usecase.dart';
import 'package:idwey/domain/usecases/get_list_events_usecase.dart';
import 'package:idwey/domain/usecases/get_list_experiences_usecase.dart';
import 'package:idwey/domain/usecases/get_list_hosts.dart';
import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';
import 'package:idwey/utils/dio.dart';

Future<void> setup() async {
  // Initialize AppRouter
  final AppRouter appRouter = AppRouter();
  GetIt.I.registerLazySingleton(() => DioBuilder.createDio());
  GetIt.I.registerSingleton<AppRouter>(appRouter);
  // Data
  GetIt.I.registerLazySingleton<HostApiDataSource>(
      () => HostApiDataSourceImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<HostRepository>(
      () => HostRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListHostsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton<EventApiDataSource>(
      () => EventApiDataSourceImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListEventsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton<ActivityApiDataSource>(
      () => ActivityApiDataSourceImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<ActivityRepository>(
      () => ActivityRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListActivitiesUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton<ExperienceApiDataSource>(
      () => ExperienceApiDataSourceImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<ExperienceRepository>(
      () => ExperienceRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListExperiencesUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => HomeBloc());
}
