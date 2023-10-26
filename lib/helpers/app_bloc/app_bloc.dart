import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<_SetLoggedIn>(setLoggedIn);
    on<_GetUser>(getUser);
  }

  void setLoggedIn(_SetLoggedIn event, Emitter<AppState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString("token");
    if (user == null) {
      emit(state.copyWith(isLoggedIn: false));
    } else {
      emit(state.copyWith(isLoggedIn: true));
    }
  }

  void getUser(_GetUser event, Emitter<AppState> emit) async {
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
            id: decodedToken['id'].toString(),
            phone: decodedToken['phone']));
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(status: StateStatus.error));
    }
  }
}
