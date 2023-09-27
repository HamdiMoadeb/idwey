import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/app_router/app_router.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/domain/usecases/login_usecase.dart';
import 'package:idwey/helpers/app_bloc/app_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    on<_SetEmail>(onChangeEmail);
    on<_SetPassword>(onChangePassword);
    on<_SignIn>(onSignIn);
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

  /// on sign in

  void onSignIn(_SignIn event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: StateStatus.loading));
    try {
      Map<String, dynamic> body = {
        'email': state.email,
        'password': state.password,
      };
      final Either<Exception, Map<String, dynamic>> response =
          await GetIt.I<LoginUseCase>().call(body);

      response.fold((l) {
        emit(state.copyWith(status: StateStatus.error));
      }, (r) {
        if (r['error'] == true) {
          emit(state.copyWith(
              status: StateStatus.error,
              errorText: r['messages']['message_error'][0]));
        } else {
          emit(state.copyWith(status: StateStatus.success));
          GetIt.I<AppRouter>().popUntilRoot();
          GetIt.I<AppBloc>().add(const AppEvent.setLoggedIn());
        }
      });
    } catch (e) {
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  initStatus() {
    emit(state.copyWith(status: StateStatus.init));
  }
}
