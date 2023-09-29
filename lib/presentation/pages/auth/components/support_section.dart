import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

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
          const ListTile(
            leading: HeroIcon(
              HeroIcons.phone,
              color: Colors.black,
            ),
            title: Text("Support Agent",
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
              HeroIcons.informationCircle,
              color: Colors.black,
            ),
            title: Text("Comment ca marche ?",
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
