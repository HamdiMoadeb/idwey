import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/blog.dart';
import '../utils/urls.dart';

class BlogCalls {
  static Future<List<Blog>> getAllBlogs(int skip) async {
    List<Blog> getAllBlogs = [];
    print('yoo');
    var url =
        Uri.parse('${Urls.URL_API}blog?offset=$skip&limit=10&category=culture');
    print(url);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data["rows"]);
      for (Map<String?, dynamic> i in data["rows"]) {
        getAllBlogs.add(Blog.fromJson(i));
      }
    }
    return getAllBlogs;
  }
}
