import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:idwey/constants/enums.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    on<_SetEmail>(setEmail);
    on<_SetPassword>(setPassword);
    on<_SetConfirmPassword>(setConfirmPassword);
    on<_SetFirstName>(setFirstName);
  }

  /// on set email
  void setEmail(_SetEmail event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
        email: event.password, isValid: event.password.isNotEmpty));
  }

  /// on set password

  void setPassword(_SetPassword event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.email, isValid: true));
  }

  /// on set confirm password

  void setConfirmPassword(
      _SetConfirmPassword event, Emitter<SignUpState> emit) {
    emit(state.copyWith(confirmPassword: event.email, isValid: true));
  }

  /// on set first name

  void setFirstName(_SetFirstName event, Emitter<SignUpState> emit) {
    emit(state.copyWith(firstName: event.email, isValid: true));
  }
}
