part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.setLoggedIn() = _SetLoggedIn;
  const factory AppEvent.setLoggedOut() = _SetLoggedOut;
  const factory AppEvent.getUser() = _GetUser;
  const factory AppEvent.updateUser(Map<String, dynamic> body) = _UpdateUser;
  const factory AppEvent.uploadImage(Map<String, dynamic> body) = _UploadImage;
  const factory AppEvent.logout() = _Logout;
}
