import 'package:dio/dio.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/data/models/host_details_dto.dart';
import 'package:idwey/data/models/host_dto.dart';

abstract class ReservationApiDataSource {
  Future<Map<String, dynamic>> doCheckout(Map<String, dynamic> body);
  Future<List<BookingDto>> getReservationList(int params);
}

class ReservationApiDataSourceImpl implements ReservationApiDataSource {
  final Dio dio;

  ReservationApiDataSourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> doCheckout(Map<String, dynamic> body) async {
    // try {
    final response = await dio.post(
      "https://idwey.tn/api/booking/doCheckout",
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
  Future<List<BookingDto>> getReservationList(int params) async {
    try {
      final response = await dio.get(
        "https://idwey.tn/api/user/booking-history/$params",
      );
      print("response");
      print(response.data);
      return (response.data as List)
          .map((e) => BookingDto.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
