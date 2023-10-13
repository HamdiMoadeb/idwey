import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/domain/usecases/do_checkout_usecase.dart';
import 'package:idwey/utils/form_utils.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'confirm_reservation_event.dart';
part 'confirm_reservation_state.dart';
part 'confirm_reservation_bloc.freezed.dart';

class ConfirmReservationBloc
    extends Bloc<ConfirmReservationEvent, ConfirmReservationState> {
  ConfirmReservationBloc() : super(ConfirmReservationState.initial()) {
    on<_GetUser>(getUser);
    on<_OnNameChanges>(onNameChanged);
    on<_OnLastnameChanges>(onLastNameChanged);
    on<_OnPhoneChanges>(onPhoneChanged);
    on<_OnEmailChanges>(onEmailChanged);
    on<_OnVilleChanged>(onVilleChanged);
    on<_OnSpecialConditionsChanges>(onSpecialConditionsChanged);
    on<_ValidInformations>(onValidateInformations);
    on<_OnTermsAndConditionsChecked>(onTermsAndConditionsChecked);
    on<_OnOfflineChecked>(onOfflineChecked);
    on<_OnOnlineChecked>(onOnlineChecked);
    on<_DoCheckout>(doCheckout);
    on<_setParams>(setParams);
  }

  void getUser(_GetUser event, Emitter<ConfirmReservationState> emit) async {
    SharedPreferences? prefs;
    try {
      emit(state.copyWith(status: StateStatus.loading));
      prefs = await SharedPreferences.getInstance();
      String? token = prefs!.getString('token');
      if (token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        print("decodedToken");
        print(decodedToken);
        print(decodedToken['id'].toString());
        emit(state.copyWith(
            status: StateStatus.success,
            name: decodedToken['first_name'],
            email: decodedToken['email'],
            lastname: decodedToken['last_name'],
            customerID: decodedToken['id'].toString(),
            phone: decodedToken['phone']));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  initStatus() {
    emit(state.copyWith(
        status: StateStatus.init, checkoutStatus: StateStatus.init));
  }

  /// on name Changed

  void onNameChanged(
      _OnNameChanges event, Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(name: event.name));
  }

  /// on lastname Changed
  void onLastNameChanged(
      _OnLastnameChanges event, Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(lastname: event.lastname));
  }

  /// on phone Changed
  void onPhoneChanged(
      _OnPhoneChanges event, Emitter<ConfirmReservationState> emit) async {
    if (event.phone.isNotEmpty &&
        FormsUtils().isPhoneNumberValid(event.phone)) {
      emit(state.copyWith(phone: event.phone));
    }
  }

  ///  on email chnages

  void onEmailChanged(
      _OnEmailChanges event, Emitter<ConfirmReservationState> emit) async {
    if (event.email.isNotEmpty && FormsUtils().isEmailValid(event.email)) {
      emit(state.copyWith(email: event.email));
    }
  }

  void onSpecialConditionsChanged(_OnSpecialConditionsChanges event,
      Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(specialConditions: event.adresse));
  }

  void onVilleChanged(
      _OnVilleChanged event, Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(ville: event.ville));
  }

  void onValidateInformations(
      _ValidInformations event, Emitter<ConfirmReservationState> emit) async {
    if (state.name?.isNotEmpty == true &&
        state.lastname?.isNotEmpty == true &&
        state.phone?.isNotEmpty == true &&
        state.email?.isNotEmpty == true &&
        state.ville?.isNotEmpty == true) {
      emit(state.copyWith(validInformations: true));
    } else {
      emit(state.copyWith(validInformations: false));
    }
    print("state.validInformations");
    print(state.validInformations);
  }

  /// on online checked

  void onOnlineChecked(
      _OnOnlineChecked event, Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(online: true, offline: false));
  }

  /// on offline checked

  void onOfflineChecked(
      _OnOfflineChecked event, Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(online: false, offline: true));
  }

  /// on terms and conditions checked

  void onTermsAndConditionsChecked(_OnTermsAndConditionsChecked event,
      Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(termsAndConditions: event.termsAndConditions));
  }

  void doCheckout(
      _DoCheckout event, Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(checkoutStatus: StateStatus.loading));
    try {
      final result = await GetIt.I<DoCheckoutUseCase>().call({
        "code": state.code,
        "customer_id": state.customerID,
        "first_name": state.name,
        "last_name": state.lastname,
        "phone": state.phone,
        "email": state.email,
        "city": state.ville,
        "country": "TN",
        "customer_notes": state.specialConditions,
        "payment_gateway": "offline_payment"
      });

      result.fold((l) async {
        print("confirm reservation llllllllll");
        emit(state.copyWith(
          checkoutStatus: StateStatus.error,
        ));
      }, (r) async {
        print("confirm reservation");
        print(r);
        emit(state.copyWith(
          checkoutStatus: StateStatus.success,
        ));
      });
    } catch (e) {
      print(e);
      emit(state.copyWith(checkoutStatus: StateStatus.error));
    }
  }

  void setParams(
      _setParams event, Emitter<ConfirmReservationState> emit) async {
    emit(state.copyWith(
      code: event.code,
    ));
  }
}
