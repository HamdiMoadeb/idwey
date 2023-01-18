import 'package:flutter/material.dart';
import 'package:idwey/screens/homePage.dart';
import 'package:idwey/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Idwey',
      theme: ThemeData(
        primarySwatch: materialPrimary,
        splashColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}
