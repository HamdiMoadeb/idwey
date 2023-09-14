// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleDetailsEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getArticleDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getArticleDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getArticleDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetArticleDetails value) getArticleDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetArticleDetails value)? getArticleDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetArticleDetails value)? getArticleDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleDetailsEventCopyWith<ArticleDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDetailsEventCopyWith<$Res> {
  factory $ArticleDetailsEventCopyWith(
          ArticleDetailsEvent value, $Res Function(ArticleDetailsEvent) then) =
      _$ArticleDetailsEventCopyWithImpl<$Res, ArticleDetailsEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ArticleDetailsEventCopyWithImpl<$Res, $Val extends ArticleDetailsEvent>
    implements $ArticleDetailsEventCopyWith<$Res> {
  _$ArticleDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetArticleDetailsCopyWith<$Res>
    implements $ArticleDetailsEventCopyWith<$Res> {
  factory _$$GetArticleDetailsCopyWith(
          _$GetArticleDetails value, $Res Function(_$GetArticleDetails) then) =
      __$$GetArticleDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetArticleDetailsCopyWithImpl<$Res>
    extends _$ArticleDetailsEventCopyWithImpl<$Res, _$GetArticleDetails>
    implements _$$GetArticleDetailsCopyWith<$Res> {
  __$$GetArticleDetailsCopyWithImpl(
      _$GetArticleDetails _value, $Res Function(_$GetArticleDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetArticleDetails(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetArticleDetails implements GetArticleDetails {
  const _$GetArticleDetails(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ArticleDetailsEvent.getArticleDetails(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetArticleDetails &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetArticleDetailsCopyWith<_$GetArticleDetails> get copyWith =>
      __$$GetArticleDetailsCopyWithImpl<_$GetArticleDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getArticleDetails,
  }) {
    return getArticleDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getArticleDetails,
  }) {
    return getArticleDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getArticleDetails,
    required TResult orElse(),
  }) {
    if (getArticleDetails != null) {
      return getArticleDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetArticleDetails value) getArticleDetails,
  }) {
    return getArticleDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetArticleDetails value)? getArticleDetails,
  }) {
    return getArticleDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetArticleDetails value)? getArticleDetails,
    required TResult orElse(),
  }) {
    if (getArticleDetails != null) {
      return getArticleDetails(this);
    }
    return orElse();
  }
}

abstract class GetArticleDetails implements ArticleDetailsEvent {
  const factory GetArticleDetails(final int id) = _$GetArticleDetails;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$GetArticleDetailsCopyWith<_$GetArticleDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticleDetailsState {
  StateStatus? get status => throw _privateConstructorUsedError;
  ArticleDetailsDto? get articleDetailsDto =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleDetailsStateCopyWith<ArticleDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleDetailsStateCopyWith<$Res> {
  factory $ArticleDetailsStateCopyWith(
          ArticleDetailsState value, $Res Function(ArticleDetailsState) then) =
      _$ArticleDetailsStateCopyWithImpl<$Res, ArticleDetailsState>;
  @useResult
  $Res call({StateStatus? status, ArticleDetailsDto? articleDetailsDto});
}

/// @nodoc
class _$ArticleDetailsStateCopyWithImpl<$Res, $Val extends ArticleDetailsState>
    implements $ArticleDetailsStateCopyWith<$Res> {
  _$ArticleDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? articleDetailsDto = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      articleDetailsDto: freezed == articleDetailsDto
          ? _value.articleDetailsDto
          : articleDetailsDto // ignore: cast_nullable_to_non_nullable
              as ArticleDetailsDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleDetailsStateCopyWith<$Res>
    implements $ArticleDetailsStateCopyWith<$Res> {
  factory _$$_ArticleDetailsStateCopyWith(_$_ArticleDetailsState value,
          $Res Function(_$_ArticleDetailsState) then) =
      __$$_ArticleDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateStatus? status, ArticleDetailsDto? articleDetailsDto});
}

/// @nodoc
class __$$_ArticleDetailsStateCopyWithImpl<$Res>
    extends _$ArticleDetailsStateCopyWithImpl<$Res, _$_ArticleDetailsState>
    implements _$$_ArticleDetailsStateCopyWith<$Res> {
  __$$_ArticleDetailsStateCopyWithImpl(_$_ArticleDetailsState _value,
      $Res Function(_$_ArticleDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? articleDetailsDto = freezed,
  }) {
    return _then(_$_ArticleDetailsState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      articleDetailsDto: freezed == articleDetailsDto
          ? _value.articleDetailsDto
          : articleDetailsDto // ignore: cast_nullable_to_non_nullable
              as ArticleDetailsDto?,
    ));
  }
}

/// @nodoc

class _$_ArticleDetailsState implements _ArticleDetailsState {
  const _$_ArticleDetailsState({this.status, this.articleDetailsDto});

  @override
  final StateStatus? status;
  @override
  final ArticleDetailsDto? articleDetailsDto;

  @override
  String toString() {
    return 'ArticleDetailsState(status: $status, articleDetailsDto: $articleDetailsDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleDetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.articleDetailsDto, articleDetailsDto) ||
                other.articleDetailsDto == articleDetailsDto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, articleDetailsDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleDetailsStateCopyWith<_$_ArticleDetailsState> get copyWith =>
      __$$_ArticleDetailsStateCopyWithImpl<_$_ArticleDetailsState>(
          this, _$identity);
}

abstract class _ArticleDetailsState implements ArticleDetailsState {
  const factory _ArticleDetailsState(
      {final StateStatus? status,
      final ArticleDetailsDto? articleDetailsDto}) = _$_ArticleDetailsState;

  @override
  StateStatus? get status;
  @override
  ArticleDetailsDto? get articleDetailsDto;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleDetailsStateCopyWith<_$_ArticleDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
