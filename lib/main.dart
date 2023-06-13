import 'package:flutter/material.dart';
import 'package:idwey/screens/homePage.dart';
import 'package:idwey/screens/splachPage.dart';
import 'package:idwey/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/host_bloc/host_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<HostBloc>(
          lazy: false,
          create: (BuildContext context) => HostBloc(),
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
