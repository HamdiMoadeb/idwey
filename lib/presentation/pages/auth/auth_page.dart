import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/components/buttons/button.dart';
import 'package:idwey/constants/assets.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:idwey/presentation/pages/auth/components/profile_footer.dart';
import 'package:idwey/presentation/pages/auth/components/profile_header.dart';
import 'package:idwey/presentation/pages/auth/components/settings_section.dart';
import 'package:idwey/presentation/pages/auth/components/support_section.dart';
import 'package:idwey/theme/app_colors.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AppBloc>().add(const AppEvent.getUser());

    super.initState();
  }

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
                        child: Text('Mon profil',
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
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      Assets.background,
                      height: 340.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: Column(
                        children: [
                          Text('Que l\'aventure commence',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: primary)),
                          SizedBox(height: 20.h),
                          Text(
                            'l’application IDWEY.tn vous permet en quelques étapes de chercher, explorer, réserver et payer les bons plans aventures Outdoor.',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20.h),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton.primary(
                              onPressed: () {
                                GetIt.I<AppRouter>().push(const SignInRoute());
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('Se connecter'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: CustomButton.secondaryColor(
                              onPressed: () {
                                GetIt.I<AppRouter>().push(const SignUpRoute());
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text('S’inscrire'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
