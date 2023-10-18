part of 'confirm_reservation_bloc.dart';

@freezed
class ConfirmReservationEvent with _$ConfirmReservationEvent {
  const factory ConfirmReservationEvent.started() = _Started;
  const factory ConfirmReservationEvent.getUser() = _GetUser;
  const factory ConfirmReservationEvent.nameChanged(String name) =
      _OnNameChanges;
  const factory ConfirmReservationEvent.lastnameChanged(String lastname) =
      _OnLastnameChanges;
  const factory ConfirmReservationEvent.phoneChanged(String phone) =
      _OnPhoneChanges;
  const factory ConfirmReservationEvent.emailChanged(String email) =
      _OnEmailChanges;
  const factory ConfirmReservationEvent.villeChanged(String ville) =
      _OnVilleChanged;
  const factory ConfirmReservationEvent.specialConditionsChanges(
      String adresse) = _OnSpecialConditionsChanges;
  const factory ConfirmReservationEvent.confirmReservation() =
      _ConfirmReservation;
  const factory ConfirmReservationEvent.validInformations() =
      _ValidInformations;
  const factory ConfirmReservationEvent.onTermsAndConditionsChecked(
      bool? termsAndConditions) = _OnTermsAndConditionsChecked;
  const factory ConfirmReservationEvent.onOfflinechecked() = _OnOfflineChecked;
  const factory ConfirmReservationEvent.onOnlinechecked() = _OnOnlineChecked;
  const factory ConfirmReservationEvent.doCheckout() = _DoCheckout;
  const factory ConfirmReservationEvent.setParams(
      String code, String customerID) = _setParams;
}
