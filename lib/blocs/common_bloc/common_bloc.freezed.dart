// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommonEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSelectedCurrency,
    required TResult Function(String currency, int index) onChangeCurrency,
    required TResult Function(bool isExpanded) onExpand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSelectedCurrency,
    TResult? Function(String currency, int index)? onChangeCurrency,
    TResult? Function(bool isExpanded)? onExpand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSelectedCurrency,
    TResult Function(String currency, int index)? onChangeCurrency,
    TResult Function(bool isExpanded)? onExpand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSelectedCurrency value) getSelectedCurrency,
    required TResult Function(OnChangeCurrency value) onChangeCurrency,
    required TResult Function(OnExpand value) onExpand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult? Function(OnChangeCurrency value)? onChangeCurrency,
    TResult? Function(OnExpand value)? onExpand,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult Function(OnChangeCurrency value)? onChangeCurrency,
    TResult Function(OnExpand value)? onExpand,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonEventCopyWith<$Res> {
  factory $CommonEventCopyWith(
          CommonEvent value, $Res Function(CommonEvent) then) =
      _$CommonEventCopyWithImpl<$Res, CommonEvent>;
}

/// @nodoc
class _$CommonEventCopyWithImpl<$Res, $Val extends CommonEvent>
    implements $CommonEventCopyWith<$Res> {
  _$CommonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSelectedCurrencyCopyWith<$Res> {
  factory _$$GetSelectedCurrencyCopyWith(_$GetSelectedCurrency value,
          $Res Function(_$GetSelectedCurrency) then) =
      __$$GetSelectedCurrencyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSelectedCurrencyCopyWithImpl<$Res>
    extends _$CommonEventCopyWithImpl<$Res, _$GetSelectedCurrency>
    implements _$$GetSelectedCurrencyCopyWith<$Res> {
  __$$GetSelectedCurrencyCopyWithImpl(
      _$GetSelectedCurrency _value, $Res Function(_$GetSelectedCurrency) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSelectedCurrency implements GetSelectedCurrency {
  const _$GetSelectedCurrency();

  @override
  String toString() {
    return 'CommonEvent.getSelectedCurrency()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSelectedCurrency);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSelectedCurrency,
    required TResult Function(String currency, int index) onChangeCurrency,
    required TResult Function(bool isExpanded) onExpand,
  }) {
    return getSelectedCurrency();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSelectedCurrency,
    TResult? Function(String currency, int index)? onChangeCurrency,
    TResult? Function(bool isExpanded)? onExpand,
  }) {
    return getSelectedCurrency?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSelectedCurrency,
    TResult Function(String currency, int index)? onChangeCurrency,
    TResult Function(bool isExpanded)? onExpand,
    required TResult orElse(),
  }) {
    if (getSelectedCurrency != null) {
      return getSelectedCurrency();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSelectedCurrency value) getSelectedCurrency,
    required TResult Function(OnChangeCurrency value) onChangeCurrency,
    required TResult Function(OnExpand value) onExpand,
  }) {
    return getSelectedCurrency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult? Function(OnChangeCurrency value)? onChangeCurrency,
    TResult? Function(OnExpand value)? onExpand,
  }) {
    return getSelectedCurrency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult Function(OnChangeCurrency value)? onChangeCurrency,
    TResult Function(OnExpand value)? onExpand,
    required TResult orElse(),
  }) {
    if (getSelectedCurrency != null) {
      return getSelectedCurrency(this);
    }
    return orElse();
  }
}

abstract class GetSelectedCurrency implements CommonEvent {
  const factory GetSelectedCurrency() = _$GetSelectedCurrency;
}

/// @nodoc
abstract class _$$OnChangeCurrencyCopyWith<$Res> {
  factory _$$OnChangeCurrencyCopyWith(
          _$OnChangeCurrency value, $Res Function(_$OnChangeCurrency) then) =
      __$$OnChangeCurrencyCopyWithImpl<$Res>;
  @useResult
  $Res call({String currency, int index});
}

/// @nodoc
class __$$OnChangeCurrencyCopyWithImpl<$Res>
    extends _$CommonEventCopyWithImpl<$Res, _$OnChangeCurrency>
    implements _$$OnChangeCurrencyCopyWith<$Res> {
  __$$OnChangeCurrencyCopyWithImpl(
      _$OnChangeCurrency _value, $Res Function(_$OnChangeCurrency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? index = null,
  }) {
    return _then(_$OnChangeCurrency(
      null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$OnChangeCurrency implements OnChangeCurrency {
  const _$OnChangeCurrency(this.currency, this.index);

  @override
  final String currency;
  @override
  final int index;

  @override
  String toString() {
    return 'CommonEvent.onChangeCurrency(currency: $currency, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeCurrency &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeCurrencyCopyWith<_$OnChangeCurrency> get copyWith =>
      __$$OnChangeCurrencyCopyWithImpl<_$OnChangeCurrency>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSelectedCurrency,
    required TResult Function(String currency, int index) onChangeCurrency,
    required TResult Function(bool isExpanded) onExpand,
  }) {
    return onChangeCurrency(currency, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSelectedCurrency,
    TResult? Function(String currency, int index)? onChangeCurrency,
    TResult? Function(bool isExpanded)? onExpand,
  }) {
    return onChangeCurrency?.call(currency, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSelectedCurrency,
    TResult Function(String currency, int index)? onChangeCurrency,
    TResult Function(bool isExpanded)? onExpand,
    required TResult orElse(),
  }) {
    if (onChangeCurrency != null) {
      return onChangeCurrency(currency, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSelectedCurrency value) getSelectedCurrency,
    required TResult Function(OnChangeCurrency value) onChangeCurrency,
    required TResult Function(OnExpand value) onExpand,
  }) {
    return onChangeCurrency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult? Function(OnChangeCurrency value)? onChangeCurrency,
    TResult? Function(OnExpand value)? onExpand,
  }) {
    return onChangeCurrency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult Function(OnChangeCurrency value)? onChangeCurrency,
    TResult Function(OnExpand value)? onExpand,
    required TResult orElse(),
  }) {
    if (onChangeCurrency != null) {
      return onChangeCurrency(this);
    }
    return orElse();
  }
}

abstract class OnChangeCurrency implements CommonEvent {
  const factory OnChangeCurrency(final String currency, final int index) =
      _$OnChangeCurrency;

  String get currency;
  int get index;
  @JsonKey(ignore: true)
  _$$OnChangeCurrencyCopyWith<_$OnChangeCurrency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnExpandCopyWith<$Res> {
  factory _$$OnExpandCopyWith(
          _$OnExpand value, $Res Function(_$OnExpand) then) =
      __$$OnExpandCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isExpanded});
}

/// @nodoc
class __$$OnExpandCopyWithImpl<$Res>
    extends _$CommonEventCopyWithImpl<$Res, _$OnExpand>
    implements _$$OnExpandCopyWith<$Res> {
  __$$OnExpandCopyWithImpl(_$OnExpand _value, $Res Function(_$OnExpand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExpanded = null,
  }) {
    return _then(_$OnExpand(
      null == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OnExpand implements OnExpand {
  const _$OnExpand(this.isExpanded);

  @override
  final bool isExpanded;

  @override
  String toString() {
    return 'CommonEvent.onExpand(isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnExpand &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExpanded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnExpandCopyWith<_$OnExpand> get copyWith =>
      __$$OnExpandCopyWithImpl<_$OnExpand>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSelectedCurrency,
    required TResult Function(String currency, int index) onChangeCurrency,
    required TResult Function(bool isExpanded) onExpand,
  }) {
    return onExpand(isExpanded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSelectedCurrency,
    TResult? Function(String currency, int index)? onChangeCurrency,
    TResult? Function(bool isExpanded)? onExpand,
  }) {
    return onExpand?.call(isExpanded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSelectedCurrency,
    TResult Function(String currency, int index)? onChangeCurrency,
    TResult Function(bool isExpanded)? onExpand,
    required TResult orElse(),
  }) {
    if (onExpand != null) {
      return onExpand(isExpanded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSelectedCurrency value) getSelectedCurrency,
    required TResult Function(OnChangeCurrency value) onChangeCurrency,
    required TResult Function(OnExpand value) onExpand,
  }) {
    return onExpand(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult? Function(OnChangeCurrency value)? onChangeCurrency,
    TResult? Function(OnExpand value)? onExpand,
  }) {
    return onExpand?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSelectedCurrency value)? getSelectedCurrency,
    TResult Function(OnChangeCurrency value)? onChangeCurrency,
    TResult Function(OnExpand value)? onExpand,
    required TResult orElse(),
  }) {
    if (onExpand != null) {
      return onExpand(this);
    }
    return orElse();
  }
}

abstract class OnExpand implements CommonEvent {
  const factory OnExpand(final bool isExpanded) = _$OnExpand;

  bool get isExpanded;
  @JsonKey(ignore: true)
  _$$OnExpandCopyWith<_$OnExpand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommonState {
  StateStatus? get status => throw _privateConstructorUsedError;
  String? get currentCurrency => throw _privateConstructorUsedError;
  int? get currencyIndex => throw _privateConstructorUsedError;
  List<String>? get currencies => throw _privateConstructorUsedError;
  bool? get isExpanded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommonStateCopyWith<CommonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonStateCopyWith<$Res> {
  factory $CommonStateCopyWith(
          CommonState value, $Res Function(CommonState) then) =
      _$CommonStateCopyWithImpl<$Res, CommonState>;
  @useResult
  $Res call(
      {StateStatus? status,
      String? currentCurrency,
      int? currencyIndex,
      List<String>? currencies,
      bool? isExpanded});
}

/// @nodoc
class _$CommonStateCopyWithImpl<$Res, $Val extends CommonState>
    implements $CommonStateCopyWith<$Res> {
  _$CommonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? currentCurrency = freezed,
    Object? currencyIndex = freezed,
    Object? currencies = freezed,
    Object? isExpanded = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      currentCurrency: freezed == currentCurrency
          ? _value.currentCurrency
          : currentCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyIndex: freezed == currencyIndex
          ? _value.currencyIndex
          : currencyIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isExpanded: freezed == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommonStateCopyWith<$Res>
    implements $CommonStateCopyWith<$Res> {
  factory _$$_CommonStateCopyWith(
          _$_CommonState value, $Res Function(_$_CommonState) then) =
      __$$_CommonStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StateStatus? status,
      String? currentCurrency,
      int? currencyIndex,
      List<String>? currencies,
      bool? isExpanded});
}

/// @nodoc
class __$$_CommonStateCopyWithImpl<$Res>
    extends _$CommonStateCopyWithImpl<$Res, _$_CommonState>
    implements _$$_CommonStateCopyWith<$Res> {
  __$$_CommonStateCopyWithImpl(
      _$_CommonState _value, $Res Function(_$_CommonState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? currentCurrency = freezed,
    Object? currencyIndex = freezed,
    Object? currencies = freezed,
    Object? isExpanded = freezed,
  }) {
    return _then(_$_CommonState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      currentCurrency: freezed == currentCurrency
          ? _value.currentCurrency
          : currentCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      currencyIndex: freezed == currencyIndex
          ? _value.currencyIndex
          : currencyIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isExpanded: freezed == isExpanded
          ? _value.isExpanded
          : isExpanded // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_CommonState implements _CommonState {
  const _$_CommonState(
      {this.status,
      this.currentCurrency,
      this.currencyIndex,
      final List<String>? currencies,
      this.isExpanded})
      : _currencies = currencies;

  @override
  final StateStatus? status;
  @override
  final String? currentCurrency;
  @override
  final int? currencyIndex;
  final List<String>? _currencies;
  @override
  List<String>? get currencies {
    final value = _currencies;
    if (value == null) return null;
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isExpanded;

  @override
  String toString() {
    return 'CommonState(status: $status, currentCurrency: $currentCurrency, currencyIndex: $currencyIndex, currencies: $currencies, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommonState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentCurrency, currentCurrency) ||
                other.currentCurrency == currentCurrency) &&
            (identical(other.currencyIndex, currencyIndex) ||
                other.currencyIndex == currencyIndex) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.isExpanded, isExpanded) ||
                other.isExpanded == isExpanded));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      currentCurrency,
      currencyIndex,
      const DeepCollectionEquality().hash(_currencies),
      isExpanded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommonStateCopyWith<_$_CommonState> get copyWith =>
      __$$_CommonStateCopyWithImpl<_$_CommonState>(this, _$identity);
}

abstract class _CommonState implements CommonState {
  const factory _CommonState(
      {final StateStatus? status,
      final String? currentCurrency,
      final int? currencyIndex,
      final List<String>? currencies,
      final bool? isExpanded}) = _$_CommonState;

  @override
  StateStatus? get status;
  @override
  String? get currentCurrency;
  @override
  int? get currencyIndex;
  @override
  List<String>? get currencies;
  @override
  bool? get isExpanded;
  @override
  @JsonKey(ignore: true)
  _$$_CommonStateCopyWith<_$_CommonState> get copyWith =>
      throw _privateConstructorUsedError;
}
