part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.setEmail(String password) = _SetEmail;
  const factory SignUpEvent.setPassword(String email) = _SetPassword;
  const factory SignUpEvent.setConfirmPassword(String email) =
      _SetConfirmPassword;
  const factory SignUpEvent.setFirstName(String email) = _SetFirstName;
}
