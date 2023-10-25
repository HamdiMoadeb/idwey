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
    on<_GetListWaitingBookingList>(_getWaitingBookingList);
    on<_GetListCanceledBookingList>(_getCanceledBookingList);
    on<_GetLisAcceptedBookingList>(_getAcceptedBookingList);
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

  /// get canceled booking list from booking liste
  /// filter from state.booking list where status is canceled

  void _getCanceledBookingList(
      _GetListCanceledBookingList event, Emitter<BookingPageState> emit) {
    final List<BookingDto> canceledBookingList = state.bookingList!
        .where((element) => element.status == 'canceled')
        .toList();
    emit(state.copyWith(
      canceledBookingList: canceledBookingList,
    ));
  }

  /// get waiting booking list from booking liste
  /// filter from state.booking list where status is waiting

  void _getWaitingBookingList(
      _GetListWaitingBookingList event, Emitter<BookingPageState> emit) {
    final List<BookingDto> waitingBookingList = state.bookingList!
        .where((element) => element.status == 'waiting')
        .toList();
    emit(state.copyWith(
      waitingBookingList: waitingBookingList,
    ));
  }

  /// get accepted booking list from booking liste
  /// filter from state.booking list where status is accepted

  void _getAcceptedBookingList(
      _GetLisAcceptedBookingList event, Emitter<BookingPageState> emit) {
    final List<BookingDto> acceptedBookingList = state.bookingList!
        .where((element) => element.status == 'accepted')
        .toList();
    emit(state.copyWith(
      confirmedBookingList: acceptedBookingList,
    ));
  }
}
