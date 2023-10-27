part of 'booking_page_bloc.dart';

@freezed
class BookingPageEvent with _$BookingPageEvent {
  const factory BookingPageEvent.getBookingList(int id) = _GetBookingList;
}
