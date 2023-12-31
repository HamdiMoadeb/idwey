import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileFooter extends StatelessWidget {
  const ProfileFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Légal",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              GetIt.I<AppRouter>().push(const TermsRoute());
            },
            leading: const HeroIcon(
              HeroIcons.bookOpen,
              color: Colors.black,
            ),
            title: const Text("Conditions d'utilisation",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0, left: 16, right: 16, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    child: const Text(
                      "Se déconnecter",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                    onTap: () async {
                      await SharedPreferences.getInstance().then((prefs) {
                        prefs.clear();
                        context
                            .read<AppBloc>()
                            .add(const AppEvent.setLoggedIn());

                        context.router.root.pop();
                        GetIt.I<AppRouter>().navigate(const DashboardRoute());
                      });
                    }),
                Text(
                  "version 1.0.0",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
