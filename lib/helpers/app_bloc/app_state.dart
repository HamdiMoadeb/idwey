part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState(
      {StateStatus? status,
      StateStatus? updateUserStatus,
      StateStatus? deleteUserStatus,
      bool? isLoggedIn,
      String? name,
      String? lastname,
      String? email,
      String? phone,
      String? id,
      String? imageUrl}) = _AppState;

  factory AppState.initial() => const AppState(
      status: StateStatus.init,
      updateUserStatus: StateStatus.init,
      deleteUserStatus: StateStatus.init,
      isLoggedIn: false,
      name: "",
      lastname: "",
      email: "",
      phone: "",
      id: "",
      imageUrl: "");
}
