import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/extra_price_dto.dart';
import 'package:idwey/data/models/room_dto.dart';
import 'package:idwey/domain/usecases/check_host_availability.dart';
import 'package:idwey/domain/usecases/confirm_reservation_usecase.dart';
import 'package:intl/intl.dart';

part 'reservation_bloc.freezed.dart';
part 'reservation_event.dart';
part 'reservation_state.dart';

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
        'type': event.type,
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
            if (event.type == TypeReservation.activity.toString()) {
              emit(state.copyWith(
                available: false,
                errorText: r["messages"] == []
                    ? 'une erreur est produite , veuillez réessayer ultérieurement'
                    : 'Le nombre minimum des invités est 7',
              ));
            } else {
              emit(state.copyWith(
                available: false,
                errorText: r["messages"] == []
                    ? 'une erreur est produite , veuillez réessayer ultérieurement'
                    : "Essayez de sélectionner une autre date. Cette date n'est pas disponible",
              ));
            }
          }
        }
      });
    } on Exception catch (_) {
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  initStatus(_InitStatus event, Emitter<ReservationState> emit) {
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
      totalPriceOnSale: state.salePrice == "null" ||
              state.salePrice == null ||
              state.salePrice == ""
          ? ""
          : (double.parse(state.salePrice ?? "0.00") *
                  int.parse(event.nbNights))
              .toInt()
              .toString(),
    ));
  }

  void onSelectGuests(
      _OnSelectGuests event, Emitter<ReservationState> emit) async {
    print('*************');
    print("event.guests${event.guests}");
    print("state.totalPrice${state.totalPrice}");
    print("state.totalPriceOnSale${state.totalPriceOnSale}");
    print("salePrice${state.salePrice}");
    print("price${state.price}");

    emit(state.copyWith(
      guests: event.guests,
    ));
    print('*************2222222');
    print("event.guests${state.guests}");
    emit(state.copyWith(
      totalPrice:
          (double.parse(state.price!) * state.guests!).toInt().toString(),
      totalPriceOnSale: state.salePrice == "null" ||
              state.salePrice == null ||
              state.salePrice == ""
          ? "0.00"
          : (double.parse(state.salePrice!) * state.guests!).toInt().toString(),
    ));
    print('*************');
    print(state.totalPrice);
    print(state.totalPriceOnSale);
    print(state.guests);
  }

  ///set params
  void setParams(_setParams event, Emitter<ReservationState> emit) async {
    print("setParams");
    print(event.price);
    print(event.salePrice);
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
      checkIn: event.checkIn,
      checkOut: event.checkOut,
      activityDuration: event.activityDuration,
      totalPrice: double.parse(event.price ?? "0.00").toInt().toString(),
      totalPriceOnSale:
          double.tryParse(event.salePrice ?? "0.00")?.toInt().toString(),
    ));

    print("state.totalPrice");
    print(state.totalPrice);
    print("state.totalPriceOnSale");
    print(state.totalPriceOnSale);
  }

  void addToCart(
      _ConfirmReservation event, Emitter<ReservationState> emit) async {
    emit(state.copyWith(
        addToCartStatus: StateStatus.loading, status: StateStatus.init));
    //  try {
    Map<String, dynamic> map = {};
    if (event.typeReservation == TypeReservation.host) {
      map = {
        "start_date": state.checkIn,
        "end_date": state.checkOut,
        "adults": state.guests,
        "children": 0,
        "extra_price":
            state.extraPrice?.map((extraPrice) => extraPrice.toJson()).toList(),
        "rooms": state.selectedRooms,
        "promo_code": "",
        "service_id": state.id,
        "service_type":
            event.typeReservation == TypeReservation.host ? "host" : "event"
      };
    } else if (event.typeReservation == TypeReservation.event) {
      map = {
        "start_date": state.checkIn,
        "number": state.guests,
        "extra_price": [],
        "promo_code": "",
        "service_id": state.id,
        "service_type": "event"
      };
    } else if (event.typeReservation == TypeReservation.activity) {
      map = {
        "start_date": state.checkIn,
        "end_date": state.checkOut,
        "adults": state.guests,
        "children": 0,
        "extra_price":
            state.extraPrice?.map((extraPrice) => extraPrice.toJson()).toList(),
        "rooms": state.selectedRooms,
        "promo_code": "",
        "service_id": state.id,
        "service_type": "activity"
      };
    } else if (event.typeReservation == TypeReservation.experience) {
      map = {
        "start_date": state.checkIn,
        "end_date": state.checkOut,
        "adults": state.guests,
        "children": 0,
        "extra_price":
            state.extraPrice?.map((extraPrice) => extraPrice.toJson()).toList(),
        "rooms": state.selectedRooms,
        "promo_code": "",
        "service_id": state.id,
        "service_type": "experience"
      };
    }

    final result = await GetIt.I<ConfirmReservationUseCase>().call(map);

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
        typeReservation: event.typeReservation,
        url: state.url ?? "",
        hostName: state.title,
        dateDebut: state.checkIn ?? "",
        dateFin: state.checkOut ?? "",
        adultes: state.guests.toString() ?? "",
        total: state.totalPrice == ""
            ? double.parse(state.price ?? "").toInt().toString()
            : state.totalPrice.toString(),
        totalOnSale: state.totalPriceOnSale == ""
            ? double.parse(state.salePrice ?? "").toInt().toString()
            : state.totalPriceOnSale.toString(),
        nuits: state.nbNights ?? "",
        id: state.id.toString(),
        address: state.address,
        rooms: state.selectedRoomsObject,
        code: r['booking']['code'],
        customerId: "",
        activityDuration: state.activityDuration,
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

  getServiceType(TypeReservation typeReservation) {
    if (typeReservation == TypeReservation.host) {
      return "host";
    } else if (typeReservation == TypeReservation.event) {
      return "event";
    } else if (typeReservation == TypeReservation.activity) {
      return "activity";
    }
  }
}
