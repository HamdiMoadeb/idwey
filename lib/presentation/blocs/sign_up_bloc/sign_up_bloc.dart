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

  bool isEmailValid(String email) {
    // Define a regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    return emailRegExp.hasMatch(email);
  }

  /// on set email
  void setEmail(_SetEmail event, Emitter<SignUpState> emit) {
    bool isValid = event.password.isNotEmpty && isEmailValid(event.password);
    emit(state.copyWith(email: event.password, isValid: isValid));
  }

  bool isPasswordValid(String password) {
    // Define your password criteria here
    // For example, let's require a minimum length of 8 characters
    if (password.length < 8) {
      return false;
    }

    // You can add more criteria, such as requiring at least one uppercase letter,
    // one lowercase letter, one digit, and one special character.

    // Example: Require at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return false;
    }

    // Example: Require at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      return false;
    }

    // Example: Require at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    // Example: Require at least one special character (e.g., !@#%^&)
    if (!password.contains(RegExp(r'[!@#%^&]'))) {
      return false;
    }

    // If all criteria are met, the password is considered valid
    return true;
  }

  /// on set password

  void setPassword(_SetPassword event, Emitter<SignUpState> emit) {
    bool isValid = event.email.isNotEmpty && isPasswordValid(event.email);
    emit(state.copyWith(password: event.email, isValid: true));
  }

  /// on set confirm password

  void setConfirmPassword(
      _SetConfirmPassword event, Emitter<SignUpState> emit) {
    bool isValid = event.email == state.password;
    emit(state.copyWith(confirmPassword: event.email, isValid: isValid));
  }

  /// on set first name

  void setFirstName(_SetFirstName event, Emitter<SignUpState> emit) {
    emit(state.copyWith(firstName: event.email, isValid: true));
  }

  /// sign up method

  void signUp() {
    /// call api
  }
}
