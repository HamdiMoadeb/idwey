import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/domain/usecases/check_host_availability.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationState.initial()) {
    on<_GetUser>(getUser);
    on<_CheckAvailability>(checkHostAvailability);
    on<_OnSelectDates>(onSelectDates);
  }

  void getUser(_GetUser event, Emitter<ReservationState> emit) async {
    SharedPreferences? prefs;
    prefs = await SharedPreferences.getInstance();
    String? token = prefs!.getString('token');
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      print("decodedToken");
      print(decodedToken);
      emit(ReservationState(
          name: decodedToken['first_name'],
          email: decodedToken['email'],
          lastname: decodedToken['last_name'],
          phone: decodedToken['phone']));
    }
  }

  void checkHostAvailability(
      _CheckAvailability event, Emitter<ReservationState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    try {
      final result = await GetIt.I<CheckHostAvailabilityUseCase>().call({
        'id': event.id,
        'checkIn': state.checkIn,
        'checkOut': state.checkOut,
        'adults': int.parse(event.adults),
        'children': int.parse(event.children),
      });
      result.fold((l) async {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }, (r) async {
        emit(state.copyWith(
          status: StateStatus.success,
          available: r['disponible'] ?? false,
          totalPrice: r['price'].toString() ?? "",
        ));
      });
    } on Exception catch (_) {
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  initStatus() {
    emit(state.copyWith(status: StateStatus.init));
  }

  void onSelectDates(
      _OnSelectDates event, Emitter<ReservationState> emit) async {
    emit(state.copyWith(
      checkIn: event.startDate,
      checkOut: event.endDate,
      nbNights: event.nbNights,
    ));
  }
}
