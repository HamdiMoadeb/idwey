import 'package:flutter/material.dart';

class CustomClips extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 100);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.height, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

String removeDecimalZeroFormat(String num) {
  RegExp regex = RegExp(r'([.]*0+)(?!.*\d)');

  String s = num.replaceAll(regex, '');
  return s;
}
