import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idwey/screens/homePage.dart';
import 'package:idwey/screens/splachPage.dart';
import 'package:idwey/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            supportedLocales: [
              const Locale('en'),
              const Locale('el'),
              const Locale.fromSubtags(
                  languageCode: 'zh',
                  scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
              const Locale.fromSubtags(
                  languageCode: 'zh',
                  scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
            ],
            localizationsDelegates: [
              CountryLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Idwey',
            theme: ThemeData(
                primarySwatch: materialPrimary,
                splashColor: Colors.white,
                fontFamily: 'Poppins'),
            home: const SplashScreen(),
          );
        });
  }
}
