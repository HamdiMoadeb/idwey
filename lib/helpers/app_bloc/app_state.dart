part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    StateStatus? status,
    bool? isLoggedIn,
    String? name,
    String? lastname,
    String? email,
    String? phone,
    String? id,
  }) = _AppState;

  factory AppState.initial() => const AppState(
        status: StateStatus.init,
        isLoggedIn: false,
        name: "",
        lastname: "",
        email: "",
        phone: "",
        id: "",
      );
}
