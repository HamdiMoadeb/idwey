import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:idwey/models/host_detail.dart';
import 'package:idwey/utils/enums.dart';
import 'package:idwey/utils/urls.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'host_detail_state.dart';
part 'host_detail_cubit.freezed.dart';

class HostDetailCubit extends Cubit<HostDetailState> {
  HostDetailCubit() : super(HostDetailState.initial());

  void getHostDetails(int? id) async {
    try {
      var url = Uri.parse('${Urls.URL_API}hotel/detail/${id}');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      emit(state.copyWith(
        status: StateStatus.loading,
      ));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("data:${data}");
        final hostDetail = HostDetail.fromJson(data);
        emit(state.copyWith(
          hostDetail: hostDetail,
          status: StateStatus.success,
        ));
      }
    } on Exception catch (_) {
      print("test error");
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }
  }
}
