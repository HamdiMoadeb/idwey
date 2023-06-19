part of 'host_page_cubit.dart';

@freezed
class HostPageState with _$HostPageState {
  const factory HostPageState({
    StateStatus? status,
    List<Host>? listHosts,
    List<Term>? listConvience,
    List<Term>? listHotelService,
    List<Term>? listPropertyType,
    List<int>? terms,
    bool? loading,
    bool? showFAB,
    int? listLengthFromLastCall,
    int? totalNb,
    double? max,
    double? min,
    double? lowerValue,
    HostPage? hostPage,
    double? upperValue,
    bool? showAllConv,
    bool? showAllProp,
    bool? showAllHotel,
  }) = _HostDetailState;

  factory HostPageState.initial() => const HostPageState(
      status: StateStatus.init,
      listHosts: [],
      listConvience: [],
      listHotelService: [],
      listPropertyType: [],
      terms: [],
      loading: false,
      showFAB: false,
      showAllConv: false,
      showAllHotel: false,
      showAllProp: false,
      upperValue: 0,
      lowerValue: 0,
      hostPage: null,
      min: 0,
      max: 0,
      listLengthFromLastCall: 0,
      totalNb: 0
      //failure: null,
      );
}
