import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/room_dto.dart';
import 'package:idwey/presentation/dashboard_page/dashboard_page.dart';
import 'package:idwey/presentation/pages/assurance/assurance_page.dart';
import 'package:idwey/presentation/pages/auth/auth_page.dart';
import 'package:idwey/presentation/pages/auth/sign_up/sign_up_final_screen.dart';
import 'package:idwey/presentation/pages/details_page/activity_details_page.dart';
import 'package:idwey/presentation/pages/details_page/article_details_page.dart';
import 'package:idwey/presentation/pages/details_page/event_details_page.dart';
import 'package:idwey/presentation/pages/details_page/experience_details_page.dart';
import 'package:idwey/presentation/pages/details_page/host_details_page.dart';
import 'package:idwey/presentation/pages/details_page/products_details_page.dart';
import 'package:idwey/presentation/pages/home/main_home.dart';
import 'package:idwey/presentation/pages/inspiration/inspiration.dart';
import 'package:idwey/presentation/pages/products/products_page.dart';
import 'package:idwey/presentation/pages/terms_and_conditions/terms_and_conditions_screen.dart';

import '../data/models/extra_price_dto.dart';
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
        AutoRoute(path: '', page: MainHomeRoute.page),
        AutoRoute(path: '', page: InspirationRoute.page),
        AutoRoute(path: '', page: AssuranceRoute.page),
        AutoRoute(path: '', page: ProductsRoute.page),
        AutoRoute(path: '', page: AuthRoute.page),
      ],
    ),
    AutoRoute(page: AssuranceRoute.page),
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: ProductsRoute.page),
    AutoRoute(page: InspirationRoute.page),
    AutoRoute(page: DetailsRoute.page),
    AutoRoute(page: EventDetailsRoute.page),
    AutoRoute(page: ExperienceDetailsRoute.page),
    AutoRoute(page: ActivityDetailsRoute.page),
    AutoRoute(page: ArticleDetailsRoute.page),
    AutoRoute(page: DetailsProductRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: SignInRoute.page),
    AutoRoute(page: TermsAndConditionsRoute.page),
    AutoRoute(page: SearchRoute.page),
    AutoRoute(page: SignUpFinalRoute.page),
    AutoRoute(page: VerifyDisponibilityRoute.page),
    AutoRoute(page: ConfirmReservationRoute.page),
  ];
}
