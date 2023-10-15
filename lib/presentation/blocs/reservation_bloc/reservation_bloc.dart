import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/event_details_dto.dart';
import 'package:idwey/data/models/extra_price_dto.dart';
import 'package:idwey/data/models/room_dto.dart';
import 'package:idwey/domain/usecases/check_host_availability.dart';
import 'package:idwey/domain/usecases/confirm_reservation_usecase.dart';
import 'package:idwey/presentation/blocs/confirm_reservation_bloc/confirm_reservation_bloc.dart';
import 'package:intl/intl.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationState.initial()) {
    on<_CheckAvailability>(checkHostAvailability);
    on<_OnSelectDates>(onSelectDates);
    on<_OnSelectGuests>(onSelectGuests);
    on<_setParams>(setParams);
    on<_ConfirmReservation>(addToCart);
    on<_OnSelectChalet>(onSelectRoom);
    on<_OnUnSelectChalet>(onUnSelectRoom);
    on<_InitStatus>(initStatus);
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
        print("r['disponible']");
        print(r);
        if (state.typeHost == "Par Chalet") {
          List<dynamic> list = json.decode(jsonEncode(r));
          print(list);
          List<Room> rooms = list.map((data) => Room.fromJson(data)).toList();
          print(rooms);
          emit(state.copyWith(
              status: StateStatus.success,
              availableChalet: rooms,
              available: null));
        } else {
          emit(state.copyWith(
            status: StateStatus.success,
            available: r['disponible'] ?? false,
            totalPrice: r['price'].toString() ?? "",
          ));

          print("state.available");
          print(state.available);
          if (state.available == true) {
            emit(state.copyWith(
              errorText: "",
            ));
          } else {
            emit(state.copyWith(
              errorText: "Cette date n'est pas disponible",
            ));
          }
        }
      });
    } on Exception catch (_) {
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  initStatus(_InitStatus event, Emitter<ReservationState> emit) {
    print("initStatus");
    emit(state.copyWith(status: StateStatus.init));
    print("state.status");
    print(state.status);
  }

  void onSelectDates(
      _OnSelectDates event, Emitter<ReservationState> emit) async {
    emit(state.copyWith(
      checkIn: event.startDate,
      checkOut: event.endDate,
      nbNights: event.nbNights,
      totalPrice: (double.parse(state.price!) * int.parse(event.nbNights))
          .toInt()
          .toString(),
    ));
  }

  void onSelectGuests(
      _OnSelectGuests event, Emitter<ReservationState> emit) async {
    emit(state.copyWith(
      guests: event.guests,
    ));
    print('*************');
    print(state.totalPrice);
    print(state.guests);
  }

  ///set params
  void setParams(_setParams event, Emitter<ReservationState> emit) async {
    emit(state.copyWith(
      id: event.id,
      url: event.url,
      title: event.title,
      address: event.address,
      typeHost: event.typeHost,
      salePrice: event.salePrice,
      perPerson: event.perPerson,
      minNuits: event.minNuits,
      price: event.price,
      extraPrice: event.extraPrice,
      totalPrice: double.parse(event.salePrice ?? "0.00").toInt().toString(),
    ));
  }

  void addToCart(
      _ConfirmReservation event, Emitter<ReservationState> emit) async {
    emit(state.copyWith(
        addToCartStatus: StateStatus.loading, status: StateStatus.init));
    //  try {
    print({
      "start_date": state.checkIn,
      "end_date": state.checkOut,
      "adults": state.guests,
      "children": 0,
      "extra_price":
          state.extraPrice?.map((extraPrice) => extraPrice.toJson()).toList(),
      "rooms": state.selectedRooms,
      "promo_code": "",
      "service_id": state.id,
      "service_type": "host"
    });
    final result = await GetIt.I<ConfirmReservationUseCase>().call({
      "start_date": state.checkIn,
      "end_date": state.checkOut,
      "adults": state.guests,
      "children": 0,
      "extra_price":
          state.extraPrice?.map((extraPrice) => extraPrice.toJson()).toList(),
      "rooms": state.selectedRooms,
      "promo_code": "",
      "service_id": state.id,
      "service_type": "host"
    });

    result.fold((l) async {
      print("confirm reservation llllllllll");
      emit(state.copyWith(
        addToCartStatus: StateStatus.error,
      ));
    }, (r) async {
      print("confirm reservation");
      print(r);
      emit(state.copyWith(
        addToCartStatus: StateStatus.success,
      ));
      GetIt.I<AppRouter>().push(ConfirmReservationRoute(
        typeReservation: TypeReservation.host,
        url: state.url ?? "",
        hostName: state.title,
        dateDebut: state.checkIn ?? "",
        dateFin: state.checkOut ?? "",
        adultes: state.guests.toString() ?? "",
        total: state.totalPrice == ""
            ? double.parse(state.salePrice ?? "").toInt().toString()
            : state.totalPrice.toString(),
        nuits: state.nbNights ?? "",
        id: state.id.toString(),
        address: state.address,
        rooms: state.selectedRoomsObject,
        code: r['booking']['code'],
        customerId: "",
        // selectedRooms: selectedRooms,
      ));
    });

    // } catch (e) {
    //   emit(state.copyWith(
    //     addToCartStatus: StateStatus.error,
    //   ));
    // }
  }

  void onSelectRoom(
      _OnSelectChalet event, Emitter<ReservationState> emit) async {
    // Create a new list with the updated values
    final updatedExtraPrice = List<int>.from(state.selectedRooms ?? []);
    final updatedRooms = List<Room>.from(state.selectedRoomsObject ?? []);
    updatedExtraPrice.add(event.chalet.id ?? 0);
    updatedRooms.add(event.chalet);

    // Update the state with the new list
    emit(state.copyWith(
        selectedRooms: updatedExtraPrice, selectedRoomsObject: updatedRooms));

    print("state.extraPrice");
    print(updatedExtraPrice); // Print the updated list
  }

  void onUnSelectRoom(
      _OnUnSelectChalet event, Emitter<ReservationState> emit) async {
    // Create a new list with the updated values
    final updatedExtraPrice = List<int>.from(state.selectedRooms ?? []);
    final updatedRooms = List<Room>.from(state.selectedRoomsObject ?? []);
    updatedExtraPrice.remove(event.chalet.id);
    updatedRooms.remove(event.chalet);

    // Update the state with the new list
    emit(state.copyWith(
        selectedRooms: updatedExtraPrice, selectedRoomsObject: updatedRooms));

    print("state.extraPrice");
    print(updatedExtraPrice); // Print the updated list
  }
}
