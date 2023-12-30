import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/domain/usecases/register_usecase.dart';
import 'package:idwey/utils/form_utils.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial()) {
    on<_SetEmail>(setEmail);
    on<_SetPassword>(setPassword);
    on<_SetConfirmPassword>(setConfirmPassword);
    on<_SetFirstName>(setFirstName);
    on<_SignUp>(onSignUp);
  }

  /// on set email
  void setEmail(_SetEmail event, Emitter<SignUpState> emit) {
    bool isValid =
        event.password.isNotEmpty && FormsUtils().isEmailValid(event.password);

    print("emaaail validation");
    print(isValid == true);
    if (isValid == true) {
      emit(state.copyWith(email: event.password, isValid: isValid));
    } else {
      emit(state.copyWith(isValid: isValid));
    }

    print("state.email");
    print(state.email?.isEmpty == true);
    print(state.email == null);
  }

  /// on set password

  void setPassword(_SetPassword event, Emitter<SignUpState> emit) {
    bool isValid =
        event.email.isNotEmpty && FormsUtils().isPasswordValid(event.email);
    print("isValid");
    print(isValid);
    if (isValid) {
      emit(state.copyWith(password: event.email, isValid: isValid));
    } else {
      emit(state.copyWith(isValid: isValid));
    }
  }

  /// on set confirm password

  void setConfirmPassword(
      _SetConfirmPassword event, Emitter<SignUpState> emit) {
    bool isValid = event.email == state.password;
    print("isValidconfirmpassword");
    print(isValid);
    if (isValid) {
      emit(state.copyWith(confirmPassword: event.email, isValid: isValid));
    } else {
      emit(state.copyWith(isValid: isValid));
    }
    print(state.isValid);
    print(state.password);
  }

  /// on set first name

  void setFirstName(_SetFirstName event, Emitter<SignUpState> emit) {
    emit(state.copyWith(firstName: event.email, isValid: true));
  }

  /// sign up method

  /// sign up

  void onSignUp(_SignUp event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    print('1111');
    try {
      Map<String, dynamic> body = {
        "first_name": state.firstName,
        "last_name": state.firstName,
        "email": state.email,
        "password": state.password,
        "term": 1
      };
      final Either<Exception, Map<String, dynamic>> response =
          await GetIt.I<RegisterUseCase>().call(jsonDecode(jsonEncode(body)));
      print('222222');
      response.fold((l) {
        emit(state.copyWith(status: StateStatus.error));
      }, (r) async {
        if (r['error'] == true) {
          emit(state.copyWith(
              status: StateStatus.error, errorText: r['messages']['email'][0]));
        } else {
          emit(state.copyWith(status: StateStatus.success));
          //GetIt.I<AppRouter>().push(const DashboardRoute());
        }
      });
    } catch (e) {
      emit(state.copyWith(
          status: StateStatus.error, errorText: "Veuillez réssayer plus tard"));
    }
  }

  initStatus() {
    emit(state.copyWith(status: StateStatus.init));
  }
}
