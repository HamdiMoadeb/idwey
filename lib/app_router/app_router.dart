import 'package:auto_route/auto_route.dart';

import '../presentation/pages/pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: HomeRoute.page,
    ),
  ];
}
