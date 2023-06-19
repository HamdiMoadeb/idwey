part of 'common_bloc.dart';

@freezed
class CommonEvent with _$CommonEvent {
  const factory CommonEvent.getSelectedCurrency() = GetSelectedCurrency;
  const factory CommonEvent.onChangeCurrency(String currency, int index) =
      OnChangeCurrency;
  const factory CommonEvent.onExpand(bool isExpanded) = OnExpand;
}
