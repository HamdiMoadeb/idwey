import 'package:flutter/material.dart';
import 'package:idwey/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(''),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Montre le profil',
                    style: TextStyle(
                        color: primary, decoration: TextDecoration.underline)),
              ],
            )
          ],
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            )));
  }
}
