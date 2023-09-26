part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.setEmail(String password) = _SetEmail;
  const factory SignInEvent.setPassword(String email) = _SetPassword;

  /// sign in
  const factory SignInEvent.signIn() = _SignIn;
}
