import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<GetUserRole>(_getUserRole);
  }

  _getUserRole(GetUserRole event, Emitter<HomeState> emit) {
    print("GetUserRole");
  }
}
