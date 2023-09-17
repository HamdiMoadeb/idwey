part of 'inspiration_bloc.dart';

@freezed
class InspirationEvent with _$InspirationEvent {
  const factory InspirationEvent.started() = _Started;

  const factory InspirationEvent.getListArticles(bool isFetching) =
      GetListArticles;
}
