import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/reservation.dart';
import 'package:idwey/utils/urls.dart';

class AuthCalls {
  static Future<http.Response> register(
      String nom, String prenom, String email, String password) async {
    var body = {
      "first_name": prenom,
      "last_name": nom,
      "email": email,
      "password": password,
      "term": 1
    };

    String bodyEncoded = jsonEncode(body);

    var url = Uri.parse('${Urls.URL_API}register');
    var response = await http.post(url,
        body: bodyEncoded, headers: {"Content-Type": "application/json"});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    var body = {
      "email": email,
      "password": password,
    };

    String bodyEncoded = jsonEncode(body);

    var url = Uri.parse('${Urls.URL_API}login');
    var response = await http.post(url,
        body: bodyEncoded, headers: {"Content-Type": "application/json"});

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return response;
  }

  static Future<List> getAllReservations() async {
    List<Reservation> listReservations = [];
    List result = [];
    var url = Uri.parse('${Urls.URL_API}user/booking-history/2519');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      result = data;
    }

    return result;
  }
}
