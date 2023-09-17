// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDetailsEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getDetailsProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getDetailsProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getDetailsProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailsProduct value) getDetailsProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailsProduct value)? getDetailsProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailsProduct value)? getDetailsProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailsEventCopyWith<ProductDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsEventCopyWith<$Res> {
  factory $ProductDetailsEventCopyWith(
          ProductDetailsEvent value, $Res Function(ProductDetailsEvent) then) =
      _$ProductDetailsEventCopyWithImpl<$Res, ProductDetailsEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$ProductDetailsEventCopyWithImpl<$Res, $Val extends ProductDetailsEvent>
    implements $ProductDetailsEventCopyWith<$Res> {
  _$ProductDetailsEventCopyWithImpl(this._value, this._then);

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
abstract class _$$GetDetailsProductCopyWith<$Res>
    implements $ProductDetailsEventCopyWith<$Res> {
  factory _$$GetDetailsProductCopyWith(
          _$GetDetailsProduct value, $Res Function(_$GetDetailsProduct) then) =
      __$$GetDetailsProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetDetailsProductCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$GetDetailsProduct>
    implements _$$GetDetailsProductCopyWith<$Res> {
  __$$GetDetailsProductCopyWithImpl(
      _$GetDetailsProduct _value, $Res Function(_$GetDetailsProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetDetailsProduct(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetDetailsProduct implements GetDetailsProduct {
  const _$GetDetailsProduct(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProductDetailsEvent.getDetailsProduct(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailsProduct &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailsProductCopyWith<_$GetDetailsProduct> get copyWith =>
      __$$GetDetailsProductCopyWithImpl<_$GetDetailsProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getDetailsProduct,
  }) {
    return getDetailsProduct(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getDetailsProduct,
  }) {
    return getDetailsProduct?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getDetailsProduct,
    required TResult orElse(),
  }) {
    if (getDetailsProduct != null) {
      return getDetailsProduct(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailsProduct value) getDetailsProduct,
  }) {
    return getDetailsProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailsProduct value)? getDetailsProduct,
  }) {
    return getDetailsProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailsProduct value)? getDetailsProduct,
    required TResult orElse(),
  }) {
    if (getDetailsProduct != null) {
      return getDetailsProduct(this);
    }
    return orElse();
  }
}

abstract class GetDetailsProduct implements ProductDetailsEvent {
  const factory GetDetailsProduct(final int id) = _$GetDetailsProduct;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$GetDetailsProductCopyWith<_$GetDetailsProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDetailsState {
  StateStatus? get status => throw _privateConstructorUsedError;
  ProductDetailsDto? get productDetailsDto =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDetailsStateCopyWith<ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res, ProductDetailsState>;
  @useResult
  $Res call({StateStatus? status, ProductDetailsDto? productDetailsDto});
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res, $Val extends ProductDetailsState>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? productDetailsDto = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      productDetailsDto: freezed == productDetailsDto
          ? _value.productDetailsDto
          : productDetailsDto // ignore: cast_nullable_to_non_nullable
              as ProductDetailsDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDetailsStateCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$$_ProductDetailsStateCopyWith(_$_ProductDetailsState value,
          $Res Function(_$_ProductDetailsState) then) =
      __$$_ProductDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StateStatus? status, ProductDetailsDto? productDetailsDto});
}

/// @nodoc
class __$$_ProductDetailsStateCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$_ProductDetailsState>
    implements _$$_ProductDetailsStateCopyWith<$Res> {
  __$$_ProductDetailsStateCopyWithImpl(_$_ProductDetailsState _value,
      $Res Function(_$_ProductDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? productDetailsDto = freezed,
  }) {
    return _then(_$_ProductDetailsState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      productDetailsDto: freezed == productDetailsDto
          ? _value.productDetailsDto
          : productDetailsDto // ignore: cast_nullable_to_non_nullable
              as ProductDetailsDto?,
    ));
  }
}

/// @nodoc

class _$_ProductDetailsState implements _ProductDetailsState {
  const _$_ProductDetailsState({this.status, this.productDetailsDto});

  @override
  final StateStatus? status;
  @override
  final ProductDetailsDto? productDetailsDto;

  @override
  String toString() {
    return 'ProductDetailsState(status: $status, productDetailsDto: $productDetailsDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.productDetailsDto, productDetailsDto) ||
                other.productDetailsDto == productDetailsDto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, productDetailsDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDetailsStateCopyWith<_$_ProductDetailsState> get copyWith =>
      __$$_ProductDetailsStateCopyWithImpl<_$_ProductDetailsState>(
          this, _$identity);
}

abstract class _ProductDetailsState implements ProductDetailsState {
  const factory _ProductDetailsState(
      {final StateStatus? status,
      final ProductDetailsDto? productDetailsDto}) = _$_ProductDetailsState;

  @override
  StateStatus? get status;
  @override
  ProductDetailsDto? get productDetailsDto;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDetailsStateCopyWith<_$_ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
