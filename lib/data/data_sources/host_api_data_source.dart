import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';
import 'package:idwey/data/models/host_page_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HostApiDataSource {
  Future<List<Host>> getListHosts(int limit, int offset);
  Future<HostPageDto> getHostPageData(int limit, int offset);
  Future<List<Host>> searchListHosts(
    int limit,
    int offset,
    String start,
    String end,
    int adults,
    String address,
  );
  Future<HostDetails> getHost(int id);
  Future<dynamic> checkHostAvailability(String type, int id, String checkIn,
      String checkOut, int adults, int children);
  Future<Map<String, dynamic>> confirmHostReservation(
      Map<String, dynamic> body);
}

class HostApiDataSourceImpl implements HostApiDataSource {
  final Dio dio;
  HostApiDataSourceImpl(this.dio);

  @override
  Future<List<Host>> getListHosts(int limit, int offset) async {
    List<Host> listOfHosts = [];
    try {
      final response =
          await dio.get("https://idwey.tn/api/hotel?offset=$offset&limit=10");
      response.data['rows'].forEach((data) {
        listOfHosts.add(Host.fromJson(data));
      });

      return listOfHosts;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<HostDetails> getHost(int id) async {
    // try {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String userId = preferences.getString("userId") ?? "0";
    final response =
        await dio.get("https://idwey.tn/api/hotel/detail/$id/$userId");
    log(response.data.toString());
    return HostDetails.fromJson(response.data);
    // } catch (e) {
    //   print(e);
    //   throw Exception(e);
    // }
  }

  @override
  Future<dynamic> checkHostAvailability(String type, int id, String checkIn,
      String checkOut, int adults, int children) async {
    try {
      String url = "";
      if (type == TypeReservation.host.toString()) {
        url =
            "https://idwey.tn/api/hotel/checkAvailability?start_date=$checkIn&end_date=$checkOut&adults=$adults&children=$children&hotel_id=$id";
      } else if (type == TypeReservation.activity.toString()) {
        url =
            "https://idwey.tn/api/activity/checkAvailability?start_date=$checkIn&end_date=$checkOut&adults=$adults&children=$children&tour_id=$id";
      } else if (type == TypeReservation.experience.toString()) {
        url =
            "https://idwey.tn/api/experience/checkAvailability?start_date=$checkIn&children=0&experience_id=$id&adults=$adults";
      }
      print("url:$url");
      final response = await dio.get(url);

      return response.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> confirmHostReservation(
      Map<String, dynamic> body) async {
    // try {
    final response = await dio.post(
      "https://idwey.tn/api/booking/addToCart",
      data: body,
    );
    print("response");
    print(response.data);
    return response.data;
    // } catch (e) {
    //   throw Exception(e);
    // }
  }

  @override
  Future<List<Host>> searchListHosts(int limit, int offset, String start,
      String end, int adults, String address) async {
    List<Host> listOfHosts = [];
    print(
        "https://idwey.tn/api/hotel?offset=$offset&limit=$limit&start=$start&end=$end&address=$address&adults=$adults");
    final response = await dio.get(
        "https://idwey.tn/api/hotel?offset=$offset&limit=$limit&start=$start&end=$end&address=$address&adults=$adults");

    print("response.data");
    print(response.data);
    response.data['rows'].forEach((data) {
      listOfHosts.add(Host.fromJson(data));
    });

    return listOfHosts;
  }

  @override
  Future<HostPageDto> getHostPageData(int limit, int offset) async {
    try {
      final response =
          await dio.get("https://idwey.tn/api/hotel?offset=$offset&limit=10");

      print("response.data");
      print(response.data);
      print(response.data['hotel_min_max_price']);
      print(HostPageDto.fromJson(response.data).hotelMinMaxPrice);

      return HostPageDto.fromJson(response.data);
    } catch (e) {
      throw Exception();
    }
  }
}
