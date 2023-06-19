part of 'common_bloc.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState({
    StateStatus? status,
    String? currentCurrency,
    int? currencyIndex,
    List<String>? currencies,
    bool? isExpanded,
  }) = _CommonState;

  factory CommonState.initial() => CommonState(
      status: StateStatus.init,
      currencyIndex: 0,
      currentCurrency: "TND",
      isExpanded: false,
      currencies: currency);
}
