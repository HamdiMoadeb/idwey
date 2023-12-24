part of 'confirm_reservation_bloc.dart';

@freezed
class ConfirmReservationState with _$ConfirmReservationState {
  const factory ConfirmReservationState({
    StateStatus? status,
    StateStatus? checkoutStatus,
    String? name,
    String? lastname,
    String? email,
    String? phone,
    String? checkIn,
    String? checkOut,
    bool? available,
    String? totalPrice,
    String? nbNights,
    int? guests,
    bool? termsAndConditions,
    bool? offline,
    bool? online,
    bool? validInformations,
    String? ville,
    String? specialConditions,
    String? code,
    String? customerID,
    String? paymentRef,
  }) = _ConfirmReservationState;

  factory ConfirmReservationState.initial() => ConfirmReservationState(
        status: StateStatus.init,
        checkoutStatus: StateStatus.init,
        name: "",
        lastname: "",
        email: "",
        phone: "",
        checkIn: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        checkOut: DateFormat('dd/MM/yyyy')
            .format(DateTime.now().add(Duration(days: 1))),
        available: false,
        totalPrice: "",
        nbNights: "",
        guests: 0,
        termsAndConditions: false,
        offline: false,
        online: false,
        validInformations: null,
        ville: "",
        specialConditions: "",
        code: "",
        customerID: "",
        paymentRef: "",
      );
}
