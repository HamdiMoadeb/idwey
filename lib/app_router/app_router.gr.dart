// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element

  @override
  final Map<String, PageFactory> pagesMap = {
    ActivityDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ActivityDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActivityDetailsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AddReviewRoute.name: (routeData) {
      final args = routeData.argsAs<AddReviewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: AddReviewScreen(
          key: args.key,
          id: args.id,
          type: args.type,
          review: args.review,
        )),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ArticleDetailsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AssuranceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AssuranceScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthScreen(),
      );
    },
    BookingBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookingBoardScreen(),
      );
    },
    ConfigurationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ConfigurationScreen(),
      );
    },
    ConfirmReservationRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmReservationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: ConfirmReservationScreen(
          key: args.key,
          id: args.id,
          address: args.address,
          hostName: args.hostName,
          region: args.region,
          dateDebut: args.dateDebut,
          dateFin: args.dateFin,
          nuits: args.nuits,
          adultes: args.adultes,
          total: args.total,
          rooms: args.rooms,
          typeReservation: args.typeReservation,
          currencyValue: args.currencyValue,
          currencyName: args.currencyName,
          currency: args.currency,
          activityDuration: args.activityDuration,
          url: args.url,
          code: args.code,
          customerId: args.customerId,
          price: args.price,
          totalOnSale: args.totalOnSale,
        )),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    DetailsProductRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsProductScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    DetailsReservationRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsReservationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsReservationScreen(
          key: args.key,
          bookingDto: args.bookingDto,
        ),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsScreen(
          key: args.key,
          id: args.id,
          typeHost: args.typeHost,
        ),
      );
    },
    EventDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<EventDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EventDetailsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ExperienceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ExperienceDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExperienceDetailsScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    FidelityProgramRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const FidelityProgramScreen()),
      );
    },
    FilterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FilterScreen(),
      );
    },
    HelpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HelpScreen(),
      );
    },
    HowItWorksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HowItWorksScreen(),
      );
    },
    InAppWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<InAppWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InAppWebViewScreen(
          key: args.key,
          url: args.url,
          state: args.state,
        ),
      );
    },
    InspirationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InspirationScreen(),
      );
    },
    MainHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainHomeScreen(),
      );
    },
    ProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductsScreen(),
      );
    },
    RequiredReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<RequiredReviewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RequiredReviewsScreen(
          key: args.key,
          type: args.type,
          notreviewed: args.notreviewed,
        ),
      );
    },
    ReviewsBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReviewsBoardScreen(),
      );
    },
    ReviewsRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ReviewsScreen(
          key: args.key,
          reviewsList: args.reviewsList,
          averageRating: args.averageRating,
          reviewsNumber: args.reviewsNumber,
          listScale: args.listScale,
          id: args.id,
          type: args.type,
          canReview: args.canReview,
        ),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchScreen(
          key: args.key,
          selectedTab: args.selectedTab,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignInScreen(),
      );
    },
    SignUpFinalRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpFinalScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    TermsAndConditionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TermsAndConditionsScreen(),
      );
    },
    TermsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TermsScreen(),
      );
    },
    VerifyDisponibilityRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyDisponibilityRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: VerifyDisponibilityScreen(
          key: args.key,
          typeReservation: args.typeReservation,
          activityDuration: args.activityDuration,
          id: args.id,
          title: args.title,
          address: args.address,
          typeHost: args.typeHost,
          salePrice: args.salePrice,
          perPerson: args.perPerson,
          minNuits: args.minNuits,
          price: args.price,
          url: args.url,
          extraPrice: args.extraPrice,
          rooms: args.rooms,
          startDate: args.startDate,
          endDate: args.endDate,
          subtitle: args.subtitle,
        )),
      );
    },
  };
}

/// generated route for
/// [ActivityDetailsScreen]
class ActivityDetailsRoute extends PageRouteInfo<ActivityDetailsRouteArgs> {
  ActivityDetailsRoute({
    Key? key,
    required int? id,
    List<PageRouteInfo>? children,
  }) : super(
          ActivityDetailsRoute.name,
          args: ActivityDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ActivityDetailsRoute';

  static const PageInfo<ActivityDetailsRouteArgs> page =
      PageInfo<ActivityDetailsRouteArgs>(name);
}

class ActivityDetailsRouteArgs {
  const ActivityDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'ActivityDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [AddReviewScreen]
class AddReviewRoute extends PageRouteInfo<AddReviewRouteArgs> {
  AddReviewRoute({
    Key? key,
    required String id,
    required String type,
    Review? review,
    List<PageRouteInfo>? children,
  }) : super(
          AddReviewRoute.name,
          args: AddReviewRouteArgs(
            key: key,
            id: id,
            type: type,
            review: review,
          ),
          initialChildren: children,
        );

  static const String name = 'AddReviewRoute';

  static const PageInfo<AddReviewRouteArgs> page =
      PageInfo<AddReviewRouteArgs>(name);
}

class AddReviewRouteArgs {
  const AddReviewRouteArgs({
    this.key,
    required this.id,
    required this.type,
    this.review,
  });

  final Key? key;

  final String id;

  final String type;

  final Review? review;

  @override
  String toString() {
    return 'AddReviewRouteArgs{key: $key, id: $id, type: $type, review: $review}';
  }
}

/// generated route for
/// [ArticleDetailsScreen]
class ArticleDetailsRoute extends PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    Key? key,
    required int? id,
    List<PageRouteInfo>? children,
  }) : super(
          ArticleDetailsRoute.name,
          args: ArticleDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ArticleDetailsRoute';

  static const PageInfo<ArticleDetailsRouteArgs> page =
      PageInfo<ArticleDetailsRouteArgs>(name);
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [AssuranceScreen]
class AssuranceRoute extends PageRouteInfo<void> {
  const AssuranceRoute({List<PageRouteInfo>? children})
      : super(
          AssuranceRoute.name,
          initialChildren: children,
        );

  static const String name = 'AssuranceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookingBoardScreen]
class BookingBoardRoute extends PageRouteInfo<void> {
  const BookingBoardRoute({List<PageRouteInfo>? children})
      : super(
          BookingBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfigurationScreen]
class ConfigurationRoute extends PageRouteInfo<void> {
  const ConfigurationRoute({List<PageRouteInfo>? children})
      : super(
          ConfigurationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfigurationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConfirmReservationScreen]
class ConfirmReservationRoute
    extends PageRouteInfo<ConfirmReservationRouteArgs> {
  ConfirmReservationRoute({
    Key? key,
    String? id,
    String? address,
    String? hostName,
    String? region,
    String? dateDebut,
    String? dateFin,
    String? nuits,
    String? adultes,
    String? total,
    List<Room>? rooms,
    TypeReservation? typeReservation,
    int? currencyValue,
    String? currencyName,
    String? currency,
    String? activityDuration,
    String? url,
    required String code,
    required String customerId,
    String? price,
    String? totalOnSale,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmReservationRoute.name,
          args: ConfirmReservationRouteArgs(
            key: key,
            id: id,
            address: address,
            hostName: hostName,
            region: region,
            dateDebut: dateDebut,
            dateFin: dateFin,
            nuits: nuits,
            adultes: adultes,
            total: total,
            rooms: rooms,
            typeReservation: typeReservation,
            currencyValue: currencyValue,
            currencyName: currencyName,
            currency: currency,
            activityDuration: activityDuration,
            url: url,
            code: code,
            customerId: customerId,
            price: price,
            totalOnSale: totalOnSale,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmReservationRoute';

  static const PageInfo<ConfirmReservationRouteArgs> page =
      PageInfo<ConfirmReservationRouteArgs>(name);
}

class ConfirmReservationRouteArgs {
  const ConfirmReservationRouteArgs({
    this.key,
    this.id,
    this.address,
    this.hostName,
    this.region,
    this.dateDebut,
    this.dateFin,
    this.nuits,
    this.adultes,
    this.total,
    this.rooms,
    this.typeReservation,
    this.currencyValue,
    this.currencyName,
    this.currency,
    this.activityDuration,
    this.url,
    required this.code,
    required this.customerId,
    this.price,
    this.totalOnSale,
  });

  final Key? key;

  final String? id;

  final String? address;

  final String? hostName;

  final String? region;

  final String? dateDebut;

  final String? dateFin;

  final String? nuits;

  final String? adultes;

  final String? total;

  final List<Room>? rooms;

  final TypeReservation? typeReservation;

  final int? currencyValue;

  final String? currencyName;

  final String? currency;

  final String? activityDuration;

  final String? url;

  final String code;

  final String customerId;

  final String? price;

  final String? totalOnSale;

  @override
  String toString() {
    return 'ConfirmReservationRouteArgs{key: $key, id: $id, address: $address, hostName: $hostName, region: $region, dateDebut: $dateDebut, dateFin: $dateFin, nuits: $nuits, adultes: $adultes, total: $total, rooms: $rooms, typeReservation: $typeReservation, currencyValue: $currencyValue, currencyName: $currencyName, currency: $currency, activityDuration: $activityDuration, url: $url, code: $code, customerId: $customerId, price: $price, totalOnSale: $totalOnSale}';
  }
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetailsProductScreen]
class DetailsProductRoute extends PageRouteInfo<DetailsProductRouteArgs> {
  DetailsProductRoute({
    Key? key,
    required int? id,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsProductRoute.name,
          args: DetailsProductRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsProductRoute';

  static const PageInfo<DetailsProductRouteArgs> page =
      PageInfo<DetailsProductRouteArgs>(name);
}

class DetailsProductRouteArgs {
  const DetailsProductRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'DetailsProductRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [DetailsReservationScreen]
class DetailsReservationRoute
    extends PageRouteInfo<DetailsReservationRouteArgs> {
  DetailsReservationRoute({
    Key? key,
    required BookingDto? bookingDto,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsReservationRoute.name,
          args: DetailsReservationRouteArgs(
            key: key,
            bookingDto: bookingDto,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsReservationRoute';

  static const PageInfo<DetailsReservationRouteArgs> page =
      PageInfo<DetailsReservationRouteArgs>(name);
}

class DetailsReservationRouteArgs {
  const DetailsReservationRouteArgs({
    this.key,
    required this.bookingDto,
  });

  final Key? key;

  final BookingDto? bookingDto;

  @override
  String toString() {
    return 'DetailsReservationRouteArgs{key: $key, bookingDto: $bookingDto}';
  }
}

/// generated route for
/// [DetailsScreen]
class DetailsRoute extends PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    Key? key,
    required int? id,
    required String? typeHost,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            id: id,
            typeHost: typeHost,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const PageInfo<DetailsRouteArgs> page =
      PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.id,
    required this.typeHost,
  });

  final Key? key;

  final int? id;

  final String? typeHost;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, id: $id, typeHost: $typeHost}';
  }
}

/// generated route for
/// [EventDetailsScreen]
class EventDetailsRoute extends PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    Key? key,
    required int? id,
    List<PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static const PageInfo<EventDetailsRouteArgs> page =
      PageInfo<EventDetailsRouteArgs>(name);
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [ExperienceDetailsScreen]
class ExperienceDetailsRoute extends PageRouteInfo<ExperienceDetailsRouteArgs> {
  ExperienceDetailsRoute({
    Key? key,
    required int? id,
    List<PageRouteInfo>? children,
  }) : super(
          ExperienceDetailsRoute.name,
          args: ExperienceDetailsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'ExperienceDetailsRoute';

  static const PageInfo<ExperienceDetailsRouteArgs> page =
      PageInfo<ExperienceDetailsRouteArgs>(name);
}

class ExperienceDetailsRouteArgs {
  const ExperienceDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'ExperienceDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [FidelityProgramScreen]
class FidelityProgramRoute extends PageRouteInfo<void> {
  const FidelityProgramRoute({List<PageRouteInfo>? children})
      : super(
          FidelityProgramRoute.name,
          initialChildren: children,
        );

  static const String name = 'FidelityProgramRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FilterScreen]
class FilterRoute extends PageRouteInfo<void> {
  const FilterRoute({List<PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HelpScreen]
class HelpRoute extends PageRouteInfo<void> {
  const HelpRoute({List<PageRouteInfo>? children})
      : super(
          HelpRoute.name,
          initialChildren: children,
        );

  static const String name = 'HelpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HowItWorksScreen]
class HowItWorksRoute extends PageRouteInfo<void> {
  const HowItWorksRoute({List<PageRouteInfo>? children})
      : super(
          HowItWorksRoute.name,
          initialChildren: children,
        );

  static const String name = 'HowItWorksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InAppWebViewScreen]
class InAppWebViewRoute extends PageRouteInfo<InAppWebViewRouteArgs> {
  InAppWebViewRoute({
    Key? key,
    required String url,
    required ConfirmReservationState state,
    List<PageRouteInfo>? children,
  }) : super(
          InAppWebViewRoute.name,
          args: InAppWebViewRouteArgs(
            key: key,
            url: url,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'InAppWebViewRoute';

  static const PageInfo<InAppWebViewRouteArgs> page =
      PageInfo<InAppWebViewRouteArgs>(name);
}

class InAppWebViewRouteArgs {
  const InAppWebViewRouteArgs({
    this.key,
    required this.url,
    required this.state,
  });

  final Key? key;

  final String url;

  final ConfirmReservationState state;

  @override
  String toString() {
    return 'InAppWebViewRouteArgs{key: $key, url: $url, state: $state}';
  }
}

/// generated route for
/// [InspirationScreen]
class InspirationRoute extends PageRouteInfo<void> {
  const InspirationRoute({List<PageRouteInfo>? children})
      : super(
          InspirationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InspirationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainHomeScreen]
class MainHomeRoute extends PageRouteInfo<void> {
  const MainHomeRoute({List<PageRouteInfo>? children})
      : super(
          MainHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductsScreen]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RequiredReviewsScreen]
class RequiredReviewsRoute extends PageRouteInfo<RequiredReviewsRouteArgs> {
  RequiredReviewsRoute({
    Key? key,
    required String type,
    required List<Bookingsnotreviewed> notreviewed,
    List<PageRouteInfo>? children,
  }) : super(
          RequiredReviewsRoute.name,
          args: RequiredReviewsRouteArgs(
            key: key,
            type: type,
            notreviewed: notreviewed,
          ),
          initialChildren: children,
        );

  static const String name = 'RequiredReviewsRoute';

  static const PageInfo<RequiredReviewsRouteArgs> page =
      PageInfo<RequiredReviewsRouteArgs>(name);
}

class RequiredReviewsRouteArgs {
  const RequiredReviewsRouteArgs({
    this.key,
    required this.type,
    required this.notreviewed,
  });

  final Key? key;

  final String type;

  final List<Bookingsnotreviewed> notreviewed;

  @override
  String toString() {
    return 'RequiredReviewsRouteArgs{key: $key, type: $type, notreviewed: $notreviewed}';
  }
}

/// generated route for
/// [ReviewsBoardScreen]
class ReviewsBoardRoute extends PageRouteInfo<void> {
  const ReviewsBoardRoute({List<PageRouteInfo>? children})
      : super(
          ReviewsBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReviewsBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReviewsScreen]
class ReviewsRoute extends PageRouteInfo<ReviewsRouteArgs> {
  ReviewsRoute({
    Key? key,
    required List<ReviewDto> reviewsList,
    String? averageRating,
    String? reviewsNumber,
    required List<ReviewScale> listScale,
    required String id,
    required String type,
    required bool canReview,
    List<PageRouteInfo>? children,
  }) : super(
          ReviewsRoute.name,
          args: ReviewsRouteArgs(
            key: key,
            reviewsList: reviewsList,
            averageRating: averageRating,
            reviewsNumber: reviewsNumber,
            listScale: listScale,
            id: id,
            type: type,
            canReview: canReview,
          ),
          initialChildren: children,
        );

  static const String name = 'ReviewsRoute';

  static const PageInfo<ReviewsRouteArgs> page =
      PageInfo<ReviewsRouteArgs>(name);
}

class ReviewsRouteArgs {
  const ReviewsRouteArgs({
    this.key,
    required this.reviewsList,
    this.averageRating,
    this.reviewsNumber,
    required this.listScale,
    required this.id,
    required this.type,
    required this.canReview,
  });

  final Key? key;

  final List<ReviewDto> reviewsList;

  final String? averageRating;

  final String? reviewsNumber;

  final List<ReviewScale> listScale;

  final String id;

  final String type;

  final bool canReview;

  @override
  String toString() {
    return 'ReviewsRouteArgs{key: $key, reviewsList: $reviewsList, averageRating: $averageRating, reviewsNumber: $reviewsNumber, listScale: $listScale, id: $id, type: $type, canReview: $canReview}';
  }
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    required int selectedTab,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            selectedTab: selectedTab,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    required this.selectedTab,
  });

  final Key? key;

  final int selectedTab;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, selectedTab: $selectedTab}';
  }
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpFinalScreen]
class SignUpFinalRoute extends PageRouteInfo<void> {
  const SignUpFinalRoute({List<PageRouteInfo>? children})
      : super(
          SignUpFinalRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpFinalRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsAndConditionsScreen]
class TermsAndConditionsRoute extends PageRouteInfo<void> {
  const TermsAndConditionsRoute({List<PageRouteInfo>? children})
      : super(
          TermsAndConditionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsAndConditionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TermsScreen]
class TermsRoute extends PageRouteInfo<void> {
  const TermsRoute({List<PageRouteInfo>? children})
      : super(
          TermsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TermsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyDisponibilityScreen]
class VerifyDisponibilityRoute
    extends PageRouteInfo<VerifyDisponibilityRouteArgs> {
  VerifyDisponibilityRoute({
    Key? key,
    required TypeReservation typeReservation,
    String? activityDuration,
    required String id,
    required String title,
    required String address,
    String? typeHost,
    String? salePrice,
    String? perPerson,
    int? minNuits,
    String? price,
    required String url,
    List<ExtraPrice>? extraPrice,
    List<Room>? rooms,
    DateTime? startDate,
    DateTime? endDate,
    String? subtitle,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyDisponibilityRoute.name,
          args: VerifyDisponibilityRouteArgs(
            key: key,
            typeReservation: typeReservation,
            activityDuration: activityDuration,
            id: id,
            title: title,
            address: address,
            typeHost: typeHost,
            salePrice: salePrice,
            perPerson: perPerson,
            minNuits: minNuits,
            price: price,
            url: url,
            extraPrice: extraPrice,
            rooms: rooms,
            startDate: startDate,
            endDate: endDate,
            subtitle: subtitle,
          ),
          initialChildren: children,
        );

  static const String name = 'VerifyDisponibilityRoute';

  static const PageInfo<VerifyDisponibilityRouteArgs> page =
      PageInfo<VerifyDisponibilityRouteArgs>(name);
}

class VerifyDisponibilityRouteArgs {
  const VerifyDisponibilityRouteArgs({
    this.key,
    required this.typeReservation,
    this.activityDuration,
    required this.id,
    required this.title,
    required this.address,
    this.typeHost,
    this.salePrice,
    this.perPerson,
    this.minNuits,
    this.price,
    required this.url,
    this.extraPrice,
    this.rooms,
    this.startDate,
    this.endDate,
    this.subtitle,
  });

  final Key? key;

  final TypeReservation typeReservation;

  final String? activityDuration;

  final String id;

  final String title;

  final String address;

  final String? typeHost;

  final String? salePrice;

  final String? perPerson;

  final int? minNuits;

  final String? price;

  final String url;

  final List<ExtraPrice>? extraPrice;

  final List<Room>? rooms;

  final DateTime? startDate;

  final DateTime? endDate;

  final String? subtitle;

  @override
  String toString() {
    return 'VerifyDisponibilityRouteArgs{key: $key, typeReservation: $typeReservation, activityDuration: $activityDuration, id: $id, title: $title, address: $address, typeHost: $typeHost, salePrice: $salePrice, perPerson: $perPerson, minNuits: $minNuits, price: $price, url: $url, extraPrice: $extraPrice, rooms: $rooms, startDate: $startDate, endDate: $endDate, subtitle: $subtitle}';
  }
}
