import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/domain/usecases/add_review_usecase.dart';
import 'package:idwey/domain/usecases/get_rate_settings_usecase.dart';
import 'package:idwey/domain/usecases/update_review_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_review_bloc.freezed.dart';
part 'add_review_event.dart';
part 'add_review_state.dart';

class AddReviewBloc extends Bloc<AddReviewEvent, AddReviewState> {
  AddReviewBloc() : super(AddReviewState.initial()) {
    on<AddReview>(addReview);
    on<SetParams>(setParams);
    on<SetRate>(setRate);
    on<SetComment>(setComment);
    on<GetRateSettings>(getRateSettings);
    on<SetRateSettings>(setRateSettings);
    on<UpdateReview>(updateReview);
    on<UpdateRate>(updateRate);
    on<UpdateRateSettings>(updateRateSettings);
  }
  void setParams(SetParams event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(
      serviceID: event.id,
      serviceType: event.type,
    ));
  }

  void setRate(SetRate event, Emitter<AddReviewState> emit) async {
    List<Map<String, dynamic>> rates = state.rates ?? [];

    bool isExist = false;
    for (int i = 0; i < rates.length; i++) {
      if (rates[i]["title"] == event.title) {
        isExist = true;
        rates[i]["rate"] = event.rate;
      }
    }

    emit(
      state.copyWith(
        rates: isExist
            ? rates
            : [
                ...rates,
                {"title": event.title, "rate": event.rate}
              ],
      ),
    );
  }


  void updateRate(UpdateRate event, Emitter<AddReviewState> emit) async {
    print("state.rates");
    print(state.ratesStars);
    List<Map<String, dynamic>> updatesRates = List.from(state.ratesStars ?? []);
    /// updatesRates = state.rates ?? [];
    for (int i = 0; i < updatesRates.length; i++) {
      if (updatesRates[i]["title"] == event.title) {
        updatesRates[i]["stars"] = event.rate;
      }
    }

    print("updatesRates");
    print(updatesRates);

    emit(
      state.copyWith(
        ratesStars: updatesRates,
      ),
    );

    print("state.rates");
    print(state.rates);
  }

  void setComment(SetComment event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(
      review: event.comment,
    ));
    print(state.review);
  }

  void getRateSettings(
      GetRateSettings event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(
      statusRateSettings: StateStatus.loading,
    ));
    print("state.serviceID");
    print(state.serviceID);

    try {
      final Either<Exception, dynamic> result =
          await GetIt.I<GetRateSettingsUseCase>()
              .call(state.serviceType ?? "host")
              .then((value) {
        return value;
      });
      print("result");
      print(result);
      result.fold((Exception failure) {
        emit(state.copyWith(
          statusRateSettings: StateStatus.error,
        ));
      },
          (dynamic success) => {
                emit(state.copyWith(
                  statusRateSettings: StateStatus.success,
                  ratesStars: jsonDecode(jsonEncode(success))
                      .cast<Map<String, dynamic>>(),
                )),
                print("state.ratesStars"),
                print(state.ratesStars),
              });
    } catch (e) {
      emit(state.copyWith(
        statusRateSettings: StateStatus.error,
      ));
    }
  }

  void addReview(AddReview event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String userId = preferences.getString("userId") ?? "0";
    try {
      final Either<Exception, dynamic> result =
          await GetIt.I<AddReviewUseCase>().call({
        "review_service_type": state.serviceType ?? "",
        "review_service_id": state.serviceID ?? "",
        "customer_id": userId,
        "review_content": state.review ?? "",
        "review_stats": state.rates ?? [],
      });
      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      },
          (success) => {
                emit(state.copyWith(
                  status: StateStatus.success,
                )),
              });
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }
  }

  void setRateSettings(
      SetRateSettings event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(
      ratesStars: event.listRates,
    ));
    print("state.ratesStars");
    print(state.ratesStars);
  }

  void updateReview(UpdateReview event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(
      updateReviewStatus: StateStatus.loading,
    ));
    print("updaaate review");

    try {
      final Either<Exception, dynamic> result =
          await GetIt.I<UpdateReviewUseCase>().call({
        "review_id": state.serviceID ?? "",
        "review_content": state.review ?? "",
        "review_stats": state.ratesStars ?? []
      });

      result.fold((Exception failure) {
        print("failure$failure");
        emit(state.copyWith(
          updateReviewStatus: StateStatus.error,
        ));
      },
          (success) => {
                emit(state.copyWith(
                  updateReviewStatus: StateStatus.success,
                )),
              });
    } catch (e) {
      emit(state.copyWith(
        updateReviewStatus: StateStatus.error,
      ));
    }
  }


  updateRateSettings(UpdateRateSettings event, Emitter<AddReviewState> emit) async {
    emit(state.copyWith(
      ratesStars: event.listRates,
    ));
    print("state.ratesStars");
    print(state.ratesStars);
  }
}
