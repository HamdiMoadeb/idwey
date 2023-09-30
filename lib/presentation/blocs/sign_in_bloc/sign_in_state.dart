part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    StateStatus? status,
    bool? isValid,
    String? password,
    String? email,
    String? errorText,
  }) = _SignInState;

  factory SignInState.initial() => const SignInState(
      status: StateStatus.init,
      isValid: null,
      password: "",
      email: "",
      errorText: "");
}
