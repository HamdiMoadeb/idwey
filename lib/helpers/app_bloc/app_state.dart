part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    StateStatus? status,
    bool? isLoggedIn,
  }) = _AppState;

  factory AppState.initial() => const AppState(
        status: StateStatus.init,
        isLoggedIn: false,
      );
}
