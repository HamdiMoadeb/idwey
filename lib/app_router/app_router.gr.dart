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
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
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
    InspirationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InspirationScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
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
  };
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
