import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:heroicons/heroicons.dart';
import 'package:idwey/app_router/app_router.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({Key? key}) : super(key: key);

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
              "Support Idwey",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              GetIt.I<AppRouter>().push(const HelpRoute());
            },
            leading: const Icon(
              Icons.support_agent,
              color: Colors.black,
            ),
            title: const Text("Contacter Idwey",
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
              GetIt.I<AppRouter>().push(const HowItWorksRoute());
            },
            leading: const HeroIcon(
              HeroIcons.informationCircle,
              color: Colors.black,
            ),
            title: const Text("Comment ca marche ?",
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
