import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:idwey/models/host.dart';
import 'package:idwey/models/list_host.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idwey/utils/urls.dart';
import 'package:http/http.dart' as http;

part 'home_page_event.dart';
part 'home_page_state.dart';
part 'home_page_bloc.freezed.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState.initial()) {
    on<GetSectionHosts>(getSectionHosts);
  }

  void getSectionHosts(
      GetSectionHosts event, Emitter<HomePageState> emit) async {
    try {
      var url = Uri.parse('${Urls.URL_API}hotel/listHost');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      emit(state.copyWith(status: StateStatus.loading, listHosts: []));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("data:${data}");
        final list = ListHost.fromJson(data);
        currencies['EUR']['value'] = list.eur;
        currencies['USD']['value'] = list.usd;
        print("currencies:${currencies}");
        emit(state.copyWith(
          listHosts: list.rows,
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
