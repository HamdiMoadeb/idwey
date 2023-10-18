import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/presentation/pages/auth/components/profile_footer.dart';
import 'package:idwey/presentation/pages/auth/components/profile_header.dart';
import 'package:idwey/presentation/pages/auth/components/settings_section.dart';
import 'package:idwey/presentation/pages/auth/components/support_section.dart';
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
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return state.isLoggedIn == true
            ? Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 60.0, left: 16.0, bottom: 16.0),
                        child: Text('Profile',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: ProfileHeader(),
                    ),
                    const SliverToBoxAdapter(
                      child: SettingsSection(),
                    ),
                    const SliverToBoxAdapter(
                      child: SupportSection(),
                    ),
                    const SliverToBoxAdapter(
                      child: ProfileFooter(),
                    ),
                  ],
                ),
              )
            : TextButton(
                onPressed: () {
                  GetIt.I<AppRouter>().push(const SignInRoute());
                },
                child: const Text('Se connecter'));
      },
    );
  }
}
