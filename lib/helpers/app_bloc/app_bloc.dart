import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<_SetLoggedIn>(setLoggedIn);
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
}
