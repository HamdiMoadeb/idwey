part of 'reservation_bloc.dart';

@freezed
class ReservationEvent with _$ReservationEvent {
  const factory ReservationEvent.getUser() = _GetUser;
  const factory ReservationEvent.checkAvailability(int id, String checkIn,
      String checkOut, String adults, String children) = _CheckAvailability;
  const factory ReservationEvent.confirmReservation() = _ConfirmReservation;
  const factory ReservationEvent.validInformations() = _ValidInformations;
  const factory ReservationEvent.onTermsAndConditionsChecked() =
      _OnTermsAndConditionsChecked;
  const factory ReservationEvent.onOfflinechecked() = _OnOfflineChecked;
  const factory ReservationEvent.onOnlinechecked() = _OnOnlineChecked;
  const factory ReservationEvent.onSelectDates(
      String startDate, String endDate, String nbNights) = _OnSelectDates;
}
