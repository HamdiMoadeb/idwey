// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_experience_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailsExperiencePageEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getExperienceDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getExperienceDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getExperienceDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExperienceDetails value) getExperienceDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetExperienceDetails value)? getExperienceDetails,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExperienceDetails value)? getExperienceDetails,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsExperiencePageEventCopyWith<DetailsExperiencePageEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsExperiencePageEventCopyWith<$Res> {
  factory $DetailsExperiencePageEventCopyWith(DetailsExperiencePageEvent value,
          $Res Function(DetailsExperiencePageEvent) then) =
      _$DetailsExperiencePageEventCopyWithImpl<$Res,
          DetailsExperiencePageEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$DetailsExperiencePageEventCopyWithImpl<$Res,
        $Val extends DetailsExperiencePageEvent>
    implements $DetailsExperiencePageEventCopyWith<$Res> {
  _$DetailsExperiencePageEventCopyWithImpl(this._value, this._then);

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
abstract class _$$GetExperienceDetailsCopyWith<$Res>
    implements $DetailsExperiencePageEventCopyWith<$Res> {
  factory _$$GetExperienceDetailsCopyWith(_$GetExperienceDetails value,
          $Res Function(_$GetExperienceDetails) then) =
      __$$GetExperienceDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$GetExperienceDetailsCopyWithImpl<$Res>
    extends _$DetailsExperiencePageEventCopyWithImpl<$Res,
        _$GetExperienceDetails>
    implements _$$GetExperienceDetailsCopyWith<$Res> {
  __$$GetExperienceDetailsCopyWithImpl(_$GetExperienceDetails _value,
      $Res Function(_$GetExperienceDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$GetExperienceDetails(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetExperienceDetails implements GetExperienceDetails {
  const _$GetExperienceDetails(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'DetailsExperiencePageEvent.getExperienceDetails(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExperienceDetails &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExperienceDetailsCopyWith<_$GetExperienceDetails> get copyWith =>
      __$$GetExperienceDetailsCopyWithImpl<_$GetExperienceDetails>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getExperienceDetails,
  }) {
    return getExperienceDetails(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getExperienceDetails,
  }) {
    return getExperienceDetails?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getExperienceDetails,
    required TResult orElse(),
  }) {
    if (getExperienceDetails != null) {
      return getExperienceDetails(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExperienceDetails value) getExperienceDetails,
  }) {
    return getExperienceDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetExperienceDetails value)? getExperienceDetails,
  }) {
    return getExperienceDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExperienceDetails value)? getExperienceDetails,
    required TResult orElse(),
  }) {
    if (getExperienceDetails != null) {
      return getExperienceDetails(this);
    }
    return orElse();
  }
}

abstract class GetExperienceDetails implements DetailsExperiencePageEvent {
  const factory GetExperienceDetails(final int id) = _$GetExperienceDetails;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$GetExperienceDetailsCopyWith<_$GetExperienceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DetailsExperiencePageState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  ExperienceDetailsDto? get experienceDetailsDto =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailsExperiencePageStateCopyWith<DetailsExperiencePageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsExperiencePageStateCopyWith<$Res> {
  factory $DetailsExperiencePageStateCopyWith(DetailsExperiencePageState value,
          $Res Function(DetailsExperiencePageState) then) =
      _$DetailsExperiencePageStateCopyWithImpl<$Res,
          DetailsExperiencePageState>;
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      ExperienceDetailsDto? experienceDetailsDto});
}

/// @nodoc
class _$DetailsExperiencePageStateCopyWithImpl<$Res,
        $Val extends DetailsExperiencePageState>
    implements $DetailsExperiencePageStateCopyWith<$Res> {
  _$DetailsExperiencePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? experienceDetailsDto = freezed,
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
      experienceDetailsDto: freezed == experienceDetailsDto
          ? _value.experienceDetailsDto
          : experienceDetailsDto // ignore: cast_nullable_to_non_nullable
              as ExperienceDetailsDto?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailsExperiencePageStateCopyWith<$Res>
    implements $DetailsExperiencePageStateCopyWith<$Res> {
  factory _$$_DetailsExperiencePageStateCopyWith(
          _$_DetailsExperiencePageState value,
          $Res Function(_$_DetailsExperiencePageState) then) =
      __$$_DetailsExperiencePageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      ExperienceDetailsDto? experienceDetailsDto});
}

/// @nodoc
class __$$_DetailsExperiencePageStateCopyWithImpl<$Res>
    extends _$DetailsExperiencePageStateCopyWithImpl<$Res,
        _$_DetailsExperiencePageState>
    implements _$$_DetailsExperiencePageStateCopyWith<$Res> {
  __$$_DetailsExperiencePageStateCopyWithImpl(
      _$_DetailsExperiencePageState _value,
      $Res Function(_$_DetailsExperiencePageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? experienceDetailsDto = freezed,
  }) {
    return _then(_$_DetailsExperiencePageState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      experienceDetailsDto: freezed == experienceDetailsDto
          ? _value.experienceDetailsDto
          : experienceDetailsDto // ignore: cast_nullable_to_non_nullable
              as ExperienceDetailsDto?,
    ));
  }
}

/// @nodoc

class _$_DetailsExperiencePageState implements _DetailsExperiencePageState {
  const _$_DetailsExperiencePageState(
      {this.title, this.status, this.experienceDetailsDto});

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final ExperienceDetailsDto? experienceDetailsDto;

  @override
  String toString() {
    return 'DetailsExperiencePageState(title: $title, status: $status, experienceDetailsDto: $experienceDetailsDto)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailsExperiencePageState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.experienceDetailsDto, experienceDetailsDto) ||
                other.experienceDetailsDto == experienceDetailsDto));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, status, experienceDetailsDto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailsExperiencePageStateCopyWith<_$_DetailsExperiencePageState>
      get copyWith => __$$_DetailsExperiencePageStateCopyWithImpl<
          _$_DetailsExperiencePageState>(this, _$identity);
}

abstract class _DetailsExperiencePageState
    implements DetailsExperiencePageState {
  const factory _DetailsExperiencePageState(
          {final String? title,
          final StateStatus? status,
          final ExperienceDetailsDto? experienceDetailsDto}) =
      _$_DetailsExperiencePageState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  ExperienceDetailsDto? get experienceDetailsDto;
  @override
  @JsonKey(ignore: true)
  _$$_DetailsExperiencePageStateCopyWith<_$_DetailsExperiencePageState>
      get copyWith => throw _privateConstructorUsedError;
}
