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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getDetailsProduct,
    required TResult Function(int id) addProduct,
    required TResult Function(TypeReservation typeReservation) addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getDetailsProduct,
    TResult? Function(int id)? addProduct,
    TResult? Function(TypeReservation typeReservation)? addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getDetailsProduct,
    TResult Function(int id)? addProduct,
    TResult Function(TypeReservation typeReservation)? addToCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailsProduct value) getDetailsProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(AddToCart value) addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailsProduct value)? getDetailsProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(AddToCart value)? addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailsProduct value)? getDetailsProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsEventCopyWith<$Res> {
  factory $ProductDetailsEventCopyWith(
          ProductDetailsEvent value, $Res Function(ProductDetailsEvent) then) =
      _$ProductDetailsEventCopyWithImpl<$Res, ProductDetailsEvent>;
}

/// @nodoc
class _$ProductDetailsEventCopyWithImpl<$Res, $Val extends ProductDetailsEvent>
    implements $ProductDetailsEventCopyWith<$Res> {
  _$ProductDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetDetailsProductCopyWith<$Res> {
  factory _$$GetDetailsProductCopyWith(
          _$GetDetailsProduct value, $Res Function(_$GetDetailsProduct) then) =
      __$$GetDetailsProductCopyWithImpl<$Res>;
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
    required TResult Function(int id) addProduct,
    required TResult Function(TypeReservation typeReservation) addToCart,
  }) {
    return getDetailsProduct(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getDetailsProduct,
    TResult? Function(int id)? addProduct,
    TResult? Function(TypeReservation typeReservation)? addToCart,
  }) {
    return getDetailsProduct?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getDetailsProduct,
    TResult Function(int id)? addProduct,
    TResult Function(TypeReservation typeReservation)? addToCart,
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
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(AddToCart value) addToCart,
  }) {
    return getDetailsProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailsProduct value)? getDetailsProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(AddToCart value)? addToCart,
  }) {
    return getDetailsProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailsProduct value)? getDetailsProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(AddToCart value)? addToCart,
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

  int get id;
  @JsonKey(ignore: true)
  _$$GetDetailsProductCopyWith<_$GetDetailsProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddProductCopyWith<$Res> {
  factory _$$AddProductCopyWith(
          _$AddProduct value, $Res Function(_$AddProduct) then) =
      __$$AddProductCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$AddProductCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$AddProduct>
    implements _$$AddProductCopyWith<$Res> {
  __$$AddProductCopyWithImpl(
      _$AddProduct _value, $Res Function(_$AddProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AddProduct(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddProduct implements AddProduct {
  const _$AddProduct(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ProductDetailsEvent.addProduct(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProduct &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProductCopyWith<_$AddProduct> get copyWith =>
      __$$AddProductCopyWithImpl<_$AddProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getDetailsProduct,
    required TResult Function(int id) addProduct,
    required TResult Function(TypeReservation typeReservation) addToCart,
  }) {
    return addProduct(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getDetailsProduct,
    TResult? Function(int id)? addProduct,
    TResult? Function(TypeReservation typeReservation)? addToCart,
  }) {
    return addProduct?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getDetailsProduct,
    TResult Function(int id)? addProduct,
    TResult Function(TypeReservation typeReservation)? addToCart,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailsProduct value) getDetailsProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(AddToCart value) addToCart,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailsProduct value)? getDetailsProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(AddToCart value)? addToCart,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailsProduct value)? getDetailsProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class AddProduct implements ProductDetailsEvent {
  const factory AddProduct(final int id) = _$AddProduct;

  int get id;
  @JsonKey(ignore: true)
  _$$AddProductCopyWith<_$AddProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddToCartCopyWith<$Res> {
  factory _$$AddToCartCopyWith(
          _$AddToCart value, $Res Function(_$AddToCart) then) =
      __$$AddToCartCopyWithImpl<$Res>;
  @useResult
  $Res call({TypeReservation typeReservation});
}

/// @nodoc
class __$$AddToCartCopyWithImpl<$Res>
    extends _$ProductDetailsEventCopyWithImpl<$Res, _$AddToCart>
    implements _$$AddToCartCopyWith<$Res> {
  __$$AddToCartCopyWithImpl(
      _$AddToCart _value, $Res Function(_$AddToCart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeReservation = null,
  }) {
    return _then(_$AddToCart(
      null == typeReservation
          ? _value.typeReservation
          : typeReservation // ignore: cast_nullable_to_non_nullable
              as TypeReservation,
    ));
  }
}

/// @nodoc

class _$AddToCart implements AddToCart {
  const _$AddToCart(this.typeReservation);

  @override
  final TypeReservation typeReservation;

  @override
  String toString() {
    return 'ProductDetailsEvent.addToCart(typeReservation: $typeReservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCart &&
            (identical(other.typeReservation, typeReservation) ||
                other.typeReservation == typeReservation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, typeReservation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartCopyWith<_$AddToCart> get copyWith =>
      __$$AddToCartCopyWithImpl<_$AddToCart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getDetailsProduct,
    required TResult Function(int id) addProduct,
    required TResult Function(TypeReservation typeReservation) addToCart,
  }) {
    return addToCart(typeReservation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getDetailsProduct,
    TResult? Function(int id)? addProduct,
    TResult? Function(TypeReservation typeReservation)? addToCart,
  }) {
    return addToCart?.call(typeReservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getDetailsProduct,
    TResult Function(int id)? addProduct,
    TResult Function(TypeReservation typeReservation)? addToCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(typeReservation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetDetailsProduct value) getDetailsProduct,
    required TResult Function(AddProduct value) addProduct,
    required TResult Function(AddToCart value) addToCart,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetDetailsProduct value)? getDetailsProduct,
    TResult? Function(AddProduct value)? addProduct,
    TResult? Function(AddToCart value)? addToCart,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetDetailsProduct value)? getDetailsProduct,
    TResult Function(AddProduct value)? addProduct,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class AddToCart implements ProductDetailsEvent {
  const factory AddToCart(final TypeReservation typeReservation) = _$AddToCart;

  TypeReservation get typeReservation;
  @JsonKey(ignore: true)
  _$$AddToCartCopyWith<_$AddToCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductDetailsState {
  StateStatus? get status => throw _privateConstructorUsedError;
  StateStatus? get addToCartStatus => throw _privateConstructorUsedError;
  ProductDetailsDto? get productDetailsDto =>
      throw _privateConstructorUsedError;
  int? get productNumber => throw _privateConstructorUsedError;

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
  $Res call(
      {StateStatus? status,
      StateStatus? addToCartStatus,
      ProductDetailsDto? productDetailsDto,
      int? productNumber});
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
    Object? addToCartStatus = freezed,
    Object? productDetailsDto = freezed,
    Object? productNumber = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      addToCartStatus: freezed == addToCartStatus
          ? _value.addToCartStatus
          : addToCartStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      productDetailsDto: freezed == productDetailsDto
          ? _value.productDetailsDto
          : productDetailsDto // ignore: cast_nullable_to_non_nullable
              as ProductDetailsDto?,
      productNumber: freezed == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as int?,
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
  $Res call(
      {StateStatus? status,
      StateStatus? addToCartStatus,
      ProductDetailsDto? productDetailsDto,
      int? productNumber});
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
    Object? addToCartStatus = freezed,
    Object? productDetailsDto = freezed,
    Object? productNumber = freezed,
  }) {
    return _then(_$_ProductDetailsState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      addToCartStatus: freezed == addToCartStatus
          ? _value.addToCartStatus
          : addToCartStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      productDetailsDto: freezed == productDetailsDto
          ? _value.productDetailsDto
          : productDetailsDto // ignore: cast_nullable_to_non_nullable
              as ProductDetailsDto?,
      productNumber: freezed == productNumber
          ? _value.productNumber
          : productNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ProductDetailsState implements _ProductDetailsState {
  const _$_ProductDetailsState(
      {this.status,
      this.addToCartStatus,
      this.productDetailsDto,
      this.productNumber});

  @override
  final StateStatus? status;
  @override
  final StateStatus? addToCartStatus;
  @override
  final ProductDetailsDto? productDetailsDto;
  @override
  final int? productNumber;

  @override
  String toString() {
    return 'ProductDetailsState(status: $status, addToCartStatus: $addToCartStatus, productDetailsDto: $productDetailsDto, productNumber: $productNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDetailsState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.addToCartStatus, addToCartStatus) ||
                other.addToCartStatus == addToCartStatus) &&
            (identical(other.productDetailsDto, productDetailsDto) ||
                other.productDetailsDto == productDetailsDto) &&
            (identical(other.productNumber, productNumber) ||
                other.productNumber == productNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, addToCartStatus, productDetailsDto, productNumber);

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
      final StateStatus? addToCartStatus,
      final ProductDetailsDto? productDetailsDto,
      final int? productNumber}) = _$_ProductDetailsState;

  @override
  StateStatus? get status;
  @override
  StateStatus? get addToCartStatus;
  @override
  ProductDetailsDto? get productDetailsDto;
  @override
  int? get productNumber;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDetailsStateCopyWith<_$_ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
