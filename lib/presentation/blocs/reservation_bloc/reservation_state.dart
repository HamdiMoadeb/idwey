part of 'reservation_bloc.dart';

@freezed
class ReservationState with _$ReservationState {
  const factory ReservationState({
    StateStatus? status,
    String? name,
    String? lastname,
    String? email,
    String? phone,
    String? checkIn,
    String? checkOut,
    bool? available,
    String? totalPrice,
    String? nbNights,
  }) = _ReservationState;

  factory ReservationState.initial() => const ReservationState(
        status: StateStatus.init,
        name: "",
        lastname: "",
        email: "",
        phone: "",
        checkIn: "",
        checkOut: "",
        available: false,
        totalPrice: "",
        nbNights: "",
      );
}
