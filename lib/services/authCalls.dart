import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
