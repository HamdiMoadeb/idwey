// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspiration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InspirationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isFetching) getListArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isFetching)? getListArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isFetching)? getListArticles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetListArticles value) getListArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetListArticles value)? getListArticles,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetListArticles value)? getListArticles,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspirationEventCopyWith<$Res> {
  factory $InspirationEventCopyWith(
          InspirationEvent value, $Res Function(InspirationEvent) then) =
      _$InspirationEventCopyWithImpl<$Res, InspirationEvent>;
}

/// @nodoc
class _$InspirationEventCopyWithImpl<$Res, $Val extends InspirationEvent>
    implements $InspirationEventCopyWith<$Res> {
  _$InspirationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$InspirationEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'InspirationEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isFetching) getListArticles,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isFetching)? getListArticles,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isFetching)? getListArticles,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetListArticles value) getListArticles,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetListArticles value)? getListArticles,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetListArticles value)? getListArticles,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements InspirationEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$GetListArticlesCopyWith<$Res> {
  factory _$$GetListArticlesCopyWith(
          _$GetListArticles value, $Res Function(_$GetListArticles) then) =
      __$$GetListArticlesCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFetching});
}

/// @nodoc
class __$$GetListArticlesCopyWithImpl<$Res>
    extends _$InspirationEventCopyWithImpl<$Res, _$GetListArticles>
    implements _$$GetListArticlesCopyWith<$Res> {
  __$$GetListArticlesCopyWithImpl(
      _$GetListArticles _value, $Res Function(_$GetListArticles) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
  }) {
    return _then(_$GetListArticles(
      null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetListArticles implements GetListArticles {
  const _$GetListArticles(this.isFetching);

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'InspirationEvent.getListArticles(isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListArticles &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListArticlesCopyWith<_$GetListArticles> get copyWith =>
      __$$GetListArticlesCopyWithImpl<_$GetListArticles>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool isFetching) getListArticles,
  }) {
    return getListArticles(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool isFetching)? getListArticles,
  }) {
    return getListArticles?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool isFetching)? getListArticles,
    required TResult orElse(),
  }) {
    if (getListArticles != null) {
      return getListArticles(isFetching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetListArticles value) getListArticles,
  }) {
    return getListArticles(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetListArticles value)? getListArticles,
  }) {
    return getListArticles?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetListArticles value)? getListArticles,
    required TResult orElse(),
  }) {
    if (getListArticles != null) {
      return getListArticles(this);
    }
    return orElse();
  }
}

abstract class GetListArticles implements InspirationEvent {
  const factory GetListArticles(final bool isFetching) = _$GetListArticles;

  bool get isFetching;
  @JsonKey(ignore: true)
  _$$GetListArticlesCopyWith<_$GetListArticles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InspirationState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  List<ArticleDto>? get listArticles => throw _privateConstructorUsedError;
  bool? get isFetching => throw _privateConstructorUsedError;
  bool? get atTheEndOfThePage => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InspirationStateCopyWith<InspirationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspirationStateCopyWith<$Res> {
  factory $InspirationStateCopyWith(
          InspirationState value, $Res Function(InspirationState) then) =
      _$InspirationStateCopyWithImpl<$Res, InspirationState>;
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      List<ArticleDto>? listArticles,
      bool? isFetching,
      bool? atTheEndOfThePage,
      int? page});
}

/// @nodoc
class _$InspirationStateCopyWithImpl<$Res, $Val extends InspirationState>
    implements $InspirationStateCopyWith<$Res> {
  _$InspirationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? listArticles = freezed,
    Object? isFetching = freezed,
    Object? atTheEndOfThePage = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      listArticles: freezed == listArticles
          ? _value.listArticles
          : listArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleDto>?,
      isFetching: freezed == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePage: freezed == atTheEndOfThePage
          ? _value.atTheEndOfThePage
          : atTheEndOfThePage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InspirationStateCopyWith<$Res>
    implements $InspirationStateCopyWith<$Res> {
  factory _$$_InspirationStateCopyWith(
          _$_InspirationState value, $Res Function(_$_InspirationState) then) =
      __$$_InspirationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      List<ArticleDto>? listArticles,
      bool? isFetching,
      bool? atTheEndOfThePage,
      int? page});
}

/// @nodoc
class __$$_InspirationStateCopyWithImpl<$Res>
    extends _$InspirationStateCopyWithImpl<$Res, _$_InspirationState>
    implements _$$_InspirationStateCopyWith<$Res> {
  __$$_InspirationStateCopyWithImpl(
      _$_InspirationState _value, $Res Function(_$_InspirationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? listArticles = freezed,
    Object? isFetching = freezed,
    Object? atTheEndOfThePage = freezed,
    Object? page = freezed,
  }) {
    return _then(_$_InspirationState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      listArticles: freezed == listArticles
          ? _value._listArticles
          : listArticles // ignore: cast_nullable_to_non_nullable
              as List<ArticleDto>?,
      isFetching: freezed == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePage: freezed == atTheEndOfThePage
          ? _value.atTheEndOfThePage
          : atTheEndOfThePage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_InspirationState implements _InspirationState {
  const _$_InspirationState(
      {this.title,
      this.status,
      final List<ArticleDto>? listArticles,
      this.isFetching,
      this.atTheEndOfThePage,
      this.page})
      : _listArticles = listArticles;

  @override
  final String? title;
  @override
  final StateStatus? status;
  final List<ArticleDto>? _listArticles;
  @override
  List<ArticleDto>? get listArticles {
    final value = _listArticles;
    if (value == null) return null;
    if (_listArticles is EqualUnmodifiableListView) return _listArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isFetching;
  @override
  final bool? atTheEndOfThePage;
  @override
  final int? page;

  @override
  String toString() {
    return 'InspirationState(title: $title, status: $status, listArticles: $listArticles, isFetching: $isFetching, atTheEndOfThePage: $atTheEndOfThePage, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InspirationState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._listArticles, _listArticles) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.atTheEndOfThePage, atTheEndOfThePage) ||
                other.atTheEndOfThePage == atTheEndOfThePage) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      status,
      const DeepCollectionEquality().hash(_listArticles),
      isFetching,
      atTheEndOfThePage,
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InspirationStateCopyWith<_$_InspirationState> get copyWith =>
      __$$_InspirationStateCopyWithImpl<_$_InspirationState>(this, _$identity);
}

abstract class _InspirationState implements InspirationState {
  const factory _InspirationState(
      {final String? title,
      final StateStatus? status,
      final List<ArticleDto>? listArticles,
      final bool? isFetching,
      final bool? atTheEndOfThePage,
      final int? page}) = _$_InspirationState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  List<ArticleDto>? get listArticles;
  @override
  bool? get isFetching;
  @override
  bool? get atTheEndOfThePage;
  @override
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$_InspirationStateCopyWith<_$_InspirationState> get copyWith =>
      throw _privateConstructorUsedError;
}
