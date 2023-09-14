import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:idwey/constants/enums.dart';
import 'package:idwey/data/models/article_details_dto.dart';
import 'package:idwey/domain/usecases/get_article_details_usecase.dart';

part 'article_details_event.dart';
part 'article_details_state.dart';
part 'article_details_bloc.freezed.dart';

class ArticleDetailsBloc
    extends Bloc<ArticleDetailsEvent, ArticleDetailsState> {
  ArticleDetailsBloc() : super(ArticleDetailsState.initial()) {
    on<GetArticleDetails>(_getDetailsArticle);
  }

  _getDetailsArticle(
      GetArticleDetails event, Emitter<ArticleDetailsState> emit) async {
    emit(state.copyWith(
      status: StateStatus.loading,
    ));
    final Either<Exception, ArticleDetailsDto?> result =
        await GetIt.I<GetArticleDetailsUseCase>().call(event.id);
    result.fold((Exception failure) {
      emit(state.copyWith(
        status: StateStatus.error,
      ));
    }, (ArticleDetailsDto? success) async {
      if (success != null) {
        emit(state.copyWith(
          status: StateStatus.success,
          articleDetailsDto: success,
        ));
      } else {
        emit(state.copyWith(
          status: StateStatus.error,
        ));
      }
    });
  }
}
