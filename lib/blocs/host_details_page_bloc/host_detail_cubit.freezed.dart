// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'host_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HostDetailState {
  HostDetail? get hostDetail => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HostDetailStateCopyWith<HostDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostDetailStateCopyWith<$Res> {
  factory $HostDetailStateCopyWith(
          HostDetailState value, $Res Function(HostDetailState) then) =
      _$HostDetailStateCopyWithImpl<$Res, HostDetailState>;
  @useResult
  $Res call({HostDetail? hostDetail, StateStatus? status});
}

/// @nodoc
class _$HostDetailStateCopyWithImpl<$Res, $Val extends HostDetailState>
    implements $HostDetailStateCopyWith<$Res> {
  _$HostDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostDetail = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      hostDetail: freezed == hostDetail
          ? _value.hostDetail
          : hostDetail // ignore: cast_nullable_to_non_nullable
              as HostDetail?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HostDetailStateCopyWith<$Res>
    implements $HostDetailStateCopyWith<$Res> {
  factory _$$_HostDetailStateCopyWith(
          _$_HostDetailState value, $Res Function(_$_HostDetailState) then) =
      __$$_HostDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HostDetail? hostDetail, StateStatus? status});
}

/// @nodoc
class __$$_HostDetailStateCopyWithImpl<$Res>
    extends _$HostDetailStateCopyWithImpl<$Res, _$_HostDetailState>
    implements _$$_HostDetailStateCopyWith<$Res> {
  __$$_HostDetailStateCopyWithImpl(
      _$_HostDetailState _value, $Res Function(_$_HostDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hostDetail = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_HostDetailState(
      hostDetail: freezed == hostDetail
          ? _value.hostDetail
          : hostDetail // ignore: cast_nullable_to_non_nullable
              as HostDetail?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
    ));
  }
}

/// @nodoc

class _$_HostDetailState implements _HostDetailState {
  const _$_HostDetailState({this.hostDetail, this.status});

  @override
  final HostDetail? hostDetail;
  @override
  final StateStatus? status;

  @override
  String toString() {
    return 'HostDetailState(hostDetail: $hostDetail, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HostDetailState &&
            (identical(other.hostDetail, hostDetail) ||
                other.hostDetail == hostDetail) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hostDetail, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostDetailStateCopyWith<_$_HostDetailState> get copyWith =>
      __$$_HostDetailStateCopyWithImpl<_$_HostDetailState>(this, _$identity);
}

abstract class _HostDetailState implements HostDetailState {
  const factory _HostDetailState(
      {final HostDetail? hostDetail,
      final StateStatus? status}) = _$_HostDetailState;

  @override
  HostDetail? get hostDetail;
  @override
  StateStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$_HostDetailStateCopyWith<_$_HostDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
