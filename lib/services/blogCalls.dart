import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/blog.dart';
import '../utils/urls.dart';

class BlogCalls {
  static Future<List<Blog>> getAllBlogs(int skip) async {
    List<Blog> getAllBlogs = [];
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

  static Future<ArticleDetail> getArticleDetails(int id) async {
    ArticleDetail article = ArticleDetail(0, '', '', '', '', '', '');
    var url = Uri.parse('${Urls.URL_API}blog/detail/$id');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      article = ArticleDetail.fromJson(data);
    }
    return article;
  }
}
