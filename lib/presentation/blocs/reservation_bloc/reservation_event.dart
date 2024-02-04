part of 'reservation_bloc.dart';

@freezed
class ReservationEvent with _$ReservationEvent {
  const factory ReservationEvent.setParams(
      String? activityDuration,
      String? id,
      String? url,
      String? title,
      String? address,
      String? typeHost,
      String? salePrice,
      String? perPerson,
      int? minNuits,
      String? checkIn,
      String? checkOut,
      List<ExtraPrice>? extraPrice,
      String? price) = _setParams;
  const factory ReservationEvent.checkAvailability(
      String type,
      int id,
      String checkIn,
      String checkOut,
      String adults,
      String children) = _CheckAvailability;

  const factory ReservationEvent.onSelectDates(
      String startDate, String endDate, String nbNights) = _OnSelectDates;
  const factory ReservationEvent.onSelectGuests(int guests, String price) =
      _OnSelectGuests;

  const factory ReservationEvent.addToCart(TypeReservation typeReservation) =
      _ConfirmReservation;
  const factory ReservationEvent.onSelectChalet(Room chalet) = _OnSelectChalet;
  const factory ReservationEvent.onUnSelectChalet(Room chalet) =
      _OnUnSelectChalet;
  const factory ReservationEvent.initStatus() = _InitStatus;
  const factory ReservationEvent.onExtraPriceQuantityChanged(
      ExtraPrice extraPrice, int i) = _OnExtraPriceQuantityChanged;
}
