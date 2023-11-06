import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/booking_dto.dart';
import 'package:idwey/domain/usecases/get_booking_list_usecase.dart';

part 'booking_page_event.dart';
part 'booking_page_state.dart';
part 'booking_page_bloc.freezed.dart';

class BookingPageBloc extends Bloc<BookingPageEvent, BookingPageState> {
  BookingPageBloc() : super(BookingPageState.initial()) {
    on<_GetBookingList>(getBookingList);
  }

  void getBookingList(
      _GetBookingList event, Emitter<BookingPageState> emit) async {
    try {
      emit(state.copyWith(
        status: StateStatus.loading,
      ));
      final Either<Exception, List<BookingDto>?> result =
          await GetIt.I<GetBookingListUseCase>().call({"id": event.id});
      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }, (List<BookingDto>? success) async {
        if (success != null) {
          emit(state.copyWith(
            status: StateStatus.success,
            bookingList: success,
          ));
          final List<BookingDto> canceledBookingList = [];
          final List<BookingDto> acceptedBookingList = [];
          final List<BookingDto> waitingBookingList = [];
          final List<BookingDto> paidBookingList = [];
          state.bookingList?.forEach((element) {
            if (element.status == 'cancelled') {
              canceledBookingList.add(element);
            }
          });
          state.bookingList?.forEach((element) {
            if (element.status == 'accepted') {
              acceptedBookingList.add(element);
            }
          });
          state.bookingList?.forEach((element) {
            if (element.status == 'waiting') {
              waitingBookingList.add(element);
            }
          });
          state.bookingList?.forEach((element) {
            if (element.status == 'paid') {
              paidBookingList.add(element);
            }
          });
          emit(state.copyWith(
            canceledBookingList: canceledBookingList,
            confirmedBookingList: acceptedBookingList,
            waitingBookingList: waitingBookingList,
            paidBookingList: paidBookingList,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
          ));
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
