part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    String? title,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        title: "Home",
      );
}
