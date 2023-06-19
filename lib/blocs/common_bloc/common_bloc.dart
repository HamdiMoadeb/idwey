import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:idwey/utils/constants.dart';
import 'package:idwey/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idwey/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'common_event.dart';
part 'common_state.dart';
part 'common_bloc.freezed.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc() : super(CommonState.initial()) {
    on<GetSelectedCurrency>(getSelectedCurrency);
    on<OnChangeCurrency>(onChangeCurrency);
    on<OnExpand>(onExpand);
  }

  SharedPreferences? prefs;

  void getSelectedCurrency(
      GetSelectedCurrency event, Emitter<CommonState> emit) async {
    prefs = await SharedPreferences.getInstance();
    final selectedCurrency = prefs?.getString('selectedCurrency') ?? 'TND';
    final selectedIndex =
        currency.indexWhere((element) => element == selectedCurrency);

    print("common bloc ");
    print(selectedIndex);
    print(selectedCurrency);
    print(state.currencies);
    emit(state.copyWith(
      currentCurrency: selectedCurrency,
      currencyIndex: selectedIndex,
    ));

    List.from(state.currencies ?? [])
        .removeWhere((element) => element == selectedCurrency);
    List.from(state.currencies ?? []).insert(0, state.currentCurrency);

    emit(state.copyWith(
      currencies: state.currencies,
    ));
    print("common bloc *******");
    print(state.currencies);
  }

  void onChangeCurrency(
      OnChangeCurrency event, Emitter<CommonState> emit) async {
    final selectedCurrency =
        List.from(state.currencies ?? []).removeAt(event.index);
    final List<String> list = List.from(state.currencies ?? [])
      ..removeAt(event.index);

    list.insert(0, selectedCurrency);

    await prefs!.setString('selectedCurrency', selectedCurrency);
    String y = prefs!.getString('selectedCurrency')!;

    emit(state.copyWith(
        currencies: list,
        currentCurrency: selectedCurrency,
        isExpanded: true,
        currencyIndex: event.index));

    print("onchangecurrency");
    print(state.currencies);
    print(state.currentCurrency);
    print(state.currencyIndex);
  }

  void onExpand(OnExpand event, Emitter<CommonState> emit) {
    emit(state.copyWith(
      isExpanded: event.isExpanded,
    ));
  }
}
