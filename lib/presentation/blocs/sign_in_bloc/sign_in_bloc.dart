import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idwey/constants/enums.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    on<_SetEmail>(onChangeEmail);
    on<_SetPassword>(onChangePassword);
  }

  /// on change password
  void onChangePassword(_SetPassword event, Emitter<SignInState> emit) {
    event.email.length >= 6 && event.email.length <= 20
        ? emit(state.copyWith(password: event.email, isValid: true))
        : emit(state.copyWith(password: event.email, isValid: false));
  }

  /// on change email

  void onChangeEmail(_SetEmail event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.password));
  }
}
