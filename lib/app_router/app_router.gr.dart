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
    SearchRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SearchScreen(),
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
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
