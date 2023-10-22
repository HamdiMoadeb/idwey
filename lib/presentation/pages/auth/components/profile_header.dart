import 'package:flutter/material.dart';
import 'package:idwey/theme/app_colors.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  Future<String> getNameFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs!.getString('token');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return decodedToken['first_name'] +" "+ decodedToken['last_name'];
    }
    else {
      return "Nom & Prénom";
    }
  }

  Future<String> getImageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs!.getString('token');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return decodedToken['image_url'];
    }
    else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: FutureBuilder<String>(
        future: getNameFromPrefs(),
        builder: (context, nameSnapshot) {
          return FutureBuilder<String>(
            future: getImageFromPrefs(),
            builder: (context, imageSnapshot) {
              final userName = nameSnapshot.data!;
              final imageUrl = imageSnapshot.data!;

              return Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(imageUrl)
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Montre le profil',
                          style: TextStyle(
                              color: primary, decoration: TextDecoration.underline)),
                    ],
                  )
                ],
              );
            },
          );
        },
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
      ),
    );
  }
}
