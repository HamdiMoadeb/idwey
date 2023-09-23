import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/components/image_banner/image_banner_bloc/image_banner_bloc.dart';
import 'package:idwey/di/di_locator.dart';
import 'package:idwey/presentation/blocs/blocs.dart';
import 'package:idwey/presentation/blocs/inspiration_page/inspiration_bloc.dart';
import 'package:idwey/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:idwey/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:idwey/theme/input_theme.dart';

import 'app_router/app_router.dart';
import 'theme/app_colors.dart';
import 'theme/text_theme.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = GetIt.I<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => GetIt.I<HomeBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<DetailsPageBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<DetailsEventPageBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) =>
                GetIt.I<DetailsActivityPageBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) =>
                GetIt.I<DetailsExperiencePageBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<ImageBannerBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<InspirationBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<ArticleDetailsBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<ProductsBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<ProductDetailsBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<SignInBloc>(),
          ),
          BlocProvider(
            create: (BuildContext context) => GetIt.I<SignUpBloc>(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp.router(
                theme: ThemeData(
                    textTheme: textTheme,
                    inputDecorationTheme: inputDecorationTheme,
                    primarySwatch: materialPrimary,
                    splashColor: Colors.white,
                    fontFamily: 'Inter'),
                routerConfig: appRouter.config(),
                debugShowCheckedModeBanner: false,
              );
            }));
  }
}
