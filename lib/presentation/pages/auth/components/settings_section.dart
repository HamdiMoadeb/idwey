import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';

import '../../../../constants/assets.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({Key? key}) : super(key: key);

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
              "Parametres",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              GetIt.I<AppRouter>().push(const BookingBoardRoute());
            },
            leading: const HeroIcon(
              HeroIcons.adjustmentsHorizontal,
              color: Colors.black,
            ),
            title: const Text("Mes réservations",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.reviews,
              height: 22.h,
              width: 22.h,
            ),
            title: const Text("Gérer mes avis",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            onTap: () {
              GetIt.I<AppRouter>().push(const ConfigurationRoute());
            },
            leading: const HeroIcon(
              HeroIcons.cog6Tooth,
              color: Colors.black,
            ),
            title: const Text("Configuration",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
