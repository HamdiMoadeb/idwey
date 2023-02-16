import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:idwey/models/destination.dart';
import 'package:idwey/models/idweyForces.dart';
import 'package:idwey/models/testimonial.dart';
import 'package:idwey/utils/urls.dart';

import '../models/blog.dart';
import '../models/desire.dart';

class HomePageCalls {
  static Future<IdweyForces?> getIdweySectionData() async {
    IdweyForces? forces;

    var url = Uri.parse('${Urls.URL_API}idweySection');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      forces = IdweyForces.fromJson(data["rows"]);
    }
    return forces;
  }

  static Future<List<Desire>> getAllDesires() async {
    List<Desire> listDesires = [];

    var url = Uri.parse('${Urls.URL_API}style/listStyle');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listDesires.add(Desire.fromJson(i));
      }
    }
    return listDesires;
  }

  static Future<List<Destination>> getAllDestinations() async {
    List<Destination> listDestination = [];

    var url = Uri.parse('${Urls.URL_API}location/listLocation');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        listDestination.add(Destination.fromJson(i));
      }
    }
    return listDestination;
  }

  static Future<List<Testimonial>> getAllTestimonials() async {
    List<Testimonial> listTestimonial = [];

    var url = Uri.parse('${Urls.URL_API}avis');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]["list_item"]) {
        listTestimonial.add(Testimonial.fromJson(i));
      }
    }
    return listTestimonial;
  }

  static Future<List<String>?> getCarouselLinks() async {
    List<String>? links = [];

    var url = Uri.parse('${Urls.URL_API}formSearch');
    var response;
    await http.get(url).then((value) {
      response = value;
    }).onError((error, stackTrace) {
      links = null;
    });

    if (response != null && links != null && response.statusCode == 200) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["list_item"]) {
        links?.add(i["icon_url"]);
      }
    } else {
      links = null;
    }
    return links;
  }

  static Future<List<Blog>> getAllBlogs() async {
    List<Blog> getAllBlogs = [];

    var url = Uri.parse('${Urls.URL_API}blog/listBlog');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]) {
        getAllBlogs.add(Blog.fromJson(i));
      }
    }
    return getAllBlogs;
  }

  static Future<List<String>> getAllPartners() async {
    List<String> allPartners = [];

    var url = Uri.parse('${Urls.URL_API}partners');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      for (Map<String?, dynamic> i in data["rows"]["list_item"]) {
        allPartners.add(i["image_url"].toString());
      }
    }
    return allPartners;
  }
}
