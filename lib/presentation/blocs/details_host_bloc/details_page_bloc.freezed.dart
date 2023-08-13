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
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHostDetails value) getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsPageEventCopyWith<DetailsPageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsPageEventCopyWith<$Res> {
  factory $DetailsPageEventCopyWith(
          DetailsPageEvent value, $Res Function(DetailsPageEvent) then) =
      _$DetailsPageEventCopyWithImpl<$Res, DetailsPageEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DetailsPageEventCopyWithImpl<$Res, $Val extends DetailsPageEvent>
    implements $DetailsPageEventCopyWith<$Res> {
  _$DetailsPageEventCopyWithImpl(this._value, this._then);

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
abstract class _$$GetHostDetailsCopyWith<$Res>
    implements $DetailsPageEventCopyWith<$Res> {
  factory _$$GetHostDetailsCopyWith(
          _$GetHostDetails value, $Res Function(_$GetHostDetails) then) =
      __$$GetHostDetailsCopyWithImpl<$Res>;
  @override
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
  }) {
    return getHostDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getHostDetails,
  }) {
    return getHostDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getHostDetails,
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
  }) {
    return getHostDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHostDetails value)? getHostDetails,
  }) {
    return getHostDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHostDetails value)? getHostDetails,
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

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$GetHostDetailsCopyWith<_$GetHostDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailsPageState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  HostDetails? get hostDetails => throw _privateConstructorUsedError;

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
  $Res call({String? title, StateStatus? status, HostDetails? hostDetails});
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
  $Res call({String? title, StateStatus? status, HostDetails? hostDetails});
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
    ));
  }
}

/// @nodoc

class _$_DetailsPageState implements _DetailsPageState {
  const _$_DetailsPageState({this.title, this.status, this.hostDetails});

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final HostDetails? hostDetails;

  @override
  String toString() {
    return 'DetailsPageState(title: $title, status: $status, hostDetails: $hostDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsPageState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hostDetails, hostDetails) ||
                other.hostDetails == hostDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, status, hostDetails);

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
      final HostDetails? hostDetails}) = _$_DetailsPageState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  HostDetails? get hostDetails;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsPageStateCopyWith<_$_DetailsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
