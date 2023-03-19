import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isEmail;
  final ValueChanged<String> onChanged;

  InputField({
    required this.controller,
    required this.onChanged,
    this.isEmail = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isEmail ? Icon(Icons.mail) : Icon(Icons.lock),
        labelText: isEmail ? 'Adresse email' : 'Mot de passe',
        hintStyle: TextStyle(fontSize: 5),
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
      ),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      onChanged: onChanged,
      validator: isEmail ? validateEmail : validatePassword,
      obscureText: !isEmail,
    );
  }
}

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget icon;
  final ValueChanged<String> onChanged;

  TextInputField(
      {required this.controller,
      required this.onChanged,
      required this.icon,
      required this.placeholder});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: icon,
        labelText: placeholder,
        hintStyle: TextStyle(fontSize: 5),
        contentPadding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
      ),
      keyboardType: TextInputType.text,
      onChanged: onChanged,
    );
  }
}
