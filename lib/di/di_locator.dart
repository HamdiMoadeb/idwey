import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/image_banner/image_banner_bloc/image_banner_bloc.dart';
import 'package:idwey/data/data_sources/data_sources.dart';
import 'package:idwey/data/repositories_impl/activity_repository_impl.dart';
import 'package:idwey/data/repositories_impl/article_repository_impl.dart';
import 'package:idwey/data/repositories_impl/event_repository_impl.dart';
import 'package:idwey/data/repositories_impl/experience_repository_impl.dart';
import 'package:idwey/data/repositories_impl/host_repository_impl.dart';
import 'package:idwey/data/repositories_impl/product_repository_impl.dart';
import 'package:idwey/data/repositories_impl/repositories_impl.dart';
import 'package:idwey/domain/repositories/activity_repository.dart';
import 'package:idwey/domain/repositories/article_repository.dart';
import 'package:idwey/domain/repositories/event_repository.dart';
import 'package:idwey/domain/repositories/exeperience_repository.dart';
import 'package:idwey/domain/repositories/host_repository.dart';
import 'package:idwey/domain/repositories/product_repository.dart';
import 'package:idwey/domain/repositories/repositories.dart';
import 'package:idwey/domain/usecases/check_host_availability.dart';
import 'package:idwey/domain/usecases/get_activity_details_usecase.dart';
import 'package:idwey/domain/usecases/get_article_details_usecase.dart';
import 'package:idwey/domain/usecases/get_event_details_usecase.dart';
import 'package:idwey/domain/usecases/get_experience_details_dto.dart';
import 'package:idwey/domain/usecases/get_host_details_usecase.dart';
import 'package:idwey/domain/usecases/get_list_activities_usecase.dart';
import 'package:idwey/domain/usecases/get_list_articles_usecase.dart';
import 'package:idwey/domain/usecases/get_list_events_usecase.dart';
import 'package:idwey/domain/usecases/get_list_experiences_usecase.dart';
import 'package:idwey/domain/usecases/get_list_hosts.dart';
import 'package:idwey/domain/usecases/get_list_products_usecase.dart';
import 'package:idwey/domain/usecases/get_products_details_usecase.dart';
import 'package:idwey/domain/usecases/login_usecase.dart';
import 'package:idwey/domain/usecases/register_usecase.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/blocs/inspiration_page/inspiration_bloc.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:idwey/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
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
  GetIt.I.registerLazySingleton(() => GetHostUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => CheckHostAvailabilityUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton<EventApiDataSource>(
      () => EventApiDataSourceImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListEventsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetEventDetailsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton<ActivityApiDataSource>(
      () => ActivityApiDataSourceImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<ActivityRepository>(
      () => ActivityRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListActivitiesUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetActivityDetailsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton<ExperienceApiDataSource>(
      () => ExperienceApiDataSourceImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<ArticleApiDataSource>(
      () => ArticleApiDataSourceImpl(GetIt.I()));

  GetIt.I.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListArticlesUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetArticleDetailsUseCase(GetIt.I()));

  GetIt.I.registerLazySingleton<ProductApiDataSource>(
      () => ProductApiDataSourceImpl(GetIt.I()));

  GetIt.I.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListProductsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetProductDetailsUseCase(GetIt.I()));

  /// auth
  GetIt.I.registerLazySingleton<AuthApiDataSource>(
      () => AuthApiDataSourceImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => LoginUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => RegisterUseCase(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<ExperienceRepository>(
      () => ExperienceRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListExperiencesUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetExperienceDetailsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => HomeBloc());
  GetIt.I.registerLazySingleton(() => DetailsPageBloc());
  GetIt.I.registerLazySingleton(() => DetailsEventPageBloc());
  GetIt.I.registerLazySingleton(() => ImageBannerBloc());
  GetIt.I.registerLazySingleton(() => DetailsActivityPageBloc());
  GetIt.I.registerLazySingleton(() => DetailsExperiencePageBloc());
  GetIt.I.registerLazySingleton(() => InspirationBloc());
  GetIt.I.registerLazySingleton(() => ArticleDetailsBloc());
  GetIt.I.registerLazySingleton(() => ProductDetailsBloc());
  GetIt.I.registerLazySingleton(() => ProductsBloc());
  GetIt.I.registerLazySingleton(() => SignInBloc());
  GetIt.I.registerLazySingleton(() => SignUpBloc());
  GetIt.I.registerLazySingleton(() => AppBloc());
  GetIt.I.registerLazySingleton(() => ReservationBloc());
}
