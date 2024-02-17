// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getHostDetails,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceChecked,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceUnChecked,
    required TResult Function(ExtraPrice extraPrice, int i)
        onChangExtraPriceNumber,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
    required TResult Function(List<ExtraPrice> list) setExtraPriceList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult? Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
    TResult? Function(List<ExtraPrice> list)? setExtraPriceList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    TResult Function(List<ExtraPrice> list)? setExtraPriceList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHostDetails value) getHostDetails,
    required TResult Function(_OnExtraPriceChecked value) onExtraPriceChecked,
    required TResult Function(_OnExtraPriceUnChecked value)
        onExtraPriceUnChecked,
    required TResult Function(_OnChangedExtraPriceNumber value)
        onChangExtraPriceNumber,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
    required TResult Function(_SetExtraPriceList value) setExtraPriceList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
    TResult? Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult? Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult? Function(_OnChangedExtraPriceNumber value)?
        onChangExtraPriceNumber,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult? Function(_SetExtraPriceList value)? setExtraPriceList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    TResult Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult Function(_OnChangedExtraPriceNumber value)? onChangExtraPriceNumber,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult Function(_SetExtraPriceList value)? setExtraPriceList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsPageEventCopyWith<$Res> {
  factory $DetailsPageEventCopyWith(
          DetailsPageEvent value, $Res Function(DetailsPageEvent) then) =
      _$DetailsPageEventCopyWithImpl<$Res, DetailsPageEvent>;
}

/// @nodoc
class _$DetailsPageEventCopyWithImpl<$Res, $Val extends DetailsPageEvent>
    implements $DetailsPageEventCopyWith<$Res> {
  _$DetailsPageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetHostDetailsCopyWith<$Res> {
  factory _$$GetHostDetailsCopyWith(
          _$GetHostDetails value, $Res Function(_$GetHostDetails) then) =
      __$$GetHostDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetHostDetailsCopyWithImpl<$Res>
    extends _$DetailsPageEventCopyWithImpl<$Res, _$GetHostDetails>
    implements _$$GetHostDetailsCopyWith<$Res> {
  __$$GetHostDetailsCopyWithImpl(
      _$GetHostDetails _value, $Res Function(_$GetHostDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetHostDetails(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetHostDetails implements GetHostDetails {
  const _$GetHostDetails(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'DetailsPageEvent.getHostDetails(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHostDetails &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHostDetailsCopyWith<_$GetHostDetails> get copyWith =>
      __$$GetHostDetailsCopyWithImpl<_$GetHostDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getHostDetails,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceChecked,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceUnChecked,
    required TResult Function(ExtraPrice extraPrice, int i)
        onChangExtraPriceNumber,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
    required TResult Function(List<ExtraPrice> list) setExtraPriceList,
  }) {
    return getHostDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult? Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
    TResult? Function(List<ExtraPrice> list)? setExtraPriceList,
  }) {
    return getHostDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    TResult Function(List<ExtraPrice> list)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (getHostDetails != null) {
      return getHostDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHostDetails value) getHostDetails,
    required TResult Function(_OnExtraPriceChecked value) onExtraPriceChecked,
    required TResult Function(_OnExtraPriceUnChecked value)
        onExtraPriceUnChecked,
    required TResult Function(_OnChangedExtraPriceNumber value)
        onChangExtraPriceNumber,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
    required TResult Function(_SetExtraPriceList value) setExtraPriceList,
  }) {
    return getHostDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
    TResult? Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult? Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult? Function(_OnChangedExtraPriceNumber value)?
        onChangExtraPriceNumber,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult? Function(_SetExtraPriceList value)? setExtraPriceList,
  }) {
    return getHostDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    TResult Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult Function(_OnChangedExtraPriceNumber value)? onChangExtraPriceNumber,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult Function(_SetExtraPriceList value)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (getHostDetails != null) {
      return getHostDetails(this);
    }
    return orElse();
  }
}

abstract class GetHostDetails implements DetailsPageEvent {
  const factory GetHostDetails(final int id) = _$GetHostDetails;

  int get id;
  @JsonKey(ignore: true)
  _$$GetHostDetailsCopyWith<_$GetHostDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnExtraPriceCheckedCopyWith<$Res> {
  factory _$$_OnExtraPriceCheckedCopyWith(_$_OnExtraPriceChecked value,
          $Res Function(_$_OnExtraPriceChecked) then) =
      __$$_OnExtraPriceCheckedCopyWithImpl<$Res>;
  @useResult
  $Res call({ExtraPrice extraPrice});
}

/// @nodoc
class __$$_OnExtraPriceCheckedCopyWithImpl<$Res>
    extends _$DetailsPageEventCopyWithImpl<$Res, _$_OnExtraPriceChecked>
    implements _$$_OnExtraPriceCheckedCopyWith<$Res> {
  __$$_OnExtraPriceCheckedCopyWithImpl(_$_OnExtraPriceChecked _value,
      $Res Function(_$_OnExtraPriceChecked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraPrice = null,
  }) {
    return _then(_$_OnExtraPriceChecked(
      null == extraPrice
          ? _value.extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as ExtraPrice,
    ));
  }
}

/// @nodoc

class _$_OnExtraPriceChecked implements _OnExtraPriceChecked {
  const _$_OnExtraPriceChecked(this.extraPrice);

  @override
  final ExtraPrice extraPrice;

  @override
  String toString() {
    return 'DetailsPageEvent.onExtraPriceChecked(extraPrice: $extraPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnExtraPriceChecked &&
            (identical(other.extraPrice, extraPrice) ||
                other.extraPrice == extraPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, extraPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnExtraPriceCheckedCopyWith<_$_OnExtraPriceChecked> get copyWith =>
      __$$_OnExtraPriceCheckedCopyWithImpl<_$_OnExtraPriceChecked>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getHostDetails,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceChecked,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceUnChecked,
    required TResult Function(ExtraPrice extraPrice, int i)
        onChangExtraPriceNumber,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
    required TResult Function(List<ExtraPrice> list) setExtraPriceList,
  }) {
    return onExtraPriceChecked(extraPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult? Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
    TResult? Function(List<ExtraPrice> list)? setExtraPriceList,
  }) {
    return onExtraPriceChecked?.call(extraPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    TResult Function(List<ExtraPrice> list)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (onExtraPriceChecked != null) {
      return onExtraPriceChecked(extraPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHostDetails value) getHostDetails,
    required TResult Function(_OnExtraPriceChecked value) onExtraPriceChecked,
    required TResult Function(_OnExtraPriceUnChecked value)
        onExtraPriceUnChecked,
    required TResult Function(_OnChangedExtraPriceNumber value)
        onChangExtraPriceNumber,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
    required TResult Function(_SetExtraPriceList value) setExtraPriceList,
  }) {
    return onExtraPriceChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
    TResult? Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult? Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult? Function(_OnChangedExtraPriceNumber value)?
        onChangExtraPriceNumber,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult? Function(_SetExtraPriceList value)? setExtraPriceList,
  }) {
    return onExtraPriceChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    TResult Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult Function(_OnChangedExtraPriceNumber value)? onChangExtraPriceNumber,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult Function(_SetExtraPriceList value)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (onExtraPriceChecked != null) {
      return onExtraPriceChecked(this);
    }
    return orElse();
  }
}

abstract class _OnExtraPriceChecked implements DetailsPageEvent {
  const factory _OnExtraPriceChecked(final ExtraPrice extraPrice) =
      _$_OnExtraPriceChecked;

  ExtraPrice get extraPrice;
  @JsonKey(ignore: true)
  _$$_OnExtraPriceCheckedCopyWith<_$_OnExtraPriceChecked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnExtraPriceUnCheckedCopyWith<$Res> {
  factory _$$_OnExtraPriceUnCheckedCopyWith(_$_OnExtraPriceUnChecked value,
          $Res Function(_$_OnExtraPriceUnChecked) then) =
      __$$_OnExtraPriceUnCheckedCopyWithImpl<$Res>;
  @useResult
  $Res call({ExtraPrice extraPrice});
}

/// @nodoc
class __$$_OnExtraPriceUnCheckedCopyWithImpl<$Res>
    extends _$DetailsPageEventCopyWithImpl<$Res, _$_OnExtraPriceUnChecked>
    implements _$$_OnExtraPriceUnCheckedCopyWith<$Res> {
  __$$_OnExtraPriceUnCheckedCopyWithImpl(_$_OnExtraPriceUnChecked _value,
      $Res Function(_$_OnExtraPriceUnChecked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraPrice = null,
  }) {
    return _then(_$_OnExtraPriceUnChecked(
      null == extraPrice
          ? _value.extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as ExtraPrice,
    ));
  }
}

/// @nodoc

class _$_OnExtraPriceUnChecked implements _OnExtraPriceUnChecked {
  const _$_OnExtraPriceUnChecked(this.extraPrice);

  @override
  final ExtraPrice extraPrice;

  @override
  String toString() {
    return 'DetailsPageEvent.onExtraPriceUnChecked(extraPrice: $extraPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnExtraPriceUnChecked &&
            (identical(other.extraPrice, extraPrice) ||
                other.extraPrice == extraPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, extraPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnExtraPriceUnCheckedCopyWith<_$_OnExtraPriceUnChecked> get copyWith =>
      __$$_OnExtraPriceUnCheckedCopyWithImpl<_$_OnExtraPriceUnChecked>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getHostDetails,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceChecked,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceUnChecked,
    required TResult Function(ExtraPrice extraPrice, int i)
        onChangExtraPriceNumber,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
    required TResult Function(List<ExtraPrice> list) setExtraPriceList,
  }) {
    return onExtraPriceUnChecked(extraPrice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult? Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
    TResult? Function(List<ExtraPrice> list)? setExtraPriceList,
  }) {
    return onExtraPriceUnChecked?.call(extraPrice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    TResult Function(List<ExtraPrice> list)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (onExtraPriceUnChecked != null) {
      return onExtraPriceUnChecked(extraPrice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHostDetails value) getHostDetails,
    required TResult Function(_OnExtraPriceChecked value) onExtraPriceChecked,
    required TResult Function(_OnExtraPriceUnChecked value)
        onExtraPriceUnChecked,
    required TResult Function(_OnChangedExtraPriceNumber value)
        onChangExtraPriceNumber,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
    required TResult Function(_SetExtraPriceList value) setExtraPriceList,
  }) {
    return onExtraPriceUnChecked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
    TResult? Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult? Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult? Function(_OnChangedExtraPriceNumber value)?
        onChangExtraPriceNumber,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult? Function(_SetExtraPriceList value)? setExtraPriceList,
  }) {
    return onExtraPriceUnChecked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    TResult Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult Function(_OnChangedExtraPriceNumber value)? onChangExtraPriceNumber,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult Function(_SetExtraPriceList value)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (onExtraPriceUnChecked != null) {
      return onExtraPriceUnChecked(this);
    }
    return orElse();
  }
}

abstract class _OnExtraPriceUnChecked implements DetailsPageEvent {
  const factory _OnExtraPriceUnChecked(final ExtraPrice extraPrice) =
      _$_OnExtraPriceUnChecked;

  ExtraPrice get extraPrice;
  @JsonKey(ignore: true)
  _$$_OnExtraPriceUnCheckedCopyWith<_$_OnExtraPriceUnChecked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnChangedExtraPriceNumberCopyWith<$Res> {
  factory _$$_OnChangedExtraPriceNumberCopyWith(
          _$_OnChangedExtraPriceNumber value,
          $Res Function(_$_OnChangedExtraPriceNumber) then) =
      __$$_OnChangedExtraPriceNumberCopyWithImpl<$Res>;
  @useResult
  $Res call({ExtraPrice extraPrice, int i});
}

/// @nodoc
class __$$_OnChangedExtraPriceNumberCopyWithImpl<$Res>
    extends _$DetailsPageEventCopyWithImpl<$Res, _$_OnChangedExtraPriceNumber>
    implements _$$_OnChangedExtraPriceNumberCopyWith<$Res> {
  __$$_OnChangedExtraPriceNumberCopyWithImpl(
      _$_OnChangedExtraPriceNumber _value,
      $Res Function(_$_OnChangedExtraPriceNumber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extraPrice = null,
    Object? i = null,
  }) {
    return _then(_$_OnChangedExtraPriceNumber(
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

class _$_OnChangedExtraPriceNumber implements _OnChangedExtraPriceNumber {
  const _$_OnChangedExtraPriceNumber(this.extraPrice, this.i);

  @override
  final ExtraPrice extraPrice;
  @override
  final int i;

  @override
  String toString() {
    return 'DetailsPageEvent.onChangExtraPriceNumber(extraPrice: $extraPrice, i: $i)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnChangedExtraPriceNumber &&
            (identical(other.extraPrice, extraPrice) ||
                other.extraPrice == extraPrice) &&
            (identical(other.i, i) || other.i == i));
  }

  @override
  int get hashCode => Object.hash(runtimeType, extraPrice, i);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OnChangedExtraPriceNumberCopyWith<_$_OnChangedExtraPriceNumber>
      get copyWith => __$$_OnChangedExtraPriceNumberCopyWithImpl<
          _$_OnChangedExtraPriceNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getHostDetails,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceChecked,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceUnChecked,
    required TResult Function(ExtraPrice extraPrice, int i)
        onChangExtraPriceNumber,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
    required TResult Function(List<ExtraPrice> list) setExtraPriceList,
  }) {
    return onChangExtraPriceNumber(extraPrice, i);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult? Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
    TResult? Function(List<ExtraPrice> list)? setExtraPriceList,
  }) {
    return onChangExtraPriceNumber?.call(extraPrice, i);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    TResult Function(List<ExtraPrice> list)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (onChangExtraPriceNumber != null) {
      return onChangExtraPriceNumber(extraPrice, i);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHostDetails value) getHostDetails,
    required TResult Function(_OnExtraPriceChecked value) onExtraPriceChecked,
    required TResult Function(_OnExtraPriceUnChecked value)
        onExtraPriceUnChecked,
    required TResult Function(_OnChangedExtraPriceNumber value)
        onChangExtraPriceNumber,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
    required TResult Function(_SetExtraPriceList value) setExtraPriceList,
  }) {
    return onChangExtraPriceNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
    TResult? Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult? Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult? Function(_OnChangedExtraPriceNumber value)?
        onChangExtraPriceNumber,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult? Function(_SetExtraPriceList value)? setExtraPriceList,
  }) {
    return onChangExtraPriceNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    TResult Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult Function(_OnChangedExtraPriceNumber value)? onChangExtraPriceNumber,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult Function(_SetExtraPriceList value)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (onChangExtraPriceNumber != null) {
      return onChangExtraPriceNumber(this);
    }
    return orElse();
  }
}

abstract class _OnChangedExtraPriceNumber implements DetailsPageEvent {
  const factory _OnChangedExtraPriceNumber(
      final ExtraPrice extraPrice, final int i) = _$_OnChangedExtraPriceNumber;

  ExtraPrice get extraPrice;
  int get i;
  @JsonKey(ignore: true)
  _$$_OnChangedExtraPriceNumberCopyWith<_$_OnChangedExtraPriceNumber>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$DetailsPageEventCopyWithImpl<$Res, _$_OnExtraPriceQuantityChanged>
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
    return 'DetailsPageEvent.onExtraPriceQuantityChanged(extraPrice: $extraPrice, i: $i)';
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
    required TResult Function(int id) getHostDetails,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceChecked,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceUnChecked,
    required TResult Function(ExtraPrice extraPrice, int i)
        onChangExtraPriceNumber,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
    required TResult Function(List<ExtraPrice> list) setExtraPriceList,
  }) {
    return onExtraPriceQuantityChanged(extraPrice, i);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult? Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
    TResult? Function(List<ExtraPrice> list)? setExtraPriceList,
  }) {
    return onExtraPriceQuantityChanged?.call(extraPrice, i);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    TResult Function(List<ExtraPrice> list)? setExtraPriceList,
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
    required TResult Function(GetHostDetails value) getHostDetails,
    required TResult Function(_OnExtraPriceChecked value) onExtraPriceChecked,
    required TResult Function(_OnExtraPriceUnChecked value)
        onExtraPriceUnChecked,
    required TResult Function(_OnChangedExtraPriceNumber value)
        onChangExtraPriceNumber,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
    required TResult Function(_SetExtraPriceList value) setExtraPriceList,
  }) {
    return onExtraPriceQuantityChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
    TResult? Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult? Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult? Function(_OnChangedExtraPriceNumber value)?
        onChangExtraPriceNumber,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult? Function(_SetExtraPriceList value)? setExtraPriceList,
  }) {
    return onExtraPriceQuantityChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    TResult Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult Function(_OnChangedExtraPriceNumber value)? onChangExtraPriceNumber,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult Function(_SetExtraPriceList value)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (onExtraPriceQuantityChanged != null) {
      return onExtraPriceQuantityChanged(this);
    }
    return orElse();
  }
}

abstract class _OnExtraPriceQuantityChanged implements DetailsPageEvent {
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
abstract class _$$_SetExtraPriceListCopyWith<$Res> {
  factory _$$_SetExtraPriceListCopyWith(_$_SetExtraPriceList value,
          $Res Function(_$_SetExtraPriceList) then) =
      __$$_SetExtraPriceListCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ExtraPrice> list});
}

/// @nodoc
class __$$_SetExtraPriceListCopyWithImpl<$Res>
    extends _$DetailsPageEventCopyWithImpl<$Res, _$_SetExtraPriceList>
    implements _$$_SetExtraPriceListCopyWith<$Res> {
  __$$_SetExtraPriceListCopyWithImpl(
      _$_SetExtraPriceList _value, $Res Function(_$_SetExtraPriceList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_SetExtraPriceList(
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>,
    ));
  }
}

/// @nodoc

class _$_SetExtraPriceList implements _SetExtraPriceList {
  const _$_SetExtraPriceList(final List<ExtraPrice> list) : _list = list;

  final List<ExtraPrice> _list;
  @override
  List<ExtraPrice> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'DetailsPageEvent.setExtraPriceList(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetExtraPriceList &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetExtraPriceListCopyWith<_$_SetExtraPriceList> get copyWith =>
      __$$_SetExtraPriceListCopyWithImpl<_$_SetExtraPriceList>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getHostDetails,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceChecked,
    required TResult Function(ExtraPrice extraPrice) onExtraPriceUnChecked,
    required TResult Function(ExtraPrice extraPrice, int i)
        onChangExtraPriceNumber,
    required TResult Function(ExtraPrice extraPrice, int i)
        onExtraPriceQuantityChanged,
    required TResult Function(List<ExtraPrice> list) setExtraPriceList,
  }) {
    return setExtraPriceList(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult? Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult? Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult? Function(ExtraPrice extraPrice, int i)?
        onExtraPriceQuantityChanged,
    TResult? Function(List<ExtraPrice> list)? setExtraPriceList,
  }) {
    return setExtraPriceList?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceChecked,
    TResult Function(ExtraPrice extraPrice)? onExtraPriceUnChecked,
    TResult Function(ExtraPrice extraPrice, int i)? onChangExtraPriceNumber,
    TResult Function(ExtraPrice extraPrice, int i)? onExtraPriceQuantityChanged,
    TResult Function(List<ExtraPrice> list)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (setExtraPriceList != null) {
      return setExtraPriceList(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHostDetails value) getHostDetails,
    required TResult Function(_OnExtraPriceChecked value) onExtraPriceChecked,
    required TResult Function(_OnExtraPriceUnChecked value)
        onExtraPriceUnChecked,
    required TResult Function(_OnChangedExtraPriceNumber value)
        onChangExtraPriceNumber,
    required TResult Function(_OnExtraPriceQuantityChanged value)
        onExtraPriceQuantityChanged,
    required TResult Function(_SetExtraPriceList value) setExtraPriceList,
  }) {
    return setExtraPriceList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
    TResult? Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult? Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult? Function(_OnChangedExtraPriceNumber value)?
        onChangExtraPriceNumber,
    TResult? Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult? Function(_SetExtraPriceList value)? setExtraPriceList,
  }) {
    return setExtraPriceList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    TResult Function(_OnExtraPriceChecked value)? onExtraPriceChecked,
    TResult Function(_OnExtraPriceUnChecked value)? onExtraPriceUnChecked,
    TResult Function(_OnChangedExtraPriceNumber value)? onChangExtraPriceNumber,
    TResult Function(_OnExtraPriceQuantityChanged value)?
        onExtraPriceQuantityChanged,
    TResult Function(_SetExtraPriceList value)? setExtraPriceList,
    required TResult orElse(),
  }) {
    if (setExtraPriceList != null) {
      return setExtraPriceList(this);
    }
    return orElse();
  }
}

abstract class _SetExtraPriceList implements DetailsPageEvent {
  const factory _SetExtraPriceList(final List<ExtraPrice> list) =
      _$_SetExtraPriceList;

  List<ExtraPrice> get list;
  @JsonKey(ignore: true)
  _$$_SetExtraPriceListCopyWith<_$_SetExtraPriceList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailsPageState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  HostDetails? get hostDetails => throw _privateConstructorUsedError;
  List<ExtraPrice>? get extraPrice => throw _privateConstructorUsedError;
  List<ExtraPrice>? get extraPriceDraft => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get extraPriceObjet =>
      throw _privateConstructorUsedError;
  double? get extraPriceTotal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsPageStateCopyWith<DetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsPageStateCopyWith<$Res> {
  factory $DetailsPageStateCopyWith(
          DetailsPageState value, $Res Function(DetailsPageState) then) =
      _$DetailsPageStateCopyWithImpl<$Res, DetailsPageState>;
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      HostDetails? hostDetails,
      List<ExtraPrice>? extraPrice,
      List<ExtraPrice>? extraPriceDraft,
      List<Map<String, dynamic>>? extraPriceObjet,
      double? extraPriceTotal});
}

/// @nodoc
class _$DetailsPageStateCopyWithImpl<$Res, $Val extends DetailsPageState>
    implements $DetailsPageStateCopyWith<$Res> {
  _$DetailsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? hostDetails = freezed,
    Object? extraPrice = freezed,
    Object? extraPriceDraft = freezed,
    Object? extraPriceObjet = freezed,
    Object? extraPriceTotal = freezed,
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
      hostDetails: freezed == hostDetails
          ? _value.hostDetails
          : hostDetails // ignore: cast_nullable_to_non_nullable
              as HostDetails?,
      extraPrice: freezed == extraPrice
          ? _value.extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>?,
      extraPriceDraft: freezed == extraPriceDraft
          ? _value.extraPriceDraft
          : extraPriceDraft // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>?,
      extraPriceObjet: freezed == extraPriceObjet
          ? _value.extraPriceObjet
          : extraPriceObjet // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      extraPriceTotal: freezed == extraPriceTotal
          ? _value.extraPriceTotal
          : extraPriceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsPageStateCopyWith<$Res>
    implements $DetailsPageStateCopyWith<$Res> {
  factory _$$_DetailsPageStateCopyWith(
          _$_DetailsPageState value, $Res Function(_$_DetailsPageState) then) =
      __$$_DetailsPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      HostDetails? hostDetails,
      List<ExtraPrice>? extraPrice,
      List<ExtraPrice>? extraPriceDraft,
      List<Map<String, dynamic>>? extraPriceObjet,
      double? extraPriceTotal});
}

/// @nodoc
class __$$_DetailsPageStateCopyWithImpl<$Res>
    extends _$DetailsPageStateCopyWithImpl<$Res, _$_DetailsPageState>
    implements _$$_DetailsPageStateCopyWith<$Res> {
  __$$_DetailsPageStateCopyWithImpl(
      _$_DetailsPageState _value, $Res Function(_$_DetailsPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? hostDetails = freezed,
    Object? extraPrice = freezed,
    Object? extraPriceDraft = freezed,
    Object? extraPriceObjet = freezed,
    Object? extraPriceTotal = freezed,
  }) {
    return _then(_$_DetailsPageState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      hostDetails: freezed == hostDetails
          ? _value.hostDetails
          : hostDetails // ignore: cast_nullable_to_non_nullable
              as HostDetails?,
      extraPrice: freezed == extraPrice
          ? _value._extraPrice
          : extraPrice // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>?,
      extraPriceDraft: freezed == extraPriceDraft
          ? _value._extraPriceDraft
          : extraPriceDraft // ignore: cast_nullable_to_non_nullable
              as List<ExtraPrice>?,
      extraPriceObjet: freezed == extraPriceObjet
          ? _value._extraPriceObjet
          : extraPriceObjet // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      extraPriceTotal: freezed == extraPriceTotal
          ? _value.extraPriceTotal
          : extraPriceTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_DetailsPageState implements _DetailsPageState {
  const _$_DetailsPageState(
      {this.title,
      this.status,
      this.hostDetails,
      final List<ExtraPrice>? extraPrice,
      final List<ExtraPrice>? extraPriceDraft,
      final List<Map<String, dynamic>>? extraPriceObjet,
      this.extraPriceTotal})
      : _extraPrice = extraPrice,
        _extraPriceDraft = extraPriceDraft,
        _extraPriceObjet = extraPriceObjet;

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final HostDetails? hostDetails;
  final List<ExtraPrice>? _extraPrice;
  @override
  List<ExtraPrice>? get extraPrice {
    final value = _extraPrice;
    if (value == null) return null;
    if (_extraPrice is EqualUnmodifiableListView) return _extraPrice;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ExtraPrice>? _extraPriceDraft;
  @override
  List<ExtraPrice>? get extraPriceDraft {
    final value = _extraPriceDraft;
    if (value == null) return null;
    if (_extraPriceDraft is EqualUnmodifiableListView) return _extraPriceDraft;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<String, dynamic>>? _extraPriceObjet;
  @override
  List<Map<String, dynamic>>? get extraPriceObjet {
    final value = _extraPriceObjet;
    if (value == null) return null;
    if (_extraPriceObjet is EqualUnmodifiableListView) return _extraPriceObjet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? extraPriceTotal;

  @override
  String toString() {
    return 'DetailsPageState(title: $title, status: $status, hostDetails: $hostDetails, extraPrice: $extraPrice, extraPriceDraft: $extraPriceDraft, extraPriceObjet: $extraPriceObjet, extraPriceTotal: $extraPriceTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsPageState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hostDetails, hostDetails) ||
                other.hostDetails == hostDetails) &&
            const DeepCollectionEquality()
                .equals(other._extraPrice, _extraPrice) &&
            const DeepCollectionEquality()
                .equals(other._extraPriceDraft, _extraPriceDraft) &&
            const DeepCollectionEquality()
                .equals(other._extraPriceObjet, _extraPriceObjet) &&
            (identical(other.extraPriceTotal, extraPriceTotal) ||
                other.extraPriceTotal == extraPriceTotal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      status,
      hostDetails,
      const DeepCollectionEquality().hash(_extraPrice),
      const DeepCollectionEquality().hash(_extraPriceDraft),
      const DeepCollectionEquality().hash(_extraPriceObjet),
      extraPriceTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsPageStateCopyWith<_$_DetailsPageState> get copyWith =>
      __$$_DetailsPageStateCopyWithImpl<_$_DetailsPageState>(this, _$identity);
}

abstract class _DetailsPageState implements DetailsPageState {
  const factory _DetailsPageState(
      {final String? title,
      final StateStatus? status,
      final HostDetails? hostDetails,
      final List<ExtraPrice>? extraPrice,
      final List<ExtraPrice>? extraPriceDraft,
      final List<Map<String, dynamic>>? extraPriceObjet,
      final double? extraPriceTotal}) = _$_DetailsPageState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  HostDetails? get hostDetails;
  @override
  List<ExtraPrice>? get extraPrice;
  @override
  List<ExtraPrice>? get extraPriceDraft;
  @override
  List<Map<String, dynamic>>? get extraPriceObjet;
  @override
  double? get extraPriceTotal;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsPageStateCopyWith<_$_DetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
