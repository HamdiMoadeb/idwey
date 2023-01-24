import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

@override
Future<void> customLaunchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  final _canLaunch = await canLaunchUrl(uri);
  if (kIsWeb) {
    if (_canLaunch) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $url";
    }
    return;
  }
  if (Platform.isAndroid) {
    if (url.startsWith("https://www.facebook.com/")) {
      final url2 = "fb://facewebmodal/f?href=$url";
      final intent2 = AndroidIntent(action: "action_view", data: url2);
      final canWork = await intent2.canResolveActivity();
      if (canWork!) return intent2.launch();
    }
    final intent = AndroidIntent(action: "action_view", data: url);
    return intent.launch();
  } else {
    if (_canLaunch) {
      await launchUrl(uri);
    } else {
      throw "Could not launch $url";
    }
  }
}
