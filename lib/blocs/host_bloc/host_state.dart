part of 'host_bloc.dart';

@freezed
class HostState with _$HostState {
  const factory HostState({
    List<Host>? listHosts,
    StateStatus? status,
    ListHost? listHost,
    Map? currencies,
    HostDetail? hostDetail,
    String? currentImage,
  }) = _HostState;

  factory HostState.initial() => const HostState(
        listHosts: [],
        status: StateStatus.init,
        listHost: null,
        currencies: {},
        hostDetail: null,
        currentImage: "",
      );
}
