import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/image_banner/image_banner_bloc/image_banner_bloc.dart';
import 'package:idwey/data/data_sources/data_sources.dart';
import 'package:idwey/data/data_sources/fidelity_program_api_data_source.dart';
import 'package:idwey/data/data_sources/filter_api_data_source.dart';
import 'package:idwey/data/data_sources/location_api_data_source.dart';
import 'package:idwey/data/data_sources/reservation_data_source.dart';
import 'package:idwey/data/data_sources/reviews_api_data_source.dart';
import 'package:idwey/data/repositories_impl/experience_repository_impl.dart';
import 'package:idwey/data/repositories_impl/fidelity_program_repository_impl.dart';
import 'package:idwey/data/repositories_impl/filter_repository_impl.dart';
import 'package:idwey/data/repositories_impl/product_repository_impl.dart';
import 'package:idwey/data/repositories_impl/repositories_impl.dart';
import 'package:idwey/data/repositories_impl/reviews_repository_impl.dart';
import 'package:idwey/domain/repositories/fidleity_program_repository.dart';
import 'package:idwey/domain/repositories/filter_repository.dart';
import 'package:idwey/domain/repositories/location_repository.dart';
import 'package:idwey/domain/repositories/product_repository.dart';
import 'package:idwey/domain/repositories/repositories.dart';
import 'package:idwey/domain/repositories/review_repository.dart';
import 'package:idwey/domain/usecases/add_review_usecase.dart';
import 'package:idwey/domain/usecases/do_online_checkout_usecase.dart';
import 'package:idwey/domain/usecases/get_activity_page_usecase.dart';
import 'package:idwey/domain/usecases/get_dashboard_reviews.dart';
import 'package:idwey/domain/usecases/get_event_page_usecase.dart';
import 'package:idwey/domain/usecases/get_experience_page_usecase.dart';
import 'package:idwey/domain/usecases/get_host_page_usecase.dart';
import 'package:idwey/domain/usecases/get_list_products_usecase.dart';
import 'package:idwey/domain/usecases/get_locations_usecase.dart';
import 'package:idwey/domain/usecases/get_monthly_points_usecase.dart';
import 'package:idwey/domain/usecases/get_products_details_usecase.dart';
import 'package:idwey/domain/usecases/get_rate_settings_usecase.dart';
import 'package:idwey/domain/usecases/get_total_points_usecase.dart';
import 'package:idwey/domain/usecases/register_usecase.dart';
import 'package:idwey/domain/usecases/update_review_usecase.dart';
import 'package:idwey/domain/usecases/upload_image_usecase.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/blocs/booking_page_bloc/booking_page_bloc.dart';
import 'package:idwey/presentation/blocs/confirm_reservation_bloc/confirm_reservation_bloc.dart';
import 'package:idwey/presentation/blocs/inspiration_page/inspiration_bloc.dart';
import 'package:idwey/presentation/blocs/reservation_bloc/reservation_bloc.dart';
import 'package:idwey/presentation/blocs/reviews_board_bloc/reviews_dashboard_bloc.dart';
import 'package:idwey/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:idwey/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:idwey/utils/dio.dart';

import '../data/repositories_impl/location_repository_impl.dart';
import '../domain/usecases/usecases.dart';
import '../presentation/blocs/add_review_bloc/add_review_bloc.dart';

Future<void> setup() async {
  // Initialize AppRouter
  final AppRouter appRouter = AppRouter();
  GetIt.I.registerLazySingleton(() => DioBuilder.createDio());
  GetIt.I.registerSingleton<AppRouter>(appRouter);
  // Data
  GetIt.I.registerLazySingleton<HostApiDataSource>(
      () => HostApiDataSourceImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<FidelityProgramApiDataSource>(
      () => FidelityProgramApiDataSourceImpl(GetIt.I()));

  GetIt.I.registerLazySingleton<FidelityProgramRepository>(
      () => FidelityProgramRepositoryImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<HostRepository>(
      () => HostRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListHostsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetHostUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => CheckHostAvailabilityUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => ConfirmReservationUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => SearchListHostsUseCase(GetIt.I()));
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
  GetIt.I.registerLazySingleton(() => SearchListEventsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => SearchListActivityUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => SearchListExperienceUseCase(GetIt.I()));

  /// filter usecases
  GetIt.I.registerLazySingleton<FilterApiDataSource>(
      () => FilterApiDataSourceImpl(GetIt.I()));
  // Domain
  GetIt.I.registerLazySingleton<FilterRepository>(
      () => FilterRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => FilterListHostsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => FilterListEventsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => FilterListActivitiesUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => FilterListExperiencesUseCase(GetIt.I()));

  GetIt.I.registerLazySingleton<ProductApiDataSource>(
      () => ProductApiDataSourceImpl(GetIt.I()));

  GetIt.I.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetListProductsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetProductDetailsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetMonthlyPointsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetTotalPointsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetEventPageUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetExperiencePageUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetActivityPageUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetHostPageUseCase(GetIt.I()));

  /// locations

  GetIt.I.registerLazySingleton<LocationApiDataSource>(
      () => LocationApiDataSourceImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<LocationRepository>(
      () => LocationRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetLocationsUseCase(GetIt.I()));

  /// auth
  GetIt.I.registerLazySingleton<AuthApiDataSource>(
      () => AuthApiDataSourceImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => LoginUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => RegisterUseCase(GetIt.I()));

  GetIt.I.registerLazySingleton<ReservationApiDataSource>(
      () => ReservationApiDataSourceImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl(GetIt.I()));

  GetIt.I.registerLazySingleton<ReviewsApiDataSource>(
      () => ReviewsApiDataSourceImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<ReviewRepository>(
      () => ReviewRepositoryImpl(GetIt.I()));
  GetIt.I.registerLazySingleton(() => DoCheckoutUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetBookingListUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => UpdateUserUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => UploadImageUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetRateSettingsUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => AddReviewUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => UpdateReviewUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => DoOnlineCheckoutUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => DeleteUserUseCase(GetIt.I()));
  GetIt.I.registerLazySingleton(() => GetDashboardReviews(GetIt.I()));
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
  GetIt.I.registerLazySingleton(() => ConfirmReservationBloc());
  GetIt.I.registerLazySingleton(() => BookingPageBloc());
  GetIt.I.registerLazySingleton(() => ReviewsDashboardBloc());
}
