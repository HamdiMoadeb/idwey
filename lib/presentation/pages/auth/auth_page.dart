import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          SharedPreferences.getInstance().then((value) {
            value.clear();
            context.read<AppBloc>().add(const AppEvent.setLoggedIn());
          });
        },
        child: Text('logout'),
      ),
    );
  }
}
