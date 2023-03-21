import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SocialMediaLoginButton extends StatelessWidget {
  Color buttonColor;
  String buttonText;
  IconData icon;
  SocialMediaLoginButton(
      {required this.buttonColor,
      required this.buttonText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
