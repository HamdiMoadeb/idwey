part of 'host_detail_cubit.dart';

@freezed
class HostDetailState with _$HostDetailState {
  const factory HostDetailState({
    HostDetail? hostDetail,
    StateStatus? status,
  }) = _HostDetailState;

  factory HostDetailState.initial() => const HostDetailState(
        hostDetail: null,
        status: StateStatus.init,
        //failure: null,
      );
}
