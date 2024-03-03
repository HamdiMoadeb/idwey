// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReservationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationEventCopyWith<$Res> {
  factory $ReservationEventCopyWith(
          ReservationEvent value, $Res Function(ReservationEvent) then) =
      _$ReservationEventCopyWithImpl<$Res, ReservationEvent>;
}

/// @nodoc
class _$ReservationEventCopyWithImpl<$Res, $Val extends ReservationEvent>
    implements $ReservationEventCopyWith<$Res> {
  _$ReservationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_setParamsCopyWith<$Res> {
  factory _$$_setParamsCopyWith(
          _$_setParams value, $Res Function(_$_setParams) then) =
      __$$_setParamsCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? activityDuration,
      String? id,
      String? url,
      String? title,
      String? address,
      String? typeHost,
      String? salePrice,
      String? perPerson,
      int? minNuits,
      String? checkIn,
      String? checkOut,
      List<ExtraPrice>? extraPrice,
      String? price});
}

/// @nodoc
class __$$_setParamsCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_setParams>
    implements _$$_setParamsCopyWith<$Res> {
  __$$_setParamsCopyWithImpl(
      _$_setParams _value, $Res Function(_$_setParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityDuration = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? address = freezed,
    Object? typeHost = freezed,
    Object? salePrice = freezed,
    Object? perPerson = freezed,
    Object? minNuits = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? extraPrice = freezed,
    Object? price = freezed,
  }) {
    return _then(_$_setParams(
      freezed == activityDuration
          ? _value.activityDuration
          : activityDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == typeHost
          ? _value.typeHost
          : typeHost // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == perPerson
          ? _value.perPerson
          : perPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == minNuits
          ? _value.minNuits
          : minNuits // ignore: cast_nullable_to_non_nullable
              as int?,
      freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == extraPrice
          ? _value._extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>?,
      freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_setParams implements _setParams {
  const _$_setParams(
      this.activityDuration,
      this.id,
      this.url,
      this.title,
      this.address,
      this.typeHost,
      this.salePrice,
      this.perPerson,
      this.minNuits,
      this.checkIn,
      this.checkOut,
      final List<ExtraPrice>? extraPrice,
      this.price)
      : _extraPrice = extraPrice;

  @override
  final String? activityDuration;
  @override
  final String? id;
  @override
  final String? url;
  @override
  final String? title;
  @override
  final String? address;
  @override
  final String? typeHost;
  @override
  final String? salePrice;
  @override
  final String? perPerson;
  @override
  final int? minNuits;
  @override
  final String? checkIn;
  @override
  final String? checkOut;
  final List<ExtraPrice>? _extraPrice;
  @override
  List<ExtraPrice>? get extraPrice {
    final value = _extraPrice;
    if (value == null) return null;
    if (_extraPrice is EqualUnmodifiableListView) return _extraPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? price;

  @override
  String toString() {
    return 'ReservationEvent.setParams(activityDuration: $activityDuration, id: $id, url: $url, title: $title, address: $address, typeHost: $typeHost, salePrice: $salePrice, perPerson: $perPerson, minNuits: $minNuits, checkIn: $checkIn, checkOut: $checkOut, extraPrice: $extraPrice, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_setParams &&
            (identical(other.activityDuration, activityDuration) ||
                other.activityDuration == activityDuration) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.typeHost, typeHost) ||
                other.typeHost == typeHost) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.perPerson, perPerson) ||
                other.perPerson == perPerson) &&
            (identical(other.minNuits, minNuits) ||
                other.minNuits == minNuits) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            const DeepCollectionEquality()
                .equals(other._extraPrice, _extraPrice) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      activityDuration,
      id,
      url,
      title,
      address,
      typeHost,
      salePrice,
      perPerson,
      minNuits,
      checkIn,
      checkOut,
      const DeepCollectionEquality().hash(_extraPrice),
      price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_setParamsCopyWith<_$_setParams> get copyWith =>
      __$$_setParamsCopyWithImpl<_$_setParams>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return setParams(activityDuration, id, url, title, address, typeHost,
        salePrice, perPerson, minNuits, checkIn, checkOut, extraPrice, price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return setParams?.call(activityDuration, id, url, title, address, typeHost,
        salePrice, perPerson, minNuits, checkIn, checkOut, extraPrice, price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (setParams != null) {
      return setParams(activityDuration, id, url, title, address, typeHost,
          salePrice, perPerson, minNuits, checkIn, checkOut, extraPrice, price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return setParams(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return setParams?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (setParams != null) {
      return setParams(this);
    }
    return orElse();
  }
}

abstract class _setParams implements ReservationEvent {
  const factory _setParams(
      final String? activityDuration,
      final String? id,
      final String? url,
      final String? title,
      final String? address,
      final String? typeHost,
      final String? salePrice,
      final String? perPerson,
      final int? minNuits,
      final String? checkIn,
      final String? checkOut,
      final List<ExtraPrice>? extraPrice,
      final String? price) = _$_setParams;

  String? get activityDuration;
  String? get id;
  String? get url;
  String? get title;
  String? get address;
  String? get typeHost;
  String? get salePrice;
  String? get perPerson;
  int? get minNuits;
  String? get checkIn;
  String? get checkOut;
  List<ExtraPrice>? get extraPrice;
  String? get price;
  @JsonKey(ignore: true)
  _$$_setParamsCopyWith<_$_setParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CheckAvailabilityCopyWith<$Res> {
  factory _$$_CheckAvailabilityCopyWith(_$_CheckAvailability value,
          $Res Function(_$_CheckAvailability) then) =
      __$$_CheckAvailabilityCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String type,
      int id,
      String checkIn,
      String checkOut,
      String adults,
      String children});
}

/// @nodoc
class __$$_CheckAvailabilityCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_CheckAvailability>
    implements _$$_CheckAvailabilityCopyWith<$Res> {
  __$$_CheckAvailabilityCopyWithImpl(
      _$_CheckAvailability _value, $Res Function(_$_CheckAvailability) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? id = null,
    Object? checkIn = null,
    Object? checkOut = null,
    Object? adults = null,
    Object? children = null,
  }) {
    return _then(_$_CheckAvailability(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String,
      null == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String,
      null == adults
          ? _value.adults
          : adults // ignore: cast_nullable_to_non_nullable
              as String,
      null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CheckAvailability implements _CheckAvailability {
  const _$_CheckAvailability(this.type, this.id, this.checkIn, this.checkOut,
      this.adults, this.children);

  @override
  final String type;
  @override
  final int id;
  @override
  final String checkIn;
  @override
  final String checkOut;
  @override
  final String adults;
  @override
  final String children;

  @override
  String toString() {
    return 'ReservationEvent.checkAvailability(type: $type, id: $id, checkIn: $checkIn, checkOut: $checkOut, adults: $adults, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckAvailability &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.adults, adults) || other.adults == adults) &&
            (identical(other.children, children) ||
                other.children == children));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, id, checkIn, checkOut, adults, children);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckAvailabilityCopyWith<_$_CheckAvailability> get copyWith =>
      __$$_CheckAvailabilityCopyWithImpl<_$_CheckAvailability>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return checkAvailability(type, id, checkIn, checkOut, adults, children);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return checkAvailability?.call(
        type, id, checkIn, checkOut, adults, children);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (checkAvailability != null) {
      return checkAvailability(type, id, checkIn, checkOut, adults, children);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return checkAvailability(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return checkAvailability?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (checkAvailability != null) {
      return checkAvailability(this);
    }
    return orElse();
  }
}

abstract class _CheckAvailability implements ReservationEvent {
  const factory _CheckAvailability(
      final String type,
      final int id,
      final String checkIn,
      final String checkOut,
      final String adults,
      final String children) = _$_CheckAvailability;

  String get type;
  int get id;
  String get checkIn;
  String get checkOut;
  String get adults;
  String get children;
  @JsonKey(ignore: true)
  _$$_CheckAvailabilityCopyWith<_$_CheckAvailability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnSelectDatesCopyWith<$Res> {
  factory _$$_OnSelectDatesCopyWith(
          _$_OnSelectDates value, $Res Function(_$_OnSelectDates) then) =
      __$$_OnSelectDatesCopyWithImpl<$Res>;
  @useResult
  $Res call({String startDate, String endDate, String nbNights});
}

/// @nodoc
class __$$_OnSelectDatesCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_OnSelectDates>
    implements _$$_OnSelectDatesCopyWith<$Res> {
  __$$_OnSelectDatesCopyWithImpl(
      _$_OnSelectDates _value, $Res Function(_$_OnSelectDates) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? nbNights = null,
  }) {
    return _then(_$_OnSelectDates(
      null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      null == nbNights
          ? _value.nbNights
          : nbNights // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnSelectDates implements _OnSelectDates {
  const _$_OnSelectDates(this.startDate, this.endDate, this.nbNights);

  @override
  final String startDate;
  @override
  final String endDate;
  @override
  final String nbNights;

  @override
  String toString() {
    return 'ReservationEvent.onSelectDates(startDate: $startDate, endDate: $endDate, nbNights: $nbNights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnSelectDates &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.nbNights, nbNights) ||
                other.nbNights == nbNights));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, nbNights);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnSelectDatesCopyWith<_$_OnSelectDates> get copyWith =>
      __$$_OnSelectDatesCopyWithImpl<_$_OnSelectDates>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return onSelectDates(startDate, endDate, nbNights);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return onSelectDates?.call(startDate, endDate, nbNights);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onSelectDates != null) {
      return onSelectDates(startDate, endDate, nbNights);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return onSelectDates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return onSelectDates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onSelectDates != null) {
      return onSelectDates(this);
    }
    return orElse();
  }
}

abstract class _OnSelectDates implements ReservationEvent {
  const factory _OnSelectDates(
          final String startDate, final String endDate, final String nbNights) =
      _$_OnSelectDates;

  String get startDate;
  String get endDate;
  String get nbNights;
  @JsonKey(ignore: true)
  _$$_OnSelectDatesCopyWith<_$_OnSelectDates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnSelectGuestsCopyWith<$Res> {
  factory _$$_OnSelectGuestsCopyWith(
          _$_OnSelectGuests value, $Res Function(_$_OnSelectGuests) then) =
      __$$_OnSelectGuestsCopyWithImpl<$Res>;
  @useResult
  $Res call({int guests, String price});
}

/// @nodoc
class __$$_OnSelectGuestsCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_OnSelectGuests>
    implements _$$_OnSelectGuestsCopyWith<$Res> {
  __$$_OnSelectGuestsCopyWithImpl(
      _$_OnSelectGuests _value, $Res Function(_$_OnSelectGuests) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guests = null,
    Object? price = null,
  }) {
    return _then(_$_OnSelectGuests(
      null == guests
          ? _value.guests
          : guests // ignore: cast_nullable_to_non_nullable
              as int,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnSelectGuests implements _OnSelectGuests {
  const _$_OnSelectGuests(this.guests, this.price);

  @override
  final int guests;
  @override
  final String price;

  @override
  String toString() {
    return 'ReservationEvent.onSelectGuests(guests: $guests, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnSelectGuests &&
            (identical(other.guests, guests) || other.guests == guests) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, guests, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnSelectGuestsCopyWith<_$_OnSelectGuests> get copyWith =>
      __$$_OnSelectGuestsCopyWithImpl<_$_OnSelectGuests>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return onSelectGuests(guests, price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return onSelectGuests?.call(guests, price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onSelectGuests != null) {
      return onSelectGuests(guests, price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return onSelectGuests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return onSelectGuests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onSelectGuests != null) {
      return onSelectGuests(this);
    }
    return orElse();
  }
}

abstract class _OnSelectGuests implements ReservationEvent {
  const factory _OnSelectGuests(final int guests, final String price) =
      _$_OnSelectGuests;

  int get guests;
  String get price;
  @JsonKey(ignore: true)
  _$$_OnSelectGuestsCopyWith<_$_OnSelectGuests> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmReservationCopyWith<$Res> {
  factory _$$_ConfirmReservationCopyWith(_$_ConfirmReservation value,
          $Res Function(_$_ConfirmReservation) then) =
      __$$_ConfirmReservationCopyWithImpl<$Res>;
  @useResult
  $Res call({TypeReservation typeReservation});
}

/// @nodoc
class __$$_ConfirmReservationCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_ConfirmReservation>
    implements _$$_ConfirmReservationCopyWith<$Res> {
  __$$_ConfirmReservationCopyWithImpl(
      _$_ConfirmReservation _value, $Res Function(_$_ConfirmReservation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typeReservation = null,
  }) {
    return _then(_$_ConfirmReservation(
      null == typeReservation
          ? _value.typeReservation
          : typeReservation // ignore: cast_nullable_to_non_nullable
              as TypeReservation,
    ));
  }
}

/// @nodoc

class _$_ConfirmReservation implements _ConfirmReservation {
  const _$_ConfirmReservation(this.typeReservation);

  @override
  final TypeReservation typeReservation;

  @override
  String toString() {
    return 'ReservationEvent.addToCart(typeReservation: $typeReservation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmReservation &&
            (identical(other.typeReservation, typeReservation) ||
                other.typeReservation == typeReservation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, typeReservation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConfirmReservationCopyWith<_$_ConfirmReservation> get copyWith =>
      __$$_ConfirmReservationCopyWithImpl<_$_ConfirmReservation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return addToCart(typeReservation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return addToCart?.call(typeReservation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
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
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class _ConfirmReservation implements ReservationEvent {
  const factory _ConfirmReservation(final TypeReservation typeReservation) =
      _$_ConfirmReservation;

  TypeReservation get typeReservation;
  @JsonKey(ignore: true)
  _$$_ConfirmReservationCopyWith<_$_ConfirmReservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnSelectChaletCopyWith<$Res> {
  factory _$$_OnSelectChaletCopyWith(
          _$_OnSelectChalet value, $Res Function(_$_OnSelectChalet) then) =
      __$$_OnSelectChaletCopyWithImpl<$Res>;
  @useResult
  $Res call({Room chalet});
}

/// @nodoc
class __$$_OnSelectChaletCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_OnSelectChalet>
    implements _$$_OnSelectChaletCopyWith<$Res> {
  __$$_OnSelectChaletCopyWithImpl(
      _$_OnSelectChalet _value, $Res Function(_$_OnSelectChalet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalet = null,
  }) {
    return _then(_$_OnSelectChalet(
      null == chalet
          ? _value.chalet
          : chalet // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

class _$_OnSelectChalet implements _OnSelectChalet {
  const _$_OnSelectChalet(this.chalet);

  @override
  final Room chalet;

  @override
  String toString() {
    return 'ReservationEvent.onSelectChalet(chalet: $chalet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnSelectChalet &&
            (identical(other.chalet, chalet) || other.chalet == chalet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chalet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnSelectChaletCopyWith<_$_OnSelectChalet> get copyWith =>
      __$$_OnSelectChaletCopyWithImpl<_$_OnSelectChalet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return onSelectChalet(chalet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return onSelectChalet?.call(chalet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onSelectChalet != null) {
      return onSelectChalet(chalet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return onSelectChalet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return onSelectChalet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onSelectChalet != null) {
      return onSelectChalet(this);
    }
    return orElse();
  }
}

abstract class _OnSelectChalet implements ReservationEvent {
  const factory _OnSelectChalet(final Room chalet) = _$_OnSelectChalet;

  Room get chalet;
  @JsonKey(ignore: true)
  _$$_OnSelectChaletCopyWith<_$_OnSelectChalet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnUnSelectChaletCopyWith<$Res> {
  factory _$$_OnUnSelectChaletCopyWith(
          _$_OnUnSelectChalet value, $Res Function(_$_OnUnSelectChalet) then) =
      __$$_OnUnSelectChaletCopyWithImpl<$Res>;
  @useResult
  $Res call({Room chalet});
}

/// @nodoc
class __$$_OnUnSelectChaletCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_OnUnSelectChalet>
    implements _$$_OnUnSelectChaletCopyWith<$Res> {
  __$$_OnUnSelectChaletCopyWithImpl(
      _$_OnUnSelectChalet _value, $Res Function(_$_OnUnSelectChalet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chalet = null,
  }) {
    return _then(_$_OnUnSelectChalet(
      null == chalet
          ? _value.chalet
          : chalet // ignore: cast_nullable_to_non_nullable
              as Room,
    ));
  }
}

/// @nodoc

class _$_OnUnSelectChalet implements _OnUnSelectChalet {
  const _$_OnUnSelectChalet(this.chalet);

  @override
  final Room chalet;

  @override
  String toString() {
    return 'ReservationEvent.onUnSelectChalet(chalet: $chalet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnUnSelectChalet &&
            (identical(other.chalet, chalet) || other.chalet == chalet));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chalet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnUnSelectChaletCopyWith<_$_OnUnSelectChalet> get copyWith =>
      __$$_OnUnSelectChaletCopyWithImpl<_$_OnUnSelectChalet>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return onUnSelectChalet(chalet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return onUnSelectChalet?.call(chalet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onUnSelectChalet != null) {
      return onUnSelectChalet(chalet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return onUnSelectChalet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return onUnSelectChalet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onUnSelectChalet != null) {
      return onUnSelectChalet(this);
    }
    return orElse();
  }
}

abstract class _OnUnSelectChalet implements ReservationEvent {
  const factory _OnUnSelectChalet(final Room chalet) = _$_OnUnSelectChalet;

  Room get chalet;
  @JsonKey(ignore: true)
  _$$_OnUnSelectChaletCopyWith<_$_OnUnSelectChalet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InitStatusCopyWith<$Res> {
  factory _$$_InitStatusCopyWith(
          _$_InitStatus value, $Res Function(_$_InitStatus) then) =
      __$$_InitStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitStatusCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_InitStatus>
    implements _$$_InitStatusCopyWith<$Res> {
  __$$_InitStatusCopyWithImpl(
      _$_InitStatus _value, $Res Function(_$_InitStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitStatus implements _InitStatus {
  const _$_InitStatus();

  @override
  String toString() {
    return 'ReservationEvent.initStatus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return initStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return initStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (initStatus != null) {
      return initStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return initStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return initStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (initStatus != null) {
      return initStatus(this);
    }
    return orElse();
  }
}

abstract class _InitStatus implements ReservationEvent {
  const factory _InitStatus() = _$_InitStatus;
}

/// @nodoc
abstract class _$$InitAddToCartStatusCopyWith<$Res> {
  factory _$$InitAddToCartStatusCopyWith(_$InitAddToCartStatus value,
          $Res Function(_$InitAddToCartStatus) then) =
      __$$InitAddToCartStatusCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitAddToCartStatusCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$InitAddToCartStatus>
    implements _$$InitAddToCartStatusCopyWith<$Res> {
  __$$InitAddToCartStatusCopyWithImpl(
      _$InitAddToCartStatus _value, $Res Function(_$InitAddToCartStatus) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitAddToCartStatus implements InitAddToCartStatus {
  const _$InitAddToCartStatus();

  @override
  String toString() {
    return 'ReservationEvent.initAddToCartStatus()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitAddToCartStatus);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return initAddToCartStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return initAddToCartStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (initAddToCartStatus != null) {
      return initAddToCartStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return initAddToCartStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return initAddToCartStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (initAddToCartStatus != null) {
      return initAddToCartStatus(this);
    }
    return orElse();
  }
}

abstract class InitAddToCartStatus implements ReservationEvent {
  const factory InitAddToCartStatus() = _$InitAddToCartStatus;
}

/// @nodoc
abstract class _$$_OnExtraPriceQuantityChangedCopyWith<$Res> {
  factory _$$_OnExtraPriceQuantityChangedCopyWith(
          _$_OnExtraPriceQuantityChanged value,
          $Res Function(_$_OnExtraPriceQuantityChanged) then) =
      __$$_OnExtraPriceQuantityChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({ExtraPrice extraPrice, int i});
}

/// @nodoc
class __$$_OnExtraPriceQuantityChangedCopyWithImpl<$Res>
    extends _$ReservationEventCopyWithImpl<$Res, _$_OnExtraPriceQuantityChanged>
    implements _$$_OnExtraPriceQuantityChangedCopyWith<$Res> {
  __$$_OnExtraPriceQuantityChangedCopyWithImpl(
      _$_OnExtraPriceQuantityChanged _value,
      $Res Function(_$_OnExtraPriceQuantityChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraPrice = null,
    Object? i = null,
  }) {
    return _then(_$_OnExtraPriceQuantityChanged(
      null == extraPrice
          ? _value.extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as ExtraPrice,
      null == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_OnExtraPriceQuantityChanged implements _OnExtraPriceQuantityChanged {
  const _$_OnExtraPriceQuantityChanged(this.extraPrice, this.i);

  @override
  final ExtraPrice extraPrice;
  @override
  final int i;

  @override
  String toString() {
    return 'ReservationEvent.onExtraPriceQuantityChanged(extraPrice: $extraPrice, i: $i)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnExtraPriceQuantityChanged &&
            (identical(other.extraPrice, extraPrice) ||
                other.extraPrice == extraPrice) &&
            (identical(other.i, i) || other.i == i));
  }

  @override
  int get hashCode => Object.hash(runtimeType, extraPrice, i);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnExtraPriceQuantityChangedCopyWith<_$_OnExtraPriceQuantityChanged>
      get copyWith => __$$_OnExtraPriceQuantityChangedCopyWithImpl<
          _$_OnExtraPriceQuantityChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)
        setParams,
    required TResult Function(String type, int id, String checkIn,
            String checkOut, String adults, String children)
        checkAvailability,
    required TResult Function(String startDate, String endDate, String nbNights)
        onSelectDates,
    required TResult Function(int guests, String price) onSelectGuests,
    required TResult Function(TypeReservation typeReservation) addToCart,
    required TResult Function(Room chalet) onSelectChalet,
    required TResult Function(Room chalet) onUnSelectChalet,
    required TResult Function() initStatus,
    required TResult Function() initAddToCartStatus,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
  }) {
    return onExtraPriceQuantityChanged(extraPrice, i);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult? Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult? Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult? Function(int guests, String price)? onSelectGuests,
    TResult? Function(TypeReservation typeReservation)? addToCart,
    TResult? Function(Room chalet)? onSelectChalet,
    TResult? Function(Room chalet)? onUnSelectChalet,
    TResult? Function()? initStatus,
    TResult? Function()? initAddToCartStatus,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
  }) {
    return onExtraPriceQuantityChanged?.call(extraPrice, i);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String? activityDuration,
            String? id,
            String? url,
            String? title,
            String? address,
            String? typeHost,
            String? salePrice,
            String? perPerson,
            int? minNuits,
            String? checkIn,
            String? checkOut,
            List<ExtraPrice>? extraPrice,
            String? price)?
        setParams,
    TResult Function(String type, int id, String checkIn, String checkOut,
            String adults, String children)?
        checkAvailability,
    TResult Function(String startDate, String endDate, String nbNights)?
        onSelectDates,
    TResult Function(int guests, String price)? onSelectGuests,
    TResult Function(TypeReservation typeReservation)? addToCart,
    TResult Function(Room chalet)? onSelectChalet,
    TResult Function(Room chalet)? onUnSelectChalet,
    TResult Function()? initStatus,
    TResult Function()? initAddToCartStatus,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onExtraPriceQuantityChanged != null) {
      return onExtraPriceQuantityChanged(extraPrice, i);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_setParams value) setParams,
    required TResult Function(_CheckAvailability value) checkAvailability,
    required TResult Function(_OnSelectDates value) onSelectDates,
    required TResult Function(_OnSelectGuests value) onSelectGuests,
    required TResult Function(_ConfirmReservation value) addToCart,
    required TResult Function(_OnSelectChalet value) onSelectChalet,
    required TResult Function(_OnUnSelectChalet value) onUnSelectChalet,
    required TResult Function(_InitStatus value) initStatus,
    required TResult Function(InitAddToCartStatus value) initAddToCartStatus,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
  }) {
    return onExtraPriceQuantityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_setParams value)? setParams,
    TResult? Function(_CheckAvailability value)? checkAvailability,
    TResult? Function(_OnSelectDates value)? onSelectDates,
    TResult? Function(_OnSelectGuests value)? onSelectGuests,
    TResult? Function(_ConfirmReservation value)? addToCart,
    TResult? Function(_OnSelectChalet value)? onSelectChalet,
    TResult? Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult? Function(_InitStatus value)? initStatus,
    TResult? Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
  }) {
    return onExtraPriceQuantityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_setParams value)? setParams,
    TResult Function(_CheckAvailability value)? checkAvailability,
    TResult Function(_OnSelectDates value)? onSelectDates,
    TResult Function(_OnSelectGuests value)? onSelectGuests,
    TResult Function(_ConfirmReservation value)? addToCart,
    TResult Function(_OnSelectChalet value)? onSelectChalet,
    TResult Function(_OnUnSelectChalet value)? onUnSelectChalet,
    TResult Function(_InitStatus value)? initStatus,
    TResult Function(InitAddToCartStatus value)? initAddToCartStatus,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    required TResult orElse(),
  }) {
    if (onExtraPriceQuantityChanged != null) {
      return onExtraPriceQuantityChanged(this);
    }
    return orElse();
  }
}

abstract class _OnExtraPriceQuantityChanged implements ReservationEvent {
  const factory _OnExtraPriceQuantityChanged(
          final ExtraPrice extraPrice, final int i) =
      _$_OnExtraPriceQuantityChanged;

  ExtraPrice get extraPrice;
  int get i;
  @JsonKey(ignore: true)
  _$$_OnExtraPriceQuantityChangedCopyWith<_$_OnExtraPriceQuantityChanged>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReservationState {
  StateStatus? get status => throw _privateConstructorUsedError;
  StateStatus? get addToCartStatus => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get checkIn => throw _privateConstructorUsedError;
  String? get checkOut => throw _privateConstructorUsedError;
  bool? get available => throw _privateConstructorUsedError;
  String? get totalPrice => throw _privateConstructorUsedError;
  String? get totalPriceOnSale => throw _privateConstructorUsedError;
  String? get nbNights => throw _privateConstructorUsedError;
  int? get guests => throw _privateConstructorUsedError;
  String? get activityDuration => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get typeHost => throw _privateConstructorUsedError;
  String? get salePrice => throw _privateConstructorUsedError;
  String? get perPerson => throw _privateConstructorUsedError;
  int? get minNuits => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;
  List<int>? get selectedRooms => throw _privateConstructorUsedError;
  List<Room>? get selectedRoomsObject => throw _privateConstructorUsedError;
  List<Room>? get availableChalet => throw _privateConstructorUsedError;
  List<ExtraPrice>? get extraPrice => throw _privateConstructorUsedError;
  double? get extraPriceTotal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReservationStateCopyWith<ReservationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationStateCopyWith<$Res> {
  factory $ReservationStateCopyWith(
          ReservationState value, $Res Function(ReservationState) then) =
      _$ReservationStateCopyWithImpl<$Res, ReservationState>;
  @useResult
  $Res call(
      {StateStatus? status,
      StateStatus? addToCartStatus,
      String? name,
      String? lastname,
      String? email,
      String? phone,
      String? checkIn,
      String? checkOut,
      bool? available,
      String? totalPrice,
      String? totalPriceOnSale,
      String? nbNights,
      int? guests,
      String? activityDuration,
      String? id,
      String? url,
      String? title,
      String? address,
      String? typeHost,
      String? salePrice,
      String? perPerson,
      int? minNuits,
      String? price,
      String? errorText,
      List<int>? selectedRooms,
      List<Room>? selectedRoomsObject,
      List<Room>? availableChalet,
      List<ExtraPrice>? extraPrice,
      double? extraPriceTotal});
}

/// @nodoc
class _$ReservationStateCopyWithImpl<$Res, $Val extends ReservationState>
    implements $ReservationStateCopyWith<$Res> {
  _$ReservationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? addToCartStatus = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? available = freezed,
    Object? totalPrice = freezed,
    Object? totalPriceOnSale = freezed,
    Object? nbNights = freezed,
    Object? guests = freezed,
    Object? activityDuration = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? address = freezed,
    Object? typeHost = freezed,
    Object? salePrice = freezed,
    Object? perPerson = freezed,
    Object? minNuits = freezed,
    Object? price = freezed,
    Object? errorText = freezed,
    Object? selectedRooms = freezed,
    Object? selectedRoomsObject = freezed,
    Object? availableChalet = freezed,
    Object? extraPrice = freezed,
    Object? extraPriceTotal = freezed,
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
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPriceOnSale: freezed == totalPriceOnSale
          ? _value.totalPriceOnSale
          : totalPriceOnSale // ignore: cast_nullable_to_non_nullable
              as String?,
      nbNights: freezed == nbNights
          ? _value.nbNights
          : nbNights // ignore: cast_nullable_to_non_nullable
              as String?,
      guests: freezed == guests
          ? _value.guests
          : guests // ignore: cast_nullable_to_non_nullable
              as int?,
      activityDuration: freezed == activityDuration
          ? _value.activityDuration
          : activityDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      typeHost: freezed == typeHost
          ? _value.typeHost
          : typeHost // ignore: cast_nullable_to_non_nullable
              as String?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      perPerson: freezed == perPerson
          ? _value.perPerson
          : perPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      minNuits: freezed == minNuits
          ? _value.minNuits
          : minNuits // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRooms: freezed == selectedRooms
          ? _value.selectedRooms
          : selectedRooms // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      selectedRoomsObject: freezed == selectedRoomsObject
          ? _value.selectedRoomsObject
          : selectedRoomsObject // ignore: cast_nullable_to_non_nullable
              as List<Room>?,
      availableChalet: freezed == availableChalet
          ? _value.availableChalet
          : availableChalet // ignore: cast_nullable_to_non_nullable
              as List<Room>?,
      extraPrice: freezed == extraPrice
          ? _value.extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>?,
      extraPriceTotal: freezed == extraPriceTotal
          ? _value.extraPriceTotal
          : extraPriceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReservationStateCopyWith<$Res>
    implements $ReservationStateCopyWith<$Res> {
  factory _$$_ReservationStateCopyWith(
          _$_ReservationState value, $Res Function(_$_ReservationState) then) =
      __$$_ReservationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StateStatus? status,
      StateStatus? addToCartStatus,
      String? name,
      String? lastname,
      String? email,
      String? phone,
      String? checkIn,
      String? checkOut,
      bool? available,
      String? totalPrice,
      String? totalPriceOnSale,
      String? nbNights,
      int? guests,
      String? activityDuration,
      String? id,
      String? url,
      String? title,
      String? address,
      String? typeHost,
      String? salePrice,
      String? perPerson,
      int? minNuits,
      String? price,
      String? errorText,
      List<int>? selectedRooms,
      List<Room>? selectedRoomsObject,
      List<Room>? availableChalet,
      List<ExtraPrice>? extraPrice,
      double? extraPriceTotal});
}

/// @nodoc
class __$$_ReservationStateCopyWithImpl<$Res>
    extends _$ReservationStateCopyWithImpl<$Res, _$_ReservationState>
    implements _$$_ReservationStateCopyWith<$Res> {
  __$$_ReservationStateCopyWithImpl(
      _$_ReservationState _value, $Res Function(_$_ReservationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? addToCartStatus = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? checkIn = freezed,
    Object? checkOut = freezed,
    Object? available = freezed,
    Object? totalPrice = freezed,
    Object? totalPriceOnSale = freezed,
    Object? nbNights = freezed,
    Object? guests = freezed,
    Object? activityDuration = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? title = freezed,
    Object? address = freezed,
    Object? typeHost = freezed,
    Object? salePrice = freezed,
    Object? perPerson = freezed,
    Object? minNuits = freezed,
    Object? price = freezed,
    Object? errorText = freezed,
    Object? selectedRooms = freezed,
    Object? selectedRoomsObject = freezed,
    Object? availableChalet = freezed,
    Object? extraPrice = freezed,
    Object? extraPriceTotal = freezed,
  }) {
    return _then(_$_ReservationState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      addToCartStatus: freezed == addToCartStatus
          ? _value.addToCartStatus
          : addToCartStatus // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      checkIn: freezed == checkIn
          ? _value.checkIn
          : checkIn // ignore: cast_nullable_to_non_nullable
              as String?,
      checkOut: freezed == checkOut
          ? _value.checkOut
          : checkOut // ignore: cast_nullable_to_non_nullable
              as String?,
      available: freezed == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPriceOnSale: freezed == totalPriceOnSale
          ? _value.totalPriceOnSale
          : totalPriceOnSale // ignore: cast_nullable_to_non_nullable
              as String?,
      nbNights: freezed == nbNights
          ? _value.nbNights
          : nbNights // ignore: cast_nullable_to_non_nullable
              as String?,
      guests: freezed == guests
          ? _value.guests
          : guests // ignore: cast_nullable_to_non_nullable
              as int?,
      activityDuration: freezed == activityDuration
          ? _value.activityDuration
          : activityDuration // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      typeHost: freezed == typeHost
          ? _value.typeHost
          : typeHost // ignore: cast_nullable_to_non_nullable
              as String?,
      salePrice: freezed == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String?,
      perPerson: freezed == perPerson
          ? _value.perPerson
          : perPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      minNuits: freezed == minNuits
          ? _value.minNuits
          : minNuits // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedRooms: freezed == selectedRooms
          ? _value._selectedRooms
          : selectedRooms // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      selectedRoomsObject: freezed == selectedRoomsObject
          ? _value._selectedRoomsObject
          : selectedRoomsObject // ignore: cast_nullable_to_non_nullable
              as List<Room>?,
      availableChalet: freezed == availableChalet
          ? _value._availableChalet
          : availableChalet // ignore: cast_nullable_to_non_nullable
              as List<Room>?,
      extraPrice: freezed == extraPrice
          ? _value._extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>?,
      extraPriceTotal: freezed == extraPriceTotal
          ? _value.extraPriceTotal
          : extraPriceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_ReservationState implements _ReservationState {
  const _$_ReservationState(
      {this.status,
      this.addToCartStatus,
      this.name,
      this.lastname,
      this.email,
      this.phone,
      this.checkIn,
      this.checkOut,
      this.available,
      this.totalPrice,
      this.totalPriceOnSale,
      this.nbNights,
      this.guests,
      this.activityDuration,
      this.id,
      this.url,
      this.title,
      this.address,
      this.typeHost,
      this.salePrice,
      this.perPerson,
      this.minNuits,
      this.price,
      this.errorText,
      final List<int>? selectedRooms,
      final List<Room>? selectedRoomsObject,
      final List<Room>? availableChalet,
      final List<ExtraPrice>? extraPrice,
      this.extraPriceTotal})
      : _selectedRooms = selectedRooms,
        _selectedRoomsObject = selectedRoomsObject,
        _availableChalet = availableChalet,
        _extraPrice = extraPrice;

  @override
  final StateStatus? status;
  @override
  final StateStatus? addToCartStatus;
  @override
  final String? name;
  @override
  final String? lastname;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? checkIn;
  @override
  final String? checkOut;
  @override
  final bool? available;
  @override
  final String? totalPrice;
  @override
  final String? totalPriceOnSale;
  @override
  final String? nbNights;
  @override
  final int? guests;
  @override
  final String? activityDuration;
  @override
  final String? id;
  @override
  final String? url;
  @override
  final String? title;
  @override
  final String? address;
  @override
  final String? typeHost;
  @override
  final String? salePrice;
  @override
  final String? perPerson;
  @override
  final int? minNuits;
  @override
  final String? price;
  @override
  final String? errorText;
  final List<int>? _selectedRooms;
  @override
  List<int>? get selectedRooms {
    final value = _selectedRooms;
    if (value == null) return null;
    if (_selectedRooms is EqualUnmodifiableListView) return _selectedRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Room>? _selectedRoomsObject;
  @override
  List<Room>? get selectedRoomsObject {
    final value = _selectedRoomsObject;
    if (value == null) return null;
    if (_selectedRoomsObject is EqualUnmodifiableListView)
      return _selectedRoomsObject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Room>? _availableChalet;
  @override
  List<Room>? get availableChalet {
    final value = _availableChalet;
    if (value == null) return null;
    if (_availableChalet is EqualUnmodifiableListView) return _availableChalet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ExtraPrice>? _extraPrice;
  @override
  List<ExtraPrice>? get extraPrice {
    final value = _extraPrice;
    if (value == null) return null;
    if (_extraPrice is EqualUnmodifiableListView) return _extraPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? extraPriceTotal;

  @override
  String toString() {
    return 'ReservationState(status: $status, addToCartStatus: $addToCartStatus, name: $name, lastname: $lastname, email: $email, phone: $phone, checkIn: $checkIn, checkOut: $checkOut, available: $available, totalPrice: $totalPrice, totalPriceOnSale: $totalPriceOnSale, nbNights: $nbNights, guests: $guests, activityDuration: $activityDuration, id: $id, url: $url, title: $title, address: $address, typeHost: $typeHost, salePrice: $salePrice, perPerson: $perPerson, minNuits: $minNuits, price: $price, errorText: $errorText, selectedRooms: $selectedRooms, selectedRoomsObject: $selectedRoomsObject, availableChalet: $availableChalet, extraPrice: $extraPrice, extraPriceTotal: $extraPriceTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReservationState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.addToCartStatus, addToCartStatus) ||
                other.addToCartStatus == addToCartStatus) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.checkIn, checkIn) || other.checkIn == checkIn) &&
            (identical(other.checkOut, checkOut) ||
                other.checkOut == checkOut) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.totalPriceOnSale, totalPriceOnSale) ||
                other.totalPriceOnSale == totalPriceOnSale) &&
            (identical(other.nbNights, nbNights) ||
                other.nbNights == nbNights) &&
            (identical(other.guests, guests) || other.guests == guests) &&
            (identical(other.activityDuration, activityDuration) ||
                other.activityDuration == activityDuration) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.typeHost, typeHost) ||
                other.typeHost == typeHost) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.perPerson, perPerson) ||
                other.perPerson == perPerson) &&
            (identical(other.minNuits, minNuits) ||
                other.minNuits == minNuits) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            const DeepCollectionEquality()
                .equals(other._selectedRooms, _selectedRooms) &&
            const DeepCollectionEquality()
                .equals(other._selectedRoomsObject, _selectedRoomsObject) &&
            const DeepCollectionEquality()
                .equals(other._availableChalet, _availableChalet) &&
            const DeepCollectionEquality()
                .equals(other._extraPrice, _extraPrice) &&
            (identical(other.extraPriceTotal, extraPriceTotal) ||
                other.extraPriceTotal == extraPriceTotal));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        addToCartStatus,
        name,
        lastname,
        email,
        phone,
        checkIn,
        checkOut,
        available,
        totalPrice,
        totalPriceOnSale,
        nbNights,
        guests,
        activityDuration,
        id,
        url,
        title,
        address,
        typeHost,
        salePrice,
        perPerson,
        minNuits,
        price,
        errorText,
        const DeepCollectionEquality().hash(_selectedRooms),
        const DeepCollectionEquality().hash(_selectedRoomsObject),
        const DeepCollectionEquality().hash(_availableChalet),
        const DeepCollectionEquality().hash(_extraPrice),
        extraPriceTotal
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReservationStateCopyWith<_$_ReservationState> get copyWith =>
      __$$_ReservationStateCopyWithImpl<_$_ReservationState>(this, _$identity);
}

abstract class _ReservationState implements ReservationState {
  const factory _ReservationState(
      {final StateStatus? status,
      final StateStatus? addToCartStatus,
      final String? name,
      final String? lastname,
      final String? email,
      final String? phone,
      final String? checkIn,
      final String? checkOut,
      final bool? available,
      final String? totalPrice,
      final String? totalPriceOnSale,
      final String? nbNights,
      final int? guests,
      final String? activityDuration,
      final String? id,
      final String? url,
      final String? title,
      final String? address,
      final String? typeHost,
      final String? salePrice,
      final String? perPerson,
      final int? minNuits,
      final String? price,
      final String? errorText,
      final List<int>? selectedRooms,
      final List<Room>? selectedRoomsObject,
      final List<Room>? availableChalet,
      final List<ExtraPrice>? extraPrice,
      final double? extraPriceTotal}) = _$_ReservationState;

  @override
  StateStatus? get status;
  @override
  StateStatus? get addToCartStatus;
  @override
  String? get name;
  @override
  String? get lastname;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get checkIn;
  @override
  String? get checkOut;
  @override
  bool? get available;
  @override
  String? get totalPrice;
  @override
  String? get totalPriceOnSale;
  @override
  String? get nbNights;
  @override
  int? get guests;
  @override
  String? get activityDuration;
  @override
  String? get id;
  @override
  String? get url;
  @override
  String? get title;
  @override
  String? get address;
  @override
  String? get typeHost;
  @override
  String? get salePrice;
  @override
  String? get perPerson;
  @override
  int? get minNuits;
  @override
  String? get price;
  @override
  String? get errorText;
  @override
  List<int>? get selectedRooms;
  @override
  List<Room>? get selectedRoomsObject;
  @override
  List<Room>? get availableChalet;
  @override
  List<ExtraPrice>? get extraPrice;
  @override
  double? get extraPriceTotal;
  @override
  @JsonKey(ignore: true)
  _$$_ReservationStateCopyWith<_$_ReservationState> get copyWith =>
      throw _privateConstructorUsedError;
}
