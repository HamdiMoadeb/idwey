import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:idwey/presentation/dashboard_page/dashBoard_page.dart';
import 'package:idwey/presentation/pages/assurance/Assurance_page.dart';
import 'package:idwey/presentation/pages/auth/auth_page.dart';
import 'package:idwey/presentation/pages/home/event_tab.dart';
import 'package:idwey/presentation/pages/home/main_home.dart';
import 'package:idwey/presentation/pages/inspiration/inspiration.dart';
import 'package:idwey/presentation/pages/products/products_page.dart';

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
      path: '/dashboard',
      page: DashboardRoute.page,
      children: [
        AutoRoute(path: '', page: InspirationRoute.page),
        AutoRoute(path: '', page: AssuranceRoute.page),
        AutoRoute(path: '', page: MainHomeRoute.page),
        AutoRoute(path: '', page: ProductsRoute.page),
        AutoRoute(path: '', page: AuthRoute.page),
      ],
    ),
    AutoRoute(page: AssuranceRoute.page),
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: ProductsRoute.page),
    AutoRoute(page: InspirationRoute.page),
  ];
}
