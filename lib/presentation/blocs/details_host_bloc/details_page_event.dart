part of 'details_page_bloc.dart';

@freezed
class DetailsPageEvent with _$DetailsPageEvent {
  const factory DetailsPageEvent.getHostDetails(int id) = GetHostDetails;
  const factory DetailsPageEvent.onExtraPriceChecked(ExtraPrice extraPrice) =
      _OnExtraPriceChecked;
  const factory DetailsPageEvent.onExtraPriceUnChecked(ExtraPrice extraPrice) =
      _OnExtraPriceUnChecked;
  const factory DetailsPageEvent.onChangExtraPriceNumber(
      ExtraPrice extraPrice, int i) = _OnChangedExtraPriceNumber;
}
