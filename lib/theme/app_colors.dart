import 'package:flutter/material.dart';

final Color primaryGrey = HexColor.fromHex('#F4F5F9');
final secondaryGrey = HexColor.fromHex('#f6f7f9');
final Color primaryOrange = HexColor.fromHex('#F55420');
final Color primary = HexColor.fromHex('#07C8B9');
final Color grey = HexColor.fromHex('#5e6d77');
final Color titleBlack = HexColor.fromHex('#1a2b50');
final Color footerBg = HexColor.fromHex('#f5f5f5');
final Color likedRed = HexColor.fromHex('#EB8F90');
final Color titleBlue = HexColor.fromHex('#1a2b48');
final Color facebookColor = HexColor.fromHex("#395899");
final Color googleColor = HexColor.fromHex("#f34a38");
final Color disabledColor = HexColor.fromHex("#abaaaa");
final Color disabledColorWithOpacity = HexColor.fromHex("#abaaaacc");
final Color redColor = HexColor.fromHex("#b50505");
final Color redColorWithOpacity = HexColor.fromHex("#b50505cc");
const LinearGradient kLinearGradient = LinearGradient(
  colors: [
    Color(0xFFE83F43),
    Color(0xFFF35526),
    Color(0xFFD92866),
  ], // Use the same gradient colors as the background
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const MaterialColor materialPrimary = MaterialColor(
  0xFFF55420,
  <int, Color>{
    50: Color(0xFFF4F5F9),
    100: Color(0xFFF55420),
    200: Color(0xFFF55420),
    300: Color(0xFFF55420),
    400: Color(0xFFF55420),
    500: Color(0xFFF55420),
    600: Color(0xFFF55420),
    700: Color(0xFFF55420),
    800: Color(0xFFF55420),
    900: Color(0xFFF55420),
  },
);

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}