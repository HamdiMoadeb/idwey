part of 'details_page_bloc.dart';

@freezed
class DetailsPageState with _$DetailsPageState {
  const factory DetailsPageState({
    String? title,
    StateStatus? status,
    HostDetails? hostDetails,
    List<ExtraPrice>? extraPrice,
    List<Map<String, dynamic>>? extraPriceObjet,
    double? extraPriceTotal,
  }) = _DetailsPageState;

  factory DetailsPageState.initial() => const DetailsPageState(
        title: "Home",
        status: StateStatus.init,
        hostDetails: null,
        extraPrice: [],
        extraPriceObjet: [],
        extraPriceTotal: 0.0,
      );
}
