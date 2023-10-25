part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.setLoggedIn() = _SetLoggedIn;
  const factory AppEvent.setLoggedOut() = _SetLoggedOut;
  const factory AppEvent.getUser() = _GetUser;
}
