part of 'booking_page_bloc.dart';

@freezed
class BookingPageState with _$BookingPageState {
  const factory BookingPageState({
    StateStatus? status,
    List<BookingDto>? bookingList,
    List<BookingDto>? waitingBookingList,
    List<BookingDto>? canceledBookingList,
    List<BookingDto>? confirmedBookingList,
    List<BookingDto>? paidBookingList,
  }) = _BookingPageState;

  factory BookingPageState.initial() => const BookingPageState(
        status: StateStatus.init,
        bookingList: [],
        waitingBookingList: [],
        canceledBookingList: [],
        confirmedBookingList: [],
        paidBookingList: [],
      );
}
