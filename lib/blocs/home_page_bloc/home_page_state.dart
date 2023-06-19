part of 'home_page_bloc.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    List<Host>? listHosts,
    StateStatus? status,
    String? currentImage,
    Map? currencies,
  }) = _HostState;

  factory HomePageState.initial() => const HomePageState(
        listHosts: [],
        currencies: {},
        status: StateStatus.init,
      );
}
