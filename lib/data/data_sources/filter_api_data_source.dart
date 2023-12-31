import 'package:dio/dio.dart';
import 'package:idwey/data/models/experience_dto.dart';
import 'package:idwey/data/models/host_dto.dart';

import '../models/activity_dto.dart';
import '../models/event_dto.dart';

abstract class FilterApiDataSource {
  Future<List<Host>> filterHosts(
    Map<String, dynamic> body,
  );
  Future<List<Event>> filterEvents(
    Map<String, dynamic> body,
  );
  Future<List<Activity>> filterActivities(
    Map<String, dynamic> body,
  );
  Future<List<Experience>> filterRestaurants(
    Map<String, dynamic> body,
  );
}

class FilterApiDataSourceImpl implements FilterApiDataSource {
  final Dio dio;
  FilterApiDataSourceImpl(this.dio);

  @override
  Future<List<Host>> filterHosts(Map<String, dynamic> body) async {
    List<Host> listOfHosts = [];
    int offset = body['offset'];
    String terms = body['terms'];
    String prices = body['price_range'];

    //  try {
    final response = await dio.get(
        "https://idwey.tn/api/hotel?offset=$offset&limit=10&price_range=$prices&terms=$terms");

    response.data['rows'].forEach((data) {
      listOfHosts.add(Host.fromJson(data));
    });

    return listOfHosts;
    // } catch (e) {
    //   throw Exception();
    // }
  }

  @override
  Future<List<Activity>> filterActivities(Map<String, dynamic> body) async {
    try {
      List<Activity> listOfActivities = [];
      int offset = body['offset'];
      String terms = body['terms'];
      String prices = body['price_range'];
      //  try {
      final response = await dio.get(
          "https://idwey.tn/api/activity?offset=$offset&limit=10&price_range=$prices&terms=$terms");

      response.data['rows'].forEach((data) {
        listOfActivities.add(Activity.fromJson(data));
      });

      return listOfActivities;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Event>> filterEvents(Map<String, dynamic> body) async {
    try {
      List<Event> listOfEvents = [];
      int offset = body['offset'];
      String terms = body['terms'];
      String prices = body['price_range'];

      //  try {
      final response = await dio.get(
          "https://idwey.tn/api/event?offset=$offset&limit=10&price_range=$prices&terms=$terms");

      response.data['rows'].forEach((data) {
        listOfEvents.add(Event.fromJson(data));
      });

      return listOfEvents;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<Experience>> filterRestaurants(Map<String, dynamic> body) async {
    try {
      List<Experience> listOfExperiences = [];
      int offset = body['offset'];
      String terms = body['terms'];
      String prices = body['price_range'];
      //  try {
      final response = await dio.get(
          "https://idwey.tn/api/experience?offset=$offset&limit=10&price_range=$prices&terms=$terms");

      response.data['rows'].forEach((data) {
        listOfExperiences.add(Experience.fromJson(data));
      });

      return listOfExperiences;
    } catch (e) {
      throw Exception();
    }
  }
}
