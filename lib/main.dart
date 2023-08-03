import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/di/di_locator.dart';
import 'package:idwey/presentation/blocs/home_page/home_bloc.dart';

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
        ],
        child: MaterialApp.router(
          theme: ThemeData(
              textTheme: textTheme,
              primarySwatch: materialPrimary,
              splashColor: Colors.white,
              fontFamily: 'Inter'),
          routerConfig: appRouter.config(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
