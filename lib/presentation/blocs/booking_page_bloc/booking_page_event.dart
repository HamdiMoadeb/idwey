part of 'booking_page_bloc.dart';

@freezed
class BookingPageEvent with _$BookingPageEvent {
  const factory BookingPageEvent.getBookingList(int id) = _GetBookingList;
  const factory BookingPageEvent.getBookingDetail(int id) = _GetBookingDetail;
  const factory BookingPageEvent.getListWaitingBookingList() =
      _GetListWaitingBookingList;
  const factory BookingPageEvent.getListCanceledBookingList() =
      _GetListCanceledBookingList;

  const factory BookingPageEvent.getListAcceptedBookingList() =
      _GetLisAcceptedBookingList;
}
