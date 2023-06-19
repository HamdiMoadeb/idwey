// import 'dart:async';
// import 'dart:convert';
//
// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:idwey/utils/constants.dart';
// import 'package:idwey/utils/enums.dart';
// import 'package:idwey/utils/urls.dart';
// import 'package:http/http.dart' as http;
// import 'package:idwey/models/models.dart';
// part 'host_event.dart';
// part 'host_bloc.freezed.dart';
// part 'host_state.dart';
//
// class HostBloc extends Bloc<HostEvent, HostState> {
//   HostBloc() : super(HostState.initial()) {
//     on<GetAllHosts>(getAllHosts);
//     on<GetHostDetails>(getHostDetails);
//   }
//
//   void getAllHosts(GetAllHosts event, Emitter<HostState> emit) async {
//     try {
//       var url = Uri.parse('${Urls.URL_API}hotel/listHost');
//       var response = await http.get(url);
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       emit(state.copyWith(status: StateStatus.loading, listHost: ListHost()));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         print("data:${data}");
//         final list = ListHost.fromJson(data);
//         currencies['EUR']['value'] = list.eur;
//         currencies['USD']['value'] = list.usd;
//         print("currencies:${currencies}");
//         emit(state.copyWith(
//             listHosts: list.rows,
//             status: StateStatus.success,
//             listHost: list,
//             currencies: currencies));
//       }
//     } on Exception catch (_) {
//       print("test error");
//
//       emit(state.copyWith(
//         status: StateStatus.error,
//       ));
//     }
//   }
//
//   void getHostDetails(GetHostDetails event, Emitter<HostState> emit) async {
//     try {
//       var url = Uri.parse('${Urls.URL_API}hotel/detail/${event.id}');
//       var response = await http.get(url);
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       emit(state.copyWith(status: StateStatus.loading, listHost: ListHost()));
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         print("data:${data}");
//         final hostDetail = HostDetail.fromJson(data);
//         emit(state.copyWith(
//           hostDetail: hostDetail,
//           status: StateStatus.success,
//         ));
//       }
//     } on Exception catch (_) {
//       print("test error");
//       emit(state.copyWith(
//         status: StateStatus.error,
//       ));
//     }
//   }
// }
