import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ReservationApiDataSource {
  Future<Map<String, dynamic>> doCheckout(Map<String, dynamic> body);
  Future<Map<String, dynamic>> doOnlineCheckout(Map<String, dynamic> body);
  Future<List<BookingDto>> getReservationList(int params);
}

class ReservationApiDataSourceImpl implements ReservationApiDataSource {
  final Dio dio;

  ReservationApiDataSourceImpl(this.dio);
  final KONNECT_API_KEY = "647dc9678e0b604b113fe847:wwNkfEdEY8uPVpuVdP46TxHCj";
  final KONNECT_RECEIVER_WALLET_ID = "647dc9678e0b604b113fe84a";
  final KONNECT_PAYMENT_URL =
      "https://api.preprod.konnect.network/api/v2/payments/init-payment";
  @override
  Future<Map<String, dynamic>> doCheckout(Map<String, dynamic> body) async {
    // try {
    final response = await dio.post(
      "https://idwey.tn/api/booking/doCheckout",
      data: body,
    );

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

      return (response.data as List)
          .map((e) => BookingDto.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>> doOnlineCheckout(
      Map<String, dynamic> body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      Map<String, String> headers = {
        'x-api-key': KONNECT_API_KEY,
      };

      Map<String, dynamic> requestBody = {
        "receiverWalletId": KONNECT_RECEIVER_WALLET_ID,
        "token": "TND",
        "amount": 10000,
        "type": "immediate",
        "description": "payment description",
        "acceptedPaymentMethods": ["wallet", "bank_card", "e-DINAR"],
        "lifespan": 10,
        "checkoutForm": true,
        "addPaymentFeesToAmount": true,
        "firstName": decodedToken['first_name'].toString(),
        "lastName": decodedToken['last_name'],
        "phoneNumber": decodedToken['phone'],
        "email": decodedToken['email'],
        "orderId": "1234657",
        "webhook": "https://merchant.tech/api/notification_payment",
        "silentWebhook": true,
        "successUrl": "http://102.219.178.96:5776/success",
        "failUrl": "http://102.219.178.96:5776/failed",
        "theme": "light"
      };

      try {
        var response = await dio.post(
          KONNECT_PAYMENT_URL,
          data: jsonEncode(requestBody),
          options: Options(headers: headers),
        );

        return response.data;
      } catch (e) {
        throw Exception(e);
      }
    } else {
      throw Exception("token is null");
    }
  }
}
