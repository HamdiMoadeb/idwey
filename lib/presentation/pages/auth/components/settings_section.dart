import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

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
          const ListTile(
            leading: HeroIcon(
              HeroIcons.adjustmentsHorizontal,
              color: Colors.black,
            ),
            title: Text("Mes reservations",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const ListTile(
            leading: HeroIcon(
              HeroIcons.gift,
              color: Colors.black,
            ),
            title: Text("Mes points",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const ListTile(
            leading: HeroIcon(
              HeroIcons.adjustmentsHorizontal,
              color: Colors.black,
            ),
            title: Text("Gerer mes avis",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          const ListTile(
            leading: HeroIcon(
              HeroIcons.cog6Tooth,
              color: Colors.black,
            ),
            title: Text("Configuration",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                )),
            trailing: Icon(
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
