import 'package:flutter/material.dart';
import 'package:idwey/blocs/blocs.dart';
import 'package:idwey/blocs/host_page_bloc/host_page_cubit.dart';
import 'package:idwey/screens/splachPage.dart';
import 'package:idwey/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<HomePageBloc>(
          lazy: false,
          create: (BuildContext context) => HomePageBloc(),
        ),
        BlocProvider<HostDetailCubit>(
          lazy: false,
          create: (BuildContext context) => HostDetailCubit(),
        ),
        BlocProvider<CommonBloc>(
          lazy: false,
          create: (BuildContext context) => CommonBloc(),
        ),
        BlocProvider<HostPageCubit>(
          lazy: false,
          create: (BuildContext context) => HostPageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Idwey',
        theme: ThemeData(
            primarySwatch: materialPrimary,
            splashColor: Colors.white,
            fontFamily: 'Poppins'),
        home: const SplashScreen(),
      ),
    );
  }
}
