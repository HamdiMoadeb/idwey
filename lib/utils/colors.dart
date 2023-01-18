import 'package:flutter/material.dart';

final Color primaryGrey = HexColor.fromHex('#F4F5F9');
final Color primaryOrange = HexColor.fromHex('#F55420');
final Color primary = HexColor.fromHex('#07C8B9');
final Color grey = HexColor.fromHex('#5e6d77');
final Color titleBlack = HexColor.fromHex('#1a2b50');

const MaterialColor materialPrimary = MaterialColor(
  0xFF07C8B9,
  <int, Color>{
    50: Color(0xFFF4F5F9),
    100: Color(0xFF07C8B9),
    200: Color(0xFF07C8B9),
    300: Color(0xFF07C8B9),
    400: Color(0xFF07C8B9),
    500: Color(0xFF07C8B9),
    600: Color(0xFF07C8B9),
    700: Color(0xFF07C8B9),
    800: Color(0xFF07C8B9),
    900: Color(0xFF07C8B9),
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
