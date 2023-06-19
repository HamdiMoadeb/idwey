import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:idwey/models/host_page.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idwey/utils/urls.dart';
import 'package:http/http.dart' as http;

import '../../models/models.dart';

part 'host_page_state.dart';
part 'host_page_cubit.freezed.dart';

class HostPageCubit extends Cubit<HostPageState> {
  HostPageCubit() : super(HostPageState.initial());

  void getAllHosts(dynamic searchInputs, int skip, dynamic filterInputs) async {
    List<Host> listHosts = [];
    List<Term> listConvenience = [];
    List<Term> listHotelService = [];
    List<Term> listPropertyType = [];
    List<String> priceRange = [];
    String start = searchInputs['start'];
    String end = searchInputs['end'];
    String address = searchInputs['address'];
    String adults = searchInputs['adults'];
    String max = filterInputs['max'];
    String min = filterInputs['min'];
    List<dynamic> termsList = filterInputs['terms'];
    String terms = "";
    var url;
    try {
      emit(state.copyWith(
        status: StateStatus.loading,
      ));

      if (termsList.isNotEmpty) {
        for (var i = 0; i < termsList.length; i++) {
          if (i < termsList.length - 1) terms += termsList[i].toString() + ',';
          if (i == termsList.length - 1) terms += termsList[i].toString();
        }
      }

      if (max != '' && min != '' && termsList.isNotEmpty) {
        url = Uri.parse(
            '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max&terms=$terms');
      } else if (max != '' && min != '' && termsList.isEmpty) {
        url = Uri.parse(
            '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&price_range=$min%3B$max');
      } else if (termsList.isNotEmpty && max == '' && min == '') {
        url = Uri.parse(
            '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip&terms=$terms');
      } else {
        url = Uri.parse(
            '${Urls.URL_API}hotel?start=$start&end=$end&address=$address&adults=$adults&limit=20&offset=$skip');
      }

      var response = await http.get(url);

      print(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (Map<String, dynamic>? i in data["attributes"][1]["terms"]) {
          listConvenience.add(Term.fromJson(i ?? {}));
        }
        for (Map<String, dynamic>? i in data["attributes"][0]["terms"]) {
          listPropertyType.add(Term.fromJson(i ?? {}));
        }
        for (Map<String, dynamic>? i in data["attributes"][2]["terms"]) {
          listHotelService.add(Term.fromJson(i ?? {}));
        }
        final hostPage = HostPage.fromJson(data);
        currencies['EUR']['value'] = hostPage.eur;
        currencies['USD']['value'] = hostPage.usd;
        print("currencies:${currencies}");
        print("hostPage");
        print(hostPage.hosts);
        print(hostPage.cities);
        print(hostPage.hotelMinMaxPrice);
        print(hostPage.bannerImagePage);
        print(hostPage.toJson());
        emit(state.copyWith(
          hostPage: hostPage,
          listHosts: hostPage.hosts,
          listPropertyType: listPropertyType,
          listHotelService: listHotelService,
          listConvience: listConvenience,
          listLengthFromLastCall: hostPage.hosts!.length,
          totalNb: hostPage.total,
          max: double.tryParse(hostPage.hotelMinMaxPrice![1]),
          min: double.tryParse(hostPage.hotelMinMaxPrice![0]),
          lowerValue: state.min,
          upperValue: state.max,
          status: StateStatus.success,
        ));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }
  }
}
