// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllHosts,
    required TResult Function(int? id) getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllHosts,
    TResult? Function(int? id)? getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllHosts,
    TResult Function(int? id)? getHostDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllHosts value) getAllHosts,
    required TResult Function(GetHostDetails value) getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllHosts value)? getAllHosts,
    TResult? Function(GetHostDetails value)? getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllHosts value)? getAllHosts,
    TResult Function(GetHostDetails value)? getHostDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostEventCopyWith<$Res> {
  factory $HostEventCopyWith(HostEvent value, $Res Function(HostEvent) then) =
      _$HostEventCopyWithImpl<$Res, HostEvent>;
}

/// @nodoc
class _$HostEventCopyWithImpl<$Res, $Val extends HostEvent>
    implements $HostEventCopyWith<$Res> {
  _$HostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllHostsCopyWith<$Res> {
  factory _$$GetAllHostsCopyWith(
          _$GetAllHosts value, $Res Function(_$GetAllHosts) then) =
      __$$GetAllHostsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllHostsCopyWithImpl<$Res>
    extends _$HostEventCopyWithImpl<$Res, _$GetAllHosts>
    implements _$$GetAllHostsCopyWith<$Res> {
  __$$GetAllHostsCopyWithImpl(
      _$GetAllHosts _value, $Res Function(_$GetAllHosts) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllHosts implements GetAllHosts {
  _$GetAllHosts();

  @override
  String toString() {
    return 'HostEvent.getAllHosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllHosts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllHosts,
    required TResult Function(int? id) getHostDetails,
  }) {
    return getAllHosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllHosts,
    TResult? Function(int? id)? getHostDetails,
  }) {
    return getAllHosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllHosts,
    TResult Function(int? id)? getHostDetails,
    required TResult orElse(),
  }) {
    if (getAllHosts != null) {
      return getAllHosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllHosts value) getAllHosts,
    required TResult Function(GetHostDetails value) getHostDetails,
  }) {
    return getAllHosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllHosts value)? getAllHosts,
    TResult? Function(GetHostDetails value)? getHostDetails,
  }) {
    return getAllHosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllHosts value)? getAllHosts,
    TResult Function(GetHostDetails value)? getHostDetails,
    required TResult orElse(),
  }) {
    if (getAllHosts != null) {
      return getAllHosts(this);
    }
    return orElse();
  }
}

abstract class GetAllHosts implements HostEvent {
  factory GetAllHosts() = _$GetAllHosts;
}

/// @nodoc
abstract class _$$GetHostDetailsCopyWith<$Res> {
  factory _$$GetHostDetailsCopyWith(
          _$GetHostDetails value, $Res Function(_$GetHostDetails) then) =
      __$$GetHostDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({int? id});
}

/// @nodoc
class __$$GetHostDetailsCopyWithImpl<$Res>
    extends _$HostEventCopyWithImpl<$Res, _$GetHostDetails>
    implements _$$GetHostDetailsCopyWith<$Res> {
  __$$GetHostDetailsCopyWithImpl(
      _$GetHostDetails _value, $Res Function(_$GetHostDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$GetHostDetails(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetHostDetails implements GetHostDetails {
  _$GetHostDetails(this.id);

  @override
  final int? id;

  @override
  String toString() {
    return 'HostEvent.getHostDetails(id: $id)';
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
    required TResult Function() getAllHosts,
    required TResult Function(int? id) getHostDetails,
  }) {
    return getHostDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllHosts,
    TResult? Function(int? id)? getHostDetails,
  }) {
    return getHostDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllHosts,
    TResult Function(int? id)? getHostDetails,
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
    required TResult Function(GetAllHosts value) getAllHosts,
    required TResult Function(GetHostDetails value) getHostDetails,
  }) {
    return getHostDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllHosts value)? getAllHosts,
    TResult? Function(GetHostDetails value)? getHostDetails,
  }) {
    return getHostDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllHosts value)? getAllHosts,
    TResult Function(GetHostDetails value)? getHostDetails,
    required TResult orElse(),
  }) {
    if (getHostDetails != null) {
      return getHostDetails(this);
    }
    return orElse();
  }
}

abstract class GetHostDetails implements HostEvent {
  factory GetHostDetails(final int? id) = _$GetHostDetails;

  int? get id;
  @JsonKey(ignore: true)
  _$$GetHostDetailsCopyWith<_$GetHostDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HostState {
  List<Host>? get listHosts => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  ListHost? get listHost => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get currencies => throw _privateConstructorUsedError;
  HostDetail? get hostDetail => throw _privateConstructorUsedError;
  String? get currentImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HostStateCopyWith<HostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostStateCopyWith<$Res> {
  factory $HostStateCopyWith(HostState value, $Res Function(HostState) then) =
      _$HostStateCopyWithImpl<$Res, HostState>;
  @useResult
  $Res call(
      {List<Host>? listHosts,
      StateStatus? status,
      ListHost? listHost,
      Map<dynamic, dynamic>? currencies,
      HostDetail? hostDetail,
      String? currentImage});
}

/// @nodoc
class _$HostStateCopyWithImpl<$Res, $Val extends HostState>
    implements $HostStateCopyWith<$Res> {
  _$HostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listHosts = freezed,
    Object? status = freezed,
    Object? listHost = freezed,
    Object? currencies = freezed,
    Object? hostDetail = freezed,
    Object? currentImage = freezed,
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
      listHost: freezed == listHost
          ? _value.listHost
          : listHost // ignore: cast_nullable_to_non_nullable
              as ListHost?,
      currencies: freezed == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      hostDetail: freezed == hostDetail
          ? _value.hostDetail
          : hostDetail // ignore: cast_nullable_to_non_nullable
              as HostDetail?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HostStateCopyWith<$Res> implements $HostStateCopyWith<$Res> {
  factory _$$_HostStateCopyWith(
          _$_HostState value, $Res Function(_$_HostState) then) =
      __$$_HostStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Host>? listHosts,
      StateStatus? status,
      ListHost? listHost,
      Map<dynamic, dynamic>? currencies,
      HostDetail? hostDetail,
      String? currentImage});
}

/// @nodoc
class __$$_HostStateCopyWithImpl<$Res>
    extends _$HostStateCopyWithImpl<$Res, _$_HostState>
    implements _$$_HostStateCopyWith<$Res> {
  __$$_HostStateCopyWithImpl(
      _$_HostState _value, $Res Function(_$_HostState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listHosts = freezed,
    Object? status = freezed,
    Object? listHost = freezed,
    Object? currencies = freezed,
    Object? hostDetail = freezed,
    Object? currentImage = freezed,
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
      listHost: freezed == listHost
          ? _value.listHost
          : listHost // ignore: cast_nullable_to_non_nullable
              as ListHost?,
      currencies: freezed == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      hostDetail: freezed == hostDetail
          ? _value.hostDetail
          : hostDetail // ignore: cast_nullable_to_non_nullable
              as HostDetail?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HostState implements _HostState {
  const _$_HostState(
      {final List<Host>? listHosts,
      this.status,
      this.listHost,
      final Map<dynamic, dynamic>? currencies,
      this.hostDetail,
      this.currentImage})
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
  final ListHost? listHost;
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
  final HostDetail? hostDetail;
  @override
  final String? currentImage;

  @override
  String toString() {
    return 'HostState(listHosts: $listHosts, status: $status, listHost: $listHost, currencies: $currencies, hostDetail: $hostDetail, currentImage: $currentImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HostState &&
            const DeepCollectionEquality()
                .equals(other._listHosts, _listHosts) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.listHost, listHost) ||
                other.listHost == listHost) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies) &&
            (identical(other.hostDetail, hostDetail) ||
                other.hostDetail == hostDetail) &&
            (identical(other.currentImage, currentImage) ||
                other.currentImage == currentImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listHosts),
      status,
      listHost,
      const DeepCollectionEquality().hash(_currencies),
      hostDetail,
      currentImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostStateCopyWith<_$_HostState> get copyWith =>
      __$$_HostStateCopyWithImpl<_$_HostState>(this, _$identity);
}

abstract class _HostState implements HostState {
  const factory _HostState(
      {final List<Host>? listHosts,
      final StateStatus? status,
      final ListHost? listHost,
      final Map<dynamic, dynamic>? currencies,
      final HostDetail? hostDetail,
      final String? currentImage}) = _$_HostState;

  @override
  List<Host>? get listHosts;
  @override
  StateStatus? get status;
  @override
  ListHost? get listHost;
  @override
  Map<dynamic, dynamic>? get currencies;
  @override
  HostDetail? get hostDetail;
  @override
  String? get currentImage;
  @override
  @JsonKey(ignore: true)
  _$$_HostStateCopyWith<_$_HostState> get copyWith =>
      throw _privateConstructorUsedError;
}
