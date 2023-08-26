// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_event_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsEventPageEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getEventDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getEventDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getEventDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetEventDetails value) getEventDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetEventDetails value)? getEventDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetEventDetails value)? getEventDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsEventPageEventCopyWith<DetailsEventPageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsEventPageEventCopyWith<$Res> {
  factory $DetailsEventPageEventCopyWith(DetailsEventPageEvent value,
          $Res Function(DetailsEventPageEvent) then) =
      _$DetailsEventPageEventCopyWithImpl<$Res, DetailsEventPageEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DetailsEventPageEventCopyWithImpl<$Res,
        $Val extends DetailsEventPageEvent>
    implements $DetailsEventPageEventCopyWith<$Res> {
  _$DetailsEventPageEventCopyWithImpl(this._value, this._then);

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
abstract class _$$GetEventDetailsCopyWith<$Res>
    implements $DetailsEventPageEventCopyWith<$Res> {
  factory _$$GetEventDetailsCopyWith(
          _$GetEventDetails value, $Res Function(_$GetEventDetails) then) =
      __$$GetEventDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetEventDetailsCopyWithImpl<$Res>
    extends _$DetailsEventPageEventCopyWithImpl<$Res, _$GetEventDetails>
    implements _$$GetEventDetailsCopyWith<$Res> {
  __$$GetEventDetailsCopyWithImpl(
      _$GetEventDetails _value, $Res Function(_$GetEventDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetEventDetails(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetEventDetails implements GetEventDetails {
  const _$GetEventDetails(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'DetailsEventPageEvent.getEventDetails(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetEventDetails &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetEventDetailsCopyWith<_$GetEventDetails> get copyWith =>
      __$$GetEventDetailsCopyWithImpl<_$GetEventDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getEventDetails,
  }) {
    return getEventDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getEventDetails,
  }) {
    return getEventDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getEventDetails,
    required TResult orElse(),
  }) {
    if (getEventDetails != null) {
      return getEventDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetEventDetails value) getEventDetails,
  }) {
    return getEventDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetEventDetails value)? getEventDetails,
  }) {
    return getEventDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetEventDetails value)? getEventDetails,
    required TResult orElse(),
  }) {
    if (getEventDetails != null) {
      return getEventDetails(this);
    }
    return orElse();
  }
}

abstract class GetEventDetails implements DetailsEventPageEvent {
  const factory GetEventDetails(final int id) = _$GetEventDetails;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$GetEventDetailsCopyWith<_$GetEventDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailsEventPageState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  EventDetailsDto? get eventDetailsDto => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsEventPageStateCopyWith<DetailsEventPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsEventPageStateCopyWith<$Res> {
  factory $DetailsEventPageStateCopyWith(DetailsEventPageState value,
          $Res Function(DetailsEventPageState) then) =
      _$DetailsEventPageStateCopyWithImpl<$Res, DetailsEventPageState>;
  @useResult
  $Res call(
      {String? title, StateStatus? status, EventDetailsDto? eventDetailsDto});
}

/// @nodoc
class _$DetailsEventPageStateCopyWithImpl<$Res,
        $Val extends DetailsEventPageState>
    implements $DetailsEventPageStateCopyWith<$Res> {
  _$DetailsEventPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? eventDetailsDto = freezed,
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
      eventDetailsDto: freezed == eventDetailsDto
          ? _value.eventDetailsDto
          : eventDetailsDto // ignore: cast_nullable_to_non_nullable
              as EventDetailsDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsEventPageStateCopyWith<$Res>
    implements $DetailsEventPageStateCopyWith<$Res> {
  factory _$$_DetailsEventPageStateCopyWith(_$_DetailsEventPageState value,
          $Res Function(_$_DetailsEventPageState) then) =
      __$$_DetailsEventPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title, StateStatus? status, EventDetailsDto? eventDetailsDto});
}

/// @nodoc
class __$$_DetailsEventPageStateCopyWithImpl<$Res>
    extends _$DetailsEventPageStateCopyWithImpl<$Res, _$_DetailsEventPageState>
    implements _$$_DetailsEventPageStateCopyWith<$Res> {
  __$$_DetailsEventPageStateCopyWithImpl(_$_DetailsEventPageState _value,
      $Res Function(_$_DetailsEventPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? eventDetailsDto = freezed,
  }) {
    return _then(_$_DetailsEventPageState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      eventDetailsDto: freezed == eventDetailsDto
          ? _value.eventDetailsDto
          : eventDetailsDto // ignore: cast_nullable_to_non_nullable
              as EventDetailsDto?,
    ));
  }
}

/// @nodoc

class _$_DetailsEventPageState implements _DetailsEventPageState {
  const _$_DetailsEventPageState(
      {this.title, this.status, this.eventDetailsDto});

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final EventDetailsDto? eventDetailsDto;

  @override
  String toString() {
    return 'DetailsEventPageState(title: $title, status: $status, eventDetailsDto: $eventDetailsDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsEventPageState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.eventDetailsDto, eventDetailsDto) ||
                other.eventDetailsDto == eventDetailsDto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, status, eventDetailsDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsEventPageStateCopyWith<_$_DetailsEventPageState> get copyWith =>
      __$$_DetailsEventPageStateCopyWithImpl<_$_DetailsEventPageState>(
          this, _$identity);
}

abstract class _DetailsEventPageState implements DetailsEventPageState {
  const factory _DetailsEventPageState(
      {final String? title,
      final StateStatus? status,
      final EventDetailsDto? eventDetailsDto}) = _$_DetailsEventPageState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  EventDetailsDto? get eventDetailsDto;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsEventPageStateCopyWith<_$_DetailsEventPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
