import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/article_dto.dart';
import 'package:idwey/domain/usecases/get_list_articles_usecase.dart';

part 'inspiration_event.dart';
part 'inspiration_state.dart';
part 'inspiration_bloc.freezed.dart';

class InspirationBloc extends Bloc<InspirationEvent, InspirationState> {
  InspirationBloc() : super(InspirationState.initial()) {
    on<GetListArticles>(_getListArticles);
  }

  _getListArticles(
      GetListArticles event, Emitter<InspirationState> emit) async {
    try {
      if (state.atTheEndOfThePage == true) {
        return;
      }
      emit(state.copyWith(
        status:
            event.isFetching ? StateStatus.loadingMore : StateStatus.loading,
        isFetching: true,
      ));

      int nextPage =
          state.page ?? 0; // Use a default value if state.page is null

      final Either<Exception, List<ArticleDto>?> result =
          await GetIt.I<GetListArticlesUseCase>().call({
        "limit": 10,
        "offset": nextPage * 10,
      });

      result.fold((Exception failure) {
        emit(state.copyWith(
          status: StateStatus.error,
          atTheEndOfThePage: false,
          isFetching: false,
        ));
      }, (List<ArticleDto>? success) async {
        if (success != null && success.isNotEmpty) {
          // Increase nextPage only when new data is received
          nextPage++;

          // Check if the server returned fewer items than requested
          bool atTheEndOfThePage = success.length < 10;
          emit(state.copyWith(
            status: StateStatus.success,
            listArticles: state.listArticles! + success,
            isFetching: false,
            atTheEndOfThePage: atTheEndOfThePage,
            page: nextPage,
          ));
        } else {
          emit(state.copyWith(
            status: StateStatus.error,
            atTheEndOfThePage:
                true, // Mark atTheEndOfThePage as true when there is no more data
            isFetching: false,
          ));
        }
      });
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.error,
        isFetching: false,
      ));
    }
  }
}
