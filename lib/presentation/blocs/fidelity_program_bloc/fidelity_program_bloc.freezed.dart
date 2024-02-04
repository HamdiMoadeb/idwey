// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fidelity_program_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FidelityProgramEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMonthlyPoints,
    required TResult Function() getTotalPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMonthlyPoints,
    TResult? Function()? getTotalPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMonthlyPoints,
    TResult Function()? getTotalPoints,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMonthlyPoints value) getMonthlyPoints,
    required TResult Function(GetTotalPoints value) getTotalPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMonthlyPoints value)? getMonthlyPoints,
    TResult? Function(GetTotalPoints value)? getTotalPoints,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMonthlyPoints value)? getMonthlyPoints,
    TResult Function(GetTotalPoints value)? getTotalPoints,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FidelityProgramEventCopyWith<$Res> {
  factory $FidelityProgramEventCopyWith(FidelityProgramEvent value,
          $Res Function(FidelityProgramEvent) then) =
      _$FidelityProgramEventCopyWithImpl<$Res, FidelityProgramEvent>;
}

/// @nodoc
class _$FidelityProgramEventCopyWithImpl<$Res,
        $Val extends FidelityProgramEvent>
    implements $FidelityProgramEventCopyWith<$Res> {
  _$FidelityProgramEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetMonthlyPointsCopyWith<$Res> {
  factory _$$GetMonthlyPointsCopyWith(
          _$GetMonthlyPoints value, $Res Function(_$GetMonthlyPoints) then) =
      __$$GetMonthlyPointsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMonthlyPointsCopyWithImpl<$Res>
    extends _$FidelityProgramEventCopyWithImpl<$Res, _$GetMonthlyPoints>
    implements _$$GetMonthlyPointsCopyWith<$Res> {
  __$$GetMonthlyPointsCopyWithImpl(
      _$GetMonthlyPoints _value, $Res Function(_$GetMonthlyPoints) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMonthlyPoints implements GetMonthlyPoints {
  const _$GetMonthlyPoints();

  @override
  String toString() {
    return 'FidelityProgramEvent.getMonthlyPoints()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMonthlyPoints);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMonthlyPoints,
    required TResult Function() getTotalPoints,
  }) {
    return getMonthlyPoints();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMonthlyPoints,
    TResult? Function()? getTotalPoints,
  }) {
    return getMonthlyPoints?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMonthlyPoints,
    TResult Function()? getTotalPoints,
    required TResult orElse(),
  }) {
    if (getMonthlyPoints != null) {
      return getMonthlyPoints();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMonthlyPoints value) getMonthlyPoints,
    required TResult Function(GetTotalPoints value) getTotalPoints,
  }) {
    return getMonthlyPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMonthlyPoints value)? getMonthlyPoints,
    TResult? Function(GetTotalPoints value)? getTotalPoints,
  }) {
    return getMonthlyPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMonthlyPoints value)? getMonthlyPoints,
    TResult Function(GetTotalPoints value)? getTotalPoints,
    required TResult orElse(),
  }) {
    if (getMonthlyPoints != null) {
      return getMonthlyPoints(this);
    }
    return orElse();
  }
}

abstract class GetMonthlyPoints implements FidelityProgramEvent {
  const factory GetMonthlyPoints() = _$GetMonthlyPoints;
}

/// @nodoc
abstract class _$$GetTotalPointsCopyWith<$Res> {
  factory _$$GetTotalPointsCopyWith(
          _$GetTotalPoints value, $Res Function(_$GetTotalPoints) then) =
      __$$GetTotalPointsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTotalPointsCopyWithImpl<$Res>
    extends _$FidelityProgramEventCopyWithImpl<$Res, _$GetTotalPoints>
    implements _$$GetTotalPointsCopyWith<$Res> {
  __$$GetTotalPointsCopyWithImpl(
      _$GetTotalPoints _value, $Res Function(_$GetTotalPoints) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetTotalPoints implements GetTotalPoints {
  const _$GetTotalPoints();

  @override
  String toString() {
    return 'FidelityProgramEvent.getTotalPoints()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTotalPoints);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMonthlyPoints,
    required TResult Function() getTotalPoints,
  }) {
    return getTotalPoints();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMonthlyPoints,
    TResult? Function()? getTotalPoints,
  }) {
    return getTotalPoints?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMonthlyPoints,
    TResult Function()? getTotalPoints,
    required TResult orElse(),
  }) {
    if (getTotalPoints != null) {
      return getTotalPoints();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMonthlyPoints value) getMonthlyPoints,
    required TResult Function(GetTotalPoints value) getTotalPoints,
  }) {
    return getTotalPoints(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMonthlyPoints value)? getMonthlyPoints,
    TResult? Function(GetTotalPoints value)? getTotalPoints,
  }) {
    return getTotalPoints?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMonthlyPoints value)? getMonthlyPoints,
    TResult Function(GetTotalPoints value)? getTotalPoints,
    required TResult orElse(),
  }) {
    if (getTotalPoints != null) {
      return getTotalPoints(this);
    }
    return orElse();
  }
}

abstract class GetTotalPoints implements FidelityProgramEvent {
  const factory GetTotalPoints() = _$GetTotalPoints;
}

/// @nodoc
mixin _$FidelityProgramState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  StateStatus? get statusRange => throw _privateConstructorUsedError;
  String? get monthlyPoints => throw _privateConstructorUsedError;
  String? get totalPoints => throw _privateConstructorUsedError;
  String? get totalPoints2 => throw _privateConstructorUsedError;
  String? get points => throw _privateConstructorUsedError;
  String? get rank => throw _privateConstructorUsedError;
  List<String>? get list => throw _privateConstructorUsedError;
  List<String>? get listContent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FidelityProgramStateCopyWith<FidelityProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FidelityProgramStateCopyWith<$Res> {
  factory $FidelityProgramStateCopyWith(FidelityProgramState value,
          $Res Function(FidelityProgramState) then) =
      _$FidelityProgramStateCopyWithImpl<$Res, FidelityProgramState>;
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      StateStatus? statusRange,
      String? monthlyPoints,
      String? totalPoints,
      String? totalPoints2,
      String? points,
      String? rank,
      List<String>? list,
      List<String>? listContent});
}

/// @nodoc
class _$FidelityProgramStateCopyWithImpl<$Res,
        $Val extends FidelityProgramState>
    implements $FidelityProgramStateCopyWith<$Res> {
  _$FidelityProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? statusRange = freezed,
    Object? monthlyPoints = freezed,
    Object? totalPoints = freezed,
    Object? totalPoints2 = freezed,
    Object? points = freezed,
    Object? rank = freezed,
    Object? list = freezed,
    Object? listContent = freezed,
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
      statusRange: freezed == statusRange
          ? _value.statusRange
          : statusRange // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      monthlyPoints: freezed == monthlyPoints
          ? _value.monthlyPoints
          : monthlyPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: freezed == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints2: freezed == totalPoints2
          ? _value.totalPoints2
          : totalPoints2 // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      listContent: freezed == listContent
          ? _value.listContent
          : listContent // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FidelityProgramStateCopyWith<$Res>
    implements $FidelityProgramStateCopyWith<$Res> {
  factory _$$_FidelityProgramStateCopyWith(_$_FidelityProgramState value,
          $Res Function(_$_FidelityProgramState) then) =
      __$$_FidelityProgramStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      StateStatus? statusRange,
      String? monthlyPoints,
      String? totalPoints,
      String? totalPoints2,
      String? points,
      String? rank,
      List<String>? list,
      List<String>? listContent});
}

/// @nodoc
class __$$_FidelityProgramStateCopyWithImpl<$Res>
    extends _$FidelityProgramStateCopyWithImpl<$Res, _$_FidelityProgramState>
    implements _$$_FidelityProgramStateCopyWith<$Res> {
  __$$_FidelityProgramStateCopyWithImpl(_$_FidelityProgramState _value,
      $Res Function(_$_FidelityProgramState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? statusRange = freezed,
    Object? monthlyPoints = freezed,
    Object? totalPoints = freezed,
    Object? totalPoints2 = freezed,
    Object? points = freezed,
    Object? rank = freezed,
    Object? list = freezed,
    Object? listContent = freezed,
  }) {
    return _then(_$_FidelityProgramState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      statusRange: freezed == statusRange
          ? _value.statusRange
          : statusRange // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      monthlyPoints: freezed == monthlyPoints
          ? _value.monthlyPoints
          : monthlyPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints: freezed == totalPoints
          ? _value.totalPoints
          : totalPoints // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPoints2: freezed == totalPoints2
          ? _value.totalPoints2
          : totalPoints2 // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
      list: freezed == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      listContent: freezed == listContent
          ? _value._listContent
          : listContent // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_FidelityProgramState implements _FidelityProgramState {
  const _$_FidelityProgramState(
      {this.title,
      this.status,
      this.statusRange,
      this.monthlyPoints,
      this.totalPoints,
      this.totalPoints2,
      this.points,
      this.rank,
      final List<String>? list,
      final List<String>? listContent})
      : _list = list,
        _listContent = listContent;

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final StateStatus? statusRange;
  @override
  final String? monthlyPoints;
  @override
  final String? totalPoints;
  @override
  final String? totalPoints2;
  @override
  final String? points;
  @override
  final String? rank;
  final List<String>? _list;
  @override
  List<String>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _listContent;
  @override
  List<String>? get listContent {
    final value = _listContent;
    if (value == null) return null;
    if (_listContent is EqualUnmodifiableListView) return _listContent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FidelityProgramState(title: $title, status: $status, statusRange: $statusRange, monthlyPoints: $monthlyPoints, totalPoints: $totalPoints, totalPoints2: $totalPoints2, points: $points, rank: $rank, list: $list, listContent: $listContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FidelityProgramState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusRange, statusRange) ||
                other.statusRange == statusRange) &&
            (identical(other.monthlyPoints, monthlyPoints) ||
                other.monthlyPoints == monthlyPoints) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.totalPoints2, totalPoints2) ||
                other.totalPoints2 == totalPoints2) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            const DeepCollectionEquality()
                .equals(other._listContent, _listContent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      status,
      statusRange,
      monthlyPoints,
      totalPoints,
      totalPoints2,
      points,
      rank,
      const DeepCollectionEquality().hash(_list),
      const DeepCollectionEquality().hash(_listContent));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FidelityProgramStateCopyWith<_$_FidelityProgramState> get copyWith =>
      __$$_FidelityProgramStateCopyWithImpl<_$_FidelityProgramState>(
          this, _$identity);
}

abstract class _FidelityProgramState implements FidelityProgramState {
  const factory _FidelityProgramState(
      {final String? title,
      final StateStatus? status,
      final StateStatus? statusRange,
      final String? monthlyPoints,
      final String? totalPoints,
      final String? totalPoints2,
      final String? points,
      final String? rank,
      final List<String>? list,
      final List<String>? listContent}) = _$_FidelityProgramState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  StateStatus? get statusRange;
  @override
  String? get monthlyPoints;
  @override
  String? get totalPoints;
  @override
  String? get totalPoints2;
  @override
  String? get points;
  @override
  String? get rank;
  @override
  List<String>? get list;
  @override
  List<String>? get listContent;
  @override
  @JsonKey(ignore: true)
  _$$_FidelityProgramStateCopyWith<_$_FidelityProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}
