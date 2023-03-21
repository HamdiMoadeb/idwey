import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';

enum UserType {
  client,
  vendor,
}

class CustomClips extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width , 100 );
    path.lineTo(0, 100);
    path.lineTo(size.width, 0);
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

String? validateEmail(String? value) {
  final pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value!)) {
    return 'S\'il vous plaît, mettez une adresse email valide';
  }
  return '';
}

String? validatePassword(String? value) {
  if (value!.isEmpty || value.length < 8) {
    return 'Le mot de passe doit comporter au moins 8 caractères';
  }

  final hasLetters = RegExp(r'[a-zA-Z]').hasMatch(value);
  final hasNumbers = RegExp(r'\d').hasMatch(value);
  final hasSpecialCharacters = RegExp(r'[!@#\$&*~]').hasMatch(value);

  if (!hasLetters || !hasNumbers || !hasSpecialCharacters) {
    return 'Le mot de passe doit contenir au moins une lettre, un chiffre et un caractère spécial (!@#\$&*~)';
  }

  return '';
}

Icon getIconByTitle(String status) {
  switch (status) {
    case "Douche":
      return Icon(
        IcoFontIcons.bathtub,
        color: grey,
        size: 35,
      );
    case "Parking gratuit":
      return Icon(
        IcoFontIcons.car,
        color: grey,
        size: 35,
      );
    case "Piscine":
      return Icon(
        IcoFontIcons.swimmer,
        color: grey,
        size: 35,
      );
    case "Cuisine équipé":
      return Icon(
        IcoFontIcons.tickBoxed,
        color: grey,
        size: 35,
      );
    case "Convient aux familles avec enfants":
      return Icon(
        IcoFontIcons.usersSocial,
        color: grey,
        size: 35,
      );
    case "Climatisation":
      return Icon(
        IcoFontIcons.snowAlt,
        color: grey,
        size: 35,
      );
    case "Équipements de base":
      return Icon(
        IcoFontIcons.hanger,
        color: grey,
        size: 35,
      );
    case "Petit déjeuner":
      return Icon(
        IcoFontIcons.tea,
        color: grey,
        size: 35,
      );
    case "Internet":
      return Icon(
        IcoFontIcons.rss,
        color: grey,
        size: 35,
      );
    case "Télévision":
      return Icon(
        IcoFontIcons.monitor,
        color: grey,
        size: 35,
      );
    case "Accès plage ou bord de mer":
      return Icon(
        IcoFontIcons.beach,
        color: grey,
        size: 35,
      );
    case "Jeux":
      return Icon(
        IcoFontIcons.diceMultiple,
        color: grey,
        size: 35,
      );
    case "Pas d'alcool":
      return Icon(
        IcoFontIcons.notAllowed,
        color: grey,
        size: 35,
      );
    case "Animaux acceptés":
      return Icon(
        IcoFontIcons.catDog,
        color: grey,
        size: 35,
      );
    case "nettoyage":
      return Icon(
        IcoFontIcons.recycleAlt,
        color: grey,
        size: 35,
      );
    case "Internet – Wifi":
      return Icon(
        IcoFontIcons.wifi,
        color: grey,
        size: 35,
      );
    case "Café et thé":
      return Icon(
        IcoFontIcons.tea,
        color: grey,
        size: 35,
      );
    case "Accessible aux personnes à mobilité réduite":
      return Icon(
        IcoFontIcons.wheelchair,
        color: grey,
        size: 35,
      );
    case "Guide":
      return Icon(
        IcoFontIcons.hotelBoy,
        color: grey,
        size: 35,
      );
    case "Réception 24h / 24":
      return Icon(
        IcoFontIcons.clockTime,
        color: grey,
        size: 35,
      );
    case "Soirées festives autorisées":
      return Icon(
        IcoFontIcons.birthdayCake,
        color: grey,
        size: 35,
      );
    case "Auberge":
      return Icon(
        IcoFontIcons.hotel,
        color: grey,
        size: 35,
      );
    case "Centre de camping":
      return Icon(
        IcoFontIcons.forestFire,
        color: grey,
        size: 35,
      );
    case "Ferme écologique":
      return Icon(
        IcoFontIcons.farmer,
        color: grey,
        size: 35,
      );
    case "Dôme écologique":
      return Icon(
        IcoFontIcons.ecoEnvironmen,
        color: grey,
        size: 35,
      );
    case "Maison d'hôtes":
      return Icon(
        IcoFontIcons.home,
        color: grey,
        size: 35,
      );
    case "Refuge de montagne":
      return Icon(
        IcoFontIcons.hill,
        color: grey,
        size: 35,
      );
    case "Petit-déjeuner":
      return Icon(
        IcoFontIcons.tea,
        color: grey,
        size: 35,
      );
    case "Déjeuner":
      return Icon(
        IcoFontIcons.culinary,
        color: grey,
        size: 35,
      );
    case "Dîner":
      return Icon(
        IcoFontIcons.culinary,
        color: grey,
        size: 35,
      );
    case "Logement fumeur":
      return Icon(
        IcoFontIcons.fire,
        color: grey,
        size: 35,
      );
    case "Chambre d'hôtes":
      return Icon(
        IcoFontIcons.hotel,
        color: grey,
        size: 35,
      );
    case "Gite rural":
      return Icon(
        IcoFontIcons.love,
        color: grey,
        size: 35,
      );
    case "Lit pour bébé":
      return Icon(
        IcoFontIcons.baby,
        color: grey,
        size: 35,
      );
    case "Wifi":
      return Icon(
        IcoFontIcons.wifi,
        color: grey,
        size: 35,
      );
    case "Maison de vacance":
      return Icon(
        IcoFontIcons.home,
        color: grey,
        size: 35,
      );
    default:
      return Icon(
        Icons.help_outline,
        color: grey,
        size: 35,
      );
  }
}

String replaceWhitespaces(String s) {
  if (s == null) {
    return '';
  }

  s = s.replaceAll('\'', '');
  return s.replaceAll(' ', '-');
}

List<String> cities = [
  "Adresse",
  "Tunis",
  "Ariana",
  "Ben Arous",
  "Nabeul",
  "Manouba",
  "Zaghouan",
  "Bizerte",
  "Béja",
  "Jendouba",
  "El Kef",
  "Siliana",
  "Sousse",
  "Monastir",
  "Mahdia",
  "Sfax",
  "Kairouan",
  "Kasserine",
  "Sidi Bouzid",
  "Gabès",
  "Medenine",
  "Tataouine",
  "Gafsa",
  "Tozeur",
  "Kebili"
];

getDateFormat(String date) {
  DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
  String newDate = DateFormat('dd/MM/yyyy').format(tempDate);
  return newDate;
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

checkInternetConnectivity(context, Function isConnectedCallback) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile &&
      connectivityResult != ConnectivityResult.wifi) {
    isConnectedCallback();
    CoolAlert.show(
        context: context,
        widget: WillPopScope(
          onWillPop: () async => false,
          child: Container(),
        ),
        type: CoolAlertType.info,
        loopAnimation: true,
        title: 'Pas de connexion Internet',
        text:
            "Vous êtes hors ligne, veuillez vérifier votre connexion Internet.",
        confirmBtnColor: primaryOrange,
        barrierDismissible: false,
        showCancelBtn: false,
        confirmBtnText: 'Réessayez',
        backgroundColor: Colors.black,
        onConfirmBtnTap: () {
          Navigator.pop(context);
          checkInternetConnectivity(context, isConnectedCallback);
        });
  } else {
    isConnectedCallback();
  }
}
