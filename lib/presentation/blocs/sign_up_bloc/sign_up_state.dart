part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    StateStatus? status,
    String? email,
    String? password,
    String? confirmPassword,
    String? firstName,
    bool? isValid,
    String? errorText,
  }) = _SignUpState;

  factory SignUpState.initial() => const SignUpState(
      status: StateStatus.init,
      email: '',
      password: '',
      confirmPassword: '',
      firstName: '',
      isValid: null,
      errorText: "");
}
