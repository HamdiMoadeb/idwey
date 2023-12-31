import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/domain/usecases/delete_user_account_usecase.dart';
import 'package:idwey/domain/usecases/update_user_usecase.dart';
import 'package:idwey/domain/usecases/upload_image_usecase.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<_SetLoggedIn>(setLoggedIn);
    on<_GetUser>(getUser);
    on<_UpdateUser>(updateUser);
    on<_UploadImage>(uploadImage);
    on<_Logout>(logout);
  }

  void setLoggedIn(_SetLoggedIn event, Emitter<AppState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = prefs.getString("token");
    if (user == null) {
      emit(state.copyWith(isLoggedIn: false));
    } else {
      emit(state.copyWith(isLoggedIn: true));
    }
  }

  void getUser(_GetUser event, Emitter<AppState> emit) async {
    SharedPreferences? prefs;
    try {
      emit(state.copyWith(status: StateStatus.loading));
      prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token != null) {
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

        await prefs.setString("userId", decodedToken['id'].toString());

        emit(state.copyWith(
            status: StateStatus.success,
            name: decodedToken['first_name'],
            email: decodedToken['email'],
            lastname: decodedToken['last_name'],
            id: decodedToken['id'].toString(),
            imageUrl: decodedToken['image_url'] is String == true
                ? decodedToken['image_url'] ?? ""
                : "",
            phone: decodedToken['phone']));
      }
    } catch (e) {
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  void updateUser(_UpdateUser event, Emitter<AppState> emit) async {
    SharedPreferences? prefs;

    try {
      emit(state.copyWith(updateUserStatus: StateStatus.loading));
      prefs = await SharedPreferences.getInstance();
      final result = await GetIt.I<UpdateUserUseCase>().call(event.body);
      result.fold((l) {
        emit(state.copyWith(updateUserStatus: StateStatus.error));
      }, (r) {
        emit(state.copyWith(updateUserStatus: StateStatus.success));

        Map<String, dynamic> decodedToken = JwtDecoder.decode(r);
        prefs!.setString("token", r);
        emit(state.copyWith(
          updateUserStatus: StateStatus.success,
          name: event.body["first_name"] ?? state.name,
          email: event.body["email"] ?? state.email,
          lastname: event.body["last_name"] ?? state.lastname,
          id: event.body["id"] ?? state.id,
          phone: event.body["phone"] ?? state.phone,
          imageUrl: decodedToken['image_url'] is String == true
              ? decodedToken['image_url'] ?? ""
              : "",
        ));

        GetIt.I<AppBloc>().add(const _GetUser());
      });
    } catch (e) {
      emit(state.copyWith(updateUserStatus: StateStatus.error));
    }
  }

  /// upload image

  void uploadImage(_UploadImage event, Emitter<AppState> emit) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));

      Map<String, dynamic> body = {
        "image": event.body["file"],
        "id": state.id,
      };

      final result = await GetIt.I<UploadImageUseCase>().call(body);
      result.fold((l) {
        emit(state.copyWith(status: StateStatus.error));
      }, (r) {
        emit(state.copyWith(status: StateStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(status: StateStatus.error));
    }
  }

  void logout(_Logout event, Emitter<AppState> emit) async {
    SharedPreferences? prefs;
    try {
      emit(state.copyWith(
          deleteUserStatus: StateStatus.loading, status: StateStatus.init));
      final result = await GetIt.I<DeleteUserUseCase>().call({});

      prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      emit(state.copyWith(deleteUserStatus: StateStatus.success));
    } catch (e) {
      emit(state.copyWith(deleteUserStatus: StateStatus.error));
    }
  }
}
