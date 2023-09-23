// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsEvent {
  bool get isFetching => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isFetching) getListProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isFetching)? getListProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isFetching)? getListProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetListProducts value) getListProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetListProducts value)? getListProducts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetListProducts value)? getListProducts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsEventCopyWith<ProductsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEventCopyWith<$Res> {
  factory $ProductsEventCopyWith(
          ProductsEvent value, $Res Function(ProductsEvent) then) =
      _$ProductsEventCopyWithImpl<$Res, ProductsEvent>;
  @useResult
  $Res call({bool isFetching});
}

/// @nodoc
class _$ProductsEventCopyWithImpl<$Res, $Val extends ProductsEvent>
    implements $ProductsEventCopyWith<$Res> {
  _$ProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
  }) {
    return _then(_value.copyWith(
      isFetching: null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetListProductsCopyWith<$Res>
    implements $ProductsEventCopyWith<$Res> {
  factory _$$GetListProductsCopyWith(
          _$GetListProducts value, $Res Function(_$GetListProducts) then) =
      __$$GetListProductsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFetching});
}

/// @nodoc
class __$$GetListProductsCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$GetListProducts>
    implements _$$GetListProductsCopyWith<$Res> {
  __$$GetListProductsCopyWithImpl(
      _$GetListProducts _value, $Res Function(_$GetListProducts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
  }) {
    return _then(_$GetListProducts(
      null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetListProducts implements GetListProducts {
  const _$GetListProducts(this.isFetching);

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'ProductsEvent.getListProducts(isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListProducts &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListProductsCopyWith<_$GetListProducts> get copyWith =>
      __$$GetListProductsCopyWithImpl<_$GetListProducts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isFetching) getListProducts,
  }) {
    return getListProducts(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isFetching)? getListProducts,
  }) {
    return getListProducts?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isFetching)? getListProducts,
    required TResult orElse(),
  }) {
    if (getListProducts != null) {
      return getListProducts(isFetching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetListProducts value) getListProducts,
  }) {
    return getListProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetListProducts value)? getListProducts,
  }) {
    return getListProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetListProducts value)? getListProducts,
    required TResult orElse(),
  }) {
    if (getListProducts != null) {
      return getListProducts(this);
    }
    return orElse();
  }
}

abstract class GetListProducts implements ProductsEvent {
  const factory GetListProducts(final bool isFetching) = _$GetListProducts;

  @override
  bool get isFetching;
  @override
  @JsonKey(ignore: true)
  _$$GetListProductsCopyWith<_$GetListProducts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductsState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  List<ProductDto>? get listArticles => throw _privateConstructorUsedError;
  bool? get isFetching => throw _privateConstructorUsedError;
  bool? get atTheEndOfThePage => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      List<ProductDto>? listArticles,
      bool? isFetching,
      bool? atTheEndOfThePage,
      int? page});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

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
              as List<ProductDto>?,
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
abstract class _$$_ProductsStateCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$_ProductsStateCopyWith(
          _$_ProductsState value, $Res Function(_$_ProductsState) then) =
      __$$_ProductsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      List<ProductDto>? listArticles,
      bool? isFetching,
      bool? atTheEndOfThePage,
      int? page});
}

/// @nodoc
class __$$_ProductsStateCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$_ProductsState>
    implements _$$_ProductsStateCopyWith<$Res> {
  __$$_ProductsStateCopyWithImpl(
      _$_ProductsState _value, $Res Function(_$_ProductsState) _then)
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
    return _then(_$_ProductsState(
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
              as List<ProductDto>?,
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

class _$_ProductsState implements _ProductsState {
  const _$_ProductsState(
      {this.title,
      this.status,
      final List<ProductDto>? listArticles,
      this.isFetching,
      this.atTheEndOfThePage,
      this.page})
      : _listArticles = listArticles;

  @override
  final String? title;
  @override
  final StateStatus? status;
  final List<ProductDto>? _listArticles;
  @override
  List<ProductDto>? get listArticles {
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
    return 'ProductsState(title: $title, status: $status, listArticles: $listArticles, isFetching: $isFetching, atTheEndOfThePage: $atTheEndOfThePage, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductsState &&
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
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      __$$_ProductsStateCopyWithImpl<_$_ProductsState>(this, _$identity);
}

abstract class _ProductsState implements ProductsState {
  const factory _ProductsState(
      {final String? title,
      final StateStatus? status,
      final List<ProductDto>? listArticles,
      final bool? isFetching,
      final bool? atTheEndOfThePage,
      final int? page}) = _$_ProductsState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  List<ProductDto>? get listArticles;
  @override
  bool? get isFetching;
  @override
  bool? get atTheEndOfThePage;
  @override
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$_ProductsStateCopyWith<_$_ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}
