// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSectionHosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSectionHosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSectionHosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSectionHosts value) getSectionHosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSectionHosts value)? getSectionHosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSectionHosts value)? getSectionHosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEventCopyWith<$Res> {
  factory $HomePageEventCopyWith(
          HomePageEvent value, $Res Function(HomePageEvent) then) =
      _$HomePageEventCopyWithImpl<$Res, HomePageEvent>;
}

/// @nodoc
class _$HomePageEventCopyWithImpl<$Res, $Val extends HomePageEvent>
    implements $HomePageEventCopyWith<$Res> {
  _$HomePageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetSectionHostsCopyWith<$Res> {
  factory _$$GetSectionHostsCopyWith(
          _$GetSectionHosts value, $Res Function(_$GetSectionHosts) then) =
      __$$GetSectionHostsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetSectionHostsCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res, _$GetSectionHosts>
    implements _$$GetSectionHostsCopyWith<$Res> {
  __$$GetSectionHostsCopyWithImpl(
      _$GetSectionHosts _value, $Res Function(_$GetSectionHosts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetSectionHosts implements GetSectionHosts {
  const _$GetSectionHosts();

  @override
  String toString() {
    return 'HomePageEvent.getSectionHosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetSectionHosts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getSectionHosts,
  }) {
    return getSectionHosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getSectionHosts,
  }) {
    return getSectionHosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getSectionHosts,
    required TResult orElse(),
  }) {
    if (getSectionHosts != null) {
      return getSectionHosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSectionHosts value) getSectionHosts,
  }) {
    return getSectionHosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSectionHosts value)? getSectionHosts,
  }) {
    return getSectionHosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSectionHosts value)? getSectionHosts,
    required TResult orElse(),
  }) {
    if (getSectionHosts != null) {
      return getSectionHosts(this);
    }
    return orElse();
  }
}

abstract class GetSectionHosts implements HomePageEvent {
  const factory GetSectionHosts() = _$GetSectionHosts;
}

/// @nodoc
mixin _$HomePageState {
  List<Host>? get listHosts => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  String? get currentImage => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get currencies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {List<Host>? listHosts,
      StateStatus? status,
      String? currentImage,
      Map<dynamic, dynamic>? currencies});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listHosts = freezed,
    Object? status = freezed,
    Object? currentImage = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_value.copyWith(
      listHosts: freezed == listHosts
          ? _value.listHosts
          : listHosts // ignore: cast_nullable_to_non_nullable
              as List<Host>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as String?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HostStateCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$_HostStateCopyWith(
          _$_HostState value, $Res Function(_$_HostState) then) =
      __$$_HostStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Host>? listHosts,
      StateStatus? status,
      String? currentImage,
      Map<dynamic, dynamic>? currencies});
}

/// @nodoc
class __$$_HostStateCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$_HostState>
    implements _$$_HostStateCopyWith<$Res> {
  __$$_HostStateCopyWithImpl(
      _$_HostState _value, $Res Function(_$_HostState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listHosts = freezed,
    Object? status = freezed,
    Object? currentImage = freezed,
    Object? currencies = freezed,
  }) {
    return _then(_$_HostState(
      listHosts: freezed == listHosts
          ? _value._listHosts
          : listHosts // ignore: cast_nullable_to_non_nullable
              as List<Host>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as String?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
    ));
  }
}

/// @nodoc

class _$_HostState implements _HostState {
  const _$_HostState(
      {final List<Host>? listHosts,
      this.status,
      this.currentImage,
      final Map<dynamic, dynamic>? currencies})
      : _listHosts = listHosts,
        _currencies = currencies;

  final List<Host>? _listHosts;
  @override
  List<Host>? get listHosts {
    final value = _listHosts;
    if (value == null) return null;
    if (_listHosts is EqualUnmodifiableListView) return _listHosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final StateStatus? status;
  @override
  final String? currentImage;
  final Map<dynamic, dynamic>? _currencies;
  @override
  Map<dynamic, dynamic>? get currencies {
    final value = _currencies;
    if (value == null) return null;
    if (_currencies is EqualUnmodifiableMapView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'HomePageState(listHosts: $listHosts, status: $status, currentImage: $currentImage, currencies: $currencies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HostState &&
            const DeepCollectionEquality()
                .equals(other._listHosts, _listHosts) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentImage, currentImage) ||
                other.currentImage == currentImage) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listHosts),
      status,
      currentImage,
      const DeepCollectionEquality().hash(_currencies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostStateCopyWith<_$_HostState> get copyWith =>
      __$$_HostStateCopyWithImpl<_$_HostState>(this, _$identity);
}

abstract class _HostState implements HomePageState {
  const factory _HostState(
      {final List<Host>? listHosts,
      final StateStatus? status,
      final String? currentImage,
      final Map<dynamic, dynamic>? currencies}) = _$_HostState;

  @override
  List<Host>? get listHosts;
  @override
  StateStatus? get status;
  @override
  String? get currentImage;
  @override
  Map<dynamic, dynamic>? get currencies;
  @override
  @JsonKey(ignore: true)
  _$$_HostStateCopyWith<_$_HostState> get copyWith =>
      throw _privateConstructorUsedError;
}
