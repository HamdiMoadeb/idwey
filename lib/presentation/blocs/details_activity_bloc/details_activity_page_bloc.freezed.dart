// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_activity_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsActivityPageEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getActivityDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getActivityDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getActivityDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetActivityDetails value) getActivityDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetActivityDetails value)? getActivityDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetActivityDetails value)? getActivityDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsActivityPageEventCopyWith<DetailsActivityPageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsActivityPageEventCopyWith<$Res> {
  factory $DetailsActivityPageEventCopyWith(DetailsActivityPageEvent value,
          $Res Function(DetailsActivityPageEvent) then) =
      _$DetailsActivityPageEventCopyWithImpl<$Res, DetailsActivityPageEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DetailsActivityPageEventCopyWithImpl<$Res,
        $Val extends DetailsActivityPageEvent>
    implements $DetailsActivityPageEventCopyWith<$Res> {
  _$DetailsActivityPageEventCopyWithImpl(this._value, this._then);

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
abstract class _$$GetActivityDetailsCopyWith<$Res>
    implements $DetailsActivityPageEventCopyWith<$Res> {
  factory _$$GetActivityDetailsCopyWith(_$GetActivityDetails value,
          $Res Function(_$GetActivityDetails) then) =
      __$$GetActivityDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetActivityDetailsCopyWithImpl<$Res>
    extends _$DetailsActivityPageEventCopyWithImpl<$Res, _$GetActivityDetails>
    implements _$$GetActivityDetailsCopyWith<$Res> {
  __$$GetActivityDetailsCopyWithImpl(
      _$GetActivityDetails _value, $Res Function(_$GetActivityDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetActivityDetails(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetActivityDetails implements GetActivityDetails {
  const _$GetActivityDetails(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'DetailsActivityPageEvent.getActivityDetails(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetActivityDetails &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetActivityDetailsCopyWith<_$GetActivityDetails> get copyWith =>
      __$$GetActivityDetailsCopyWithImpl<_$GetActivityDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getActivityDetails,
  }) {
    return getActivityDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getActivityDetails,
  }) {
    return getActivityDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getActivityDetails,
    required TResult orElse(),
  }) {
    if (getActivityDetails != null) {
      return getActivityDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetActivityDetails value) getActivityDetails,
  }) {
    return getActivityDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetActivityDetails value)? getActivityDetails,
  }) {
    return getActivityDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetActivityDetails value)? getActivityDetails,
    required TResult orElse(),
  }) {
    if (getActivityDetails != null) {
      return getActivityDetails(this);
    }
    return orElse();
  }
}

abstract class GetActivityDetails implements DetailsActivityPageEvent {
  const factory GetActivityDetails(final int id) = _$GetActivityDetails;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$GetActivityDetailsCopyWith<_$GetActivityDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailsActivityPageState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  ActivityDetailsDto? get activityDetailsDto =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsActivityPageStateCopyWith<DetailsActivityPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsActivityPageStateCopyWith<$Res> {
  factory $DetailsActivityPageStateCopyWith(DetailsActivityPageState value,
          $Res Function(DetailsActivityPageState) then) =
      _$DetailsActivityPageStateCopyWithImpl<$Res, DetailsActivityPageState>;
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      ActivityDetailsDto? activityDetailsDto});
}

/// @nodoc
class _$DetailsActivityPageStateCopyWithImpl<$Res,
        $Val extends DetailsActivityPageState>
    implements $DetailsActivityPageStateCopyWith<$Res> {
  _$DetailsActivityPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? activityDetailsDto = freezed,
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
      activityDetailsDto: freezed == activityDetailsDto
          ? _value.activityDetailsDto
          : activityDetailsDto // ignore: cast_nullable_to_non_nullable
              as ActivityDetailsDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsActivityPageStateCopyWith<$Res>
    implements $DetailsActivityPageStateCopyWith<$Res> {
  factory _$$_DetailsActivityPageStateCopyWith(
          _$_DetailsActivityPageState value,
          $Res Function(_$_DetailsActivityPageState) then) =
      __$$_DetailsActivityPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      ActivityDetailsDto? activityDetailsDto});
}

/// @nodoc
class __$$_DetailsActivityPageStateCopyWithImpl<$Res>
    extends _$DetailsActivityPageStateCopyWithImpl<$Res,
        _$_DetailsActivityPageState>
    implements _$$_DetailsActivityPageStateCopyWith<$Res> {
  __$$_DetailsActivityPageStateCopyWithImpl(_$_DetailsActivityPageState _value,
      $Res Function(_$_DetailsActivityPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? activityDetailsDto = freezed,
  }) {
    return _then(_$_DetailsActivityPageState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      activityDetailsDto: freezed == activityDetailsDto
          ? _value.activityDetailsDto
          : activityDetailsDto // ignore: cast_nullable_to_non_nullable
              as ActivityDetailsDto?,
    ));
  }
}

/// @nodoc

class _$_DetailsActivityPageState implements _DetailsActivityPageState {
  const _$_DetailsActivityPageState(
      {this.title, this.status, this.activityDetailsDto});

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final ActivityDetailsDto? activityDetailsDto;

  @override
  String toString() {
    return 'DetailsActivityPageState(title: $title, status: $status, activityDetailsDto: $activityDetailsDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsActivityPageState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activityDetailsDto, activityDetailsDto) ||
                other.activityDetailsDto == activityDetailsDto));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, status, activityDetailsDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsActivityPageStateCopyWith<_$_DetailsActivityPageState>
      get copyWith => __$$_DetailsActivityPageStateCopyWithImpl<
          _$_DetailsActivityPageState>(this, _$identity);
}

abstract class _DetailsActivityPageState implements DetailsActivityPageState {
  const factory _DetailsActivityPageState(
          {final String? title,
          final StateStatus? status,
          final ActivityDetailsDto? activityDetailsDto}) =
      _$_DetailsActivityPageState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  ActivityDetailsDto? get activityDetailsDto;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsActivityPageStateCopyWith<_$_DetailsActivityPageState>
      get copyWith => throw _privateConstructorUsedError;
}
