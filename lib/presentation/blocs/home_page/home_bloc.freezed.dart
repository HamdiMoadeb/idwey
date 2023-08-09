// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roleUser) getUserRole,
    required TResult Function(bool isFetching) getListHosts,
    required TResult Function(bool isFetching) getListEvents,
    required TResult Function(bool isFetching) getListActivities,
    required TResult Function(bool isFetching) getListExperiences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
    TResult? Function(bool isFetching)? getListActivities,
    TResult? Function(bool isFetching)? getListExperiences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
    TResult Function(bool isFetching)? getListActivities,
    TResult Function(bool isFetching)? getListExperiences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserRole value) getUserRole,
    required TResult Function(GetListHost value) getListHosts,
    required TResult Function(GetListEvent value) getListEvents,
    required TResult Function(GetListActivities value) getListActivities,
    required TResult Function(GetListExperiences value) getListExperiences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
    TResult? Function(GetListActivities value)? getListActivities,
    TResult? Function(GetListExperiences value)? getListExperiences,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
    TResult Function(GetListActivities value)? getListActivities,
    TResult Function(GetListExperiences value)? getListExperiences,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUserRoleCopyWith<$Res> {
  factory _$$GetUserRoleCopyWith(
          _$GetUserRole value, $Res Function(_$GetUserRole) then) =
      __$$GetUserRoleCopyWithImpl<$Res>;
  @useResult
  $Res call({String roleUser});
}

/// @nodoc
class __$$GetUserRoleCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetUserRole>
    implements _$$GetUserRoleCopyWith<$Res> {
  __$$GetUserRoleCopyWithImpl(
      _$GetUserRole _value, $Res Function(_$GetUserRole) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roleUser = null,
  }) {
    return _then(_$GetUserRole(
      null == roleUser
          ? _value.roleUser
          : roleUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserRole implements GetUserRole {
  const _$GetUserRole(this.roleUser);

  @override
  final String roleUser;

  @override
  String toString() {
    return 'HomeEvent.getUserRole(roleUser: $roleUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserRole &&
            (identical(other.roleUser, roleUser) ||
                other.roleUser == roleUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roleUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserRoleCopyWith<_$GetUserRole> get copyWith =>
      __$$GetUserRoleCopyWithImpl<_$GetUserRole>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roleUser) getUserRole,
    required TResult Function(bool isFetching) getListHosts,
    required TResult Function(bool isFetching) getListEvents,
    required TResult Function(bool isFetching) getListActivities,
    required TResult Function(bool isFetching) getListExperiences,
  }) {
    return getUserRole(roleUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
    TResult? Function(bool isFetching)? getListActivities,
    TResult? Function(bool isFetching)? getListExperiences,
  }) {
    return getUserRole?.call(roleUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
    TResult Function(bool isFetching)? getListActivities,
    TResult Function(bool isFetching)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getUserRole != null) {
      return getUserRole(roleUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserRole value) getUserRole,
    required TResult Function(GetListHost value) getListHosts,
    required TResult Function(GetListEvent value) getListEvents,
    required TResult Function(GetListActivities value) getListActivities,
    required TResult Function(GetListExperiences value) getListExperiences,
  }) {
    return getUserRole(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
    TResult? Function(GetListActivities value)? getListActivities,
    TResult? Function(GetListExperiences value)? getListExperiences,
  }) {
    return getUserRole?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
    TResult Function(GetListActivities value)? getListActivities,
    TResult Function(GetListExperiences value)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getUserRole != null) {
      return getUserRole(this);
    }
    return orElse();
  }
}

abstract class GetUserRole implements HomeEvent {
  const factory GetUserRole(final String roleUser) = _$GetUserRole;

  String get roleUser;
  @JsonKey(ignore: true)
  _$$GetUserRoleCopyWith<_$GetUserRole> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetListHostCopyWith<$Res> {
  factory _$$GetListHostCopyWith(
          _$GetListHost value, $Res Function(_$GetListHost) then) =
      __$$GetListHostCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFetching});
}

/// @nodoc
class __$$GetListHostCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetListHost>
    implements _$$GetListHostCopyWith<$Res> {
  __$$GetListHostCopyWithImpl(
      _$GetListHost _value, $Res Function(_$GetListHost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
  }) {
    return _then(_$GetListHost(
      null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetListHost implements GetListHost {
  const _$GetListHost(this.isFetching);

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'HomeEvent.getListHosts(isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListHost &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListHostCopyWith<_$GetListHost> get copyWith =>
      __$$GetListHostCopyWithImpl<_$GetListHost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roleUser) getUserRole,
    required TResult Function(bool isFetching) getListHosts,
    required TResult Function(bool isFetching) getListEvents,
    required TResult Function(bool isFetching) getListActivities,
    required TResult Function(bool isFetching) getListExperiences,
  }) {
    return getListHosts(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
    TResult? Function(bool isFetching)? getListActivities,
    TResult? Function(bool isFetching)? getListExperiences,
  }) {
    return getListHosts?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
    TResult Function(bool isFetching)? getListActivities,
    TResult Function(bool isFetching)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListHosts != null) {
      return getListHosts(isFetching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserRole value) getUserRole,
    required TResult Function(GetListHost value) getListHosts,
    required TResult Function(GetListEvent value) getListEvents,
    required TResult Function(GetListActivities value) getListActivities,
    required TResult Function(GetListExperiences value) getListExperiences,
  }) {
    return getListHosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
    TResult? Function(GetListActivities value)? getListActivities,
    TResult? Function(GetListExperiences value)? getListExperiences,
  }) {
    return getListHosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
    TResult Function(GetListActivities value)? getListActivities,
    TResult Function(GetListExperiences value)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListHosts != null) {
      return getListHosts(this);
    }
    return orElse();
  }
}

abstract class GetListHost implements HomeEvent {
  const factory GetListHost(final bool isFetching) = _$GetListHost;

  bool get isFetching;
  @JsonKey(ignore: true)
  _$$GetListHostCopyWith<_$GetListHost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetListEventCopyWith<$Res> {
  factory _$$GetListEventCopyWith(
          _$GetListEvent value, $Res Function(_$GetListEvent) then) =
      __$$GetListEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFetching});
}

/// @nodoc
class __$$GetListEventCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetListEvent>
    implements _$$GetListEventCopyWith<$Res> {
  __$$GetListEventCopyWithImpl(
      _$GetListEvent _value, $Res Function(_$GetListEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
  }) {
    return _then(_$GetListEvent(
      null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetListEvent implements GetListEvent {
  const _$GetListEvent(this.isFetching);

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'HomeEvent.getListEvents(isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListEvent &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListEventCopyWith<_$GetListEvent> get copyWith =>
      __$$GetListEventCopyWithImpl<_$GetListEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roleUser) getUserRole,
    required TResult Function(bool isFetching) getListHosts,
    required TResult Function(bool isFetching) getListEvents,
    required TResult Function(bool isFetching) getListActivities,
    required TResult Function(bool isFetching) getListExperiences,
  }) {
    return getListEvents(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
    TResult? Function(bool isFetching)? getListActivities,
    TResult? Function(bool isFetching)? getListExperiences,
  }) {
    return getListEvents?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
    TResult Function(bool isFetching)? getListActivities,
    TResult Function(bool isFetching)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListEvents != null) {
      return getListEvents(isFetching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserRole value) getUserRole,
    required TResult Function(GetListHost value) getListHosts,
    required TResult Function(GetListEvent value) getListEvents,
    required TResult Function(GetListActivities value) getListActivities,
    required TResult Function(GetListExperiences value) getListExperiences,
  }) {
    return getListEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
    TResult? Function(GetListActivities value)? getListActivities,
    TResult? Function(GetListExperiences value)? getListExperiences,
  }) {
    return getListEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
    TResult Function(GetListActivities value)? getListActivities,
    TResult Function(GetListExperiences value)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListEvents != null) {
      return getListEvents(this);
    }
    return orElse();
  }
}

abstract class GetListEvent implements HomeEvent {
  const factory GetListEvent(final bool isFetching) = _$GetListEvent;

  bool get isFetching;
  @JsonKey(ignore: true)
  _$$GetListEventCopyWith<_$GetListEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetListActivitiesCopyWith<$Res> {
  factory _$$GetListActivitiesCopyWith(
          _$GetListActivities value, $Res Function(_$GetListActivities) then) =
      __$$GetListActivitiesCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFetching});
}

/// @nodoc
class __$$GetListActivitiesCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetListActivities>
    implements _$$GetListActivitiesCopyWith<$Res> {
  __$$GetListActivitiesCopyWithImpl(
      _$GetListActivities _value, $Res Function(_$GetListActivities) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
  }) {
    return _then(_$GetListActivities(
      null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetListActivities implements GetListActivities {
  const _$GetListActivities(this.isFetching);

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'HomeEvent.getListActivities(isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListActivities &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListActivitiesCopyWith<_$GetListActivities> get copyWith =>
      __$$GetListActivitiesCopyWithImpl<_$GetListActivities>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roleUser) getUserRole,
    required TResult Function(bool isFetching) getListHosts,
    required TResult Function(bool isFetching) getListEvents,
    required TResult Function(bool isFetching) getListActivities,
    required TResult Function(bool isFetching) getListExperiences,
  }) {
    return getListActivities(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
    TResult? Function(bool isFetching)? getListActivities,
    TResult? Function(bool isFetching)? getListExperiences,
  }) {
    return getListActivities?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
    TResult Function(bool isFetching)? getListActivities,
    TResult Function(bool isFetching)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListActivities != null) {
      return getListActivities(isFetching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserRole value) getUserRole,
    required TResult Function(GetListHost value) getListHosts,
    required TResult Function(GetListEvent value) getListEvents,
    required TResult Function(GetListActivities value) getListActivities,
    required TResult Function(GetListExperiences value) getListExperiences,
  }) {
    return getListActivities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
    TResult? Function(GetListActivities value)? getListActivities,
    TResult? Function(GetListExperiences value)? getListExperiences,
  }) {
    return getListActivities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
    TResult Function(GetListActivities value)? getListActivities,
    TResult Function(GetListExperiences value)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListActivities != null) {
      return getListActivities(this);
    }
    return orElse();
  }
}

abstract class GetListActivities implements HomeEvent {
  const factory GetListActivities(final bool isFetching) = _$GetListActivities;

  bool get isFetching;
  @JsonKey(ignore: true)
  _$$GetListActivitiesCopyWith<_$GetListActivities> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetListExperiencesCopyWith<$Res> {
  factory _$$GetListExperiencesCopyWith(_$GetListExperiences value,
          $Res Function(_$GetListExperiences) then) =
      __$$GetListExperiencesCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isFetching});
}

/// @nodoc
class __$$GetListExperiencesCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetListExperiences>
    implements _$$GetListExperiencesCopyWith<$Res> {
  __$$GetListExperiencesCopyWithImpl(
      _$GetListExperiences _value, $Res Function(_$GetListExperiences) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFetching = null,
  }) {
    return _then(_$GetListExperiences(
      null == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetListExperiences implements GetListExperiences {
  const _$GetListExperiences(this.isFetching);

  @override
  final bool isFetching;

  @override
  String toString() {
    return 'HomeEvent.getListExperiences(isFetching: $isFetching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetListExperiences &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFetching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetListExperiencesCopyWith<_$GetListExperiences> get copyWith =>
      __$$GetListExperiencesCopyWithImpl<_$GetListExperiences>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roleUser) getUserRole,
    required TResult Function(bool isFetching) getListHosts,
    required TResult Function(bool isFetching) getListEvents,
    required TResult Function(bool isFetching) getListActivities,
    required TResult Function(bool isFetching) getListExperiences,
  }) {
    return getListExperiences(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
    TResult? Function(bool isFetching)? getListActivities,
    TResult? Function(bool isFetching)? getListExperiences,
  }) {
    return getListExperiences?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
    TResult Function(bool isFetching)? getListActivities,
    TResult Function(bool isFetching)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListExperiences != null) {
      return getListExperiences(isFetching);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserRole value) getUserRole,
    required TResult Function(GetListHost value) getListHosts,
    required TResult Function(GetListEvent value) getListEvents,
    required TResult Function(GetListActivities value) getListActivities,
    required TResult Function(GetListExperiences value) getListExperiences,
  }) {
    return getListExperiences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
    TResult? Function(GetListActivities value)? getListActivities,
    TResult? Function(GetListExperiences value)? getListExperiences,
  }) {
    return getListExperiences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
    TResult Function(GetListActivities value)? getListActivities,
    TResult Function(GetListExperiences value)? getListExperiences,
    required TResult orElse(),
  }) {
    if (getListExperiences != null) {
      return getListExperiences(this);
    }
    return orElse();
  }
}

abstract class GetListExperiences implements HomeEvent {
  const factory GetListExperiences(final bool isFetching) =
      _$GetListExperiences;

  bool get isFetching;
  @JsonKey(ignore: true)
  _$$GetListExperiencesCopyWith<_$GetListExperiences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  StateStatus? get statusEvent => throw _privateConstructorUsedError;
  StateStatus? get statusActivities => throw _privateConstructorUsedError;
  StateStatus? get statusExperiences => throw _privateConstructorUsedError;
  List<Host>? get listHosts => throw _privateConstructorUsedError;
  List<Event>? get listEvents => throw _privateConstructorUsedError;
  List<Activity>? get listActivities => throw _privateConstructorUsedError;
  List<Experience>? get listExperiences => throw _privateConstructorUsedError;
  bool? get isFetching => throw _privateConstructorUsedError;
  bool? get atTheEndOfThePageHosts => throw _privateConstructorUsedError;
  bool? get atTheEndOfThePageEvents => throw _privateConstructorUsedError;
  bool? get atTheEndOfThePageActivities => throw _privateConstructorUsedError;
  bool? get atTheEndOfThePageExperiences => throw _privateConstructorUsedError;
  int? get pageHosts => throw _privateConstructorUsedError;
  int? get pageActivities => throw _privateConstructorUsedError;
  int? get pageExperiences => throw _privateConstructorUsedError;
  int? get pageEvents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      StateStatus? statusEvent,
      StateStatus? statusActivities,
      StateStatus? statusExperiences,
      List<Host>? listHosts,
      List<Event>? listEvents,
      List<Activity>? listActivities,
      List<Experience>? listExperiences,
      bool? isFetching,
      bool? atTheEndOfThePageHosts,
      bool? atTheEndOfThePageEvents,
      bool? atTheEndOfThePageActivities,
      bool? atTheEndOfThePageExperiences,
      int? pageHosts,
      int? pageActivities,
      int? pageExperiences,
      int? pageEvents});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? statusEvent = freezed,
    Object? statusActivities = freezed,
    Object? statusExperiences = freezed,
    Object? listHosts = freezed,
    Object? listEvents = freezed,
    Object? listActivities = freezed,
    Object? listExperiences = freezed,
    Object? isFetching = freezed,
    Object? atTheEndOfThePageHosts = freezed,
    Object? atTheEndOfThePageEvents = freezed,
    Object? atTheEndOfThePageActivities = freezed,
    Object? atTheEndOfThePageExperiences = freezed,
    Object? pageHosts = freezed,
    Object? pageActivities = freezed,
    Object? pageExperiences = freezed,
    Object? pageEvents = freezed,
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
      statusEvent: freezed == statusEvent
          ? _value.statusEvent
          : statusEvent // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      statusActivities: freezed == statusActivities
          ? _value.statusActivities
          : statusActivities // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      statusExperiences: freezed == statusExperiences
          ? _value.statusExperiences
          : statusExperiences // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      listHosts: freezed == listHosts
          ? _value.listHosts
          : listHosts // ignore: cast_nullable_to_non_nullable
              as List<Host>?,
      listEvents: freezed == listEvents
          ? _value.listEvents
          : listEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      listActivities: freezed == listActivities
          ? _value.listActivities
          : listActivities // ignore: cast_nullable_to_non_nullable
              as List<Activity>?,
      listExperiences: freezed == listExperiences
          ? _value.listExperiences
          : listExperiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      isFetching: freezed == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageHosts: freezed == atTheEndOfThePageHosts
          ? _value.atTheEndOfThePageHosts
          : atTheEndOfThePageHosts // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageEvents: freezed == atTheEndOfThePageEvents
          ? _value.atTheEndOfThePageEvents
          : atTheEndOfThePageEvents // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageActivities: freezed == atTheEndOfThePageActivities
          ? _value.atTheEndOfThePageActivities
          : atTheEndOfThePageActivities // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageExperiences: freezed == atTheEndOfThePageExperiences
          ? _value.atTheEndOfThePageExperiences
          : atTheEndOfThePageExperiences // ignore: cast_nullable_to_non_nullable
              as bool?,
      pageHosts: freezed == pageHosts
          ? _value.pageHosts
          : pageHosts // ignore: cast_nullable_to_non_nullable
              as int?,
      pageActivities: freezed == pageActivities
          ? _value.pageActivities
          : pageActivities // ignore: cast_nullable_to_non_nullable
              as int?,
      pageExperiences: freezed == pageExperiences
          ? _value.pageExperiences
          : pageExperiences // ignore: cast_nullable_to_non_nullable
              as int?,
      pageEvents: freezed == pageEvents
          ? _value.pageEvents
          : pageEvents // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      StateStatus? status,
      StateStatus? statusEvent,
      StateStatus? statusActivities,
      StateStatus? statusExperiences,
      List<Host>? listHosts,
      List<Event>? listEvents,
      List<Activity>? listActivities,
      List<Experience>? listExperiences,
      bool? isFetching,
      bool? atTheEndOfThePageHosts,
      bool? atTheEndOfThePageEvents,
      bool? atTheEndOfThePageActivities,
      bool? atTheEndOfThePageExperiences,
      int? pageHosts,
      int? pageActivities,
      int? pageExperiences,
      int? pageEvents});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? status = freezed,
    Object? statusEvent = freezed,
    Object? statusActivities = freezed,
    Object? statusExperiences = freezed,
    Object? listHosts = freezed,
    Object? listEvents = freezed,
    Object? listActivities = freezed,
    Object? listExperiences = freezed,
    Object? isFetching = freezed,
    Object? atTheEndOfThePageHosts = freezed,
    Object? atTheEndOfThePageEvents = freezed,
    Object? atTheEndOfThePageActivities = freezed,
    Object? atTheEndOfThePageExperiences = freezed,
    Object? pageHosts = freezed,
    Object? pageActivities = freezed,
    Object? pageExperiences = freezed,
    Object? pageEvents = freezed,
  }) {
    return _then(_$_HomeState(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      statusEvent: freezed == statusEvent
          ? _value.statusEvent
          : statusEvent // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      statusActivities: freezed == statusActivities
          ? _value.statusActivities
          : statusActivities // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      statusExperiences: freezed == statusExperiences
          ? _value.statusExperiences
          : statusExperiences // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      listHosts: freezed == listHosts
          ? _value._listHosts
          : listHosts // ignore: cast_nullable_to_non_nullable
              as List<Host>?,
      listEvents: freezed == listEvents
          ? _value._listEvents
          : listEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      listActivities: freezed == listActivities
          ? _value._listActivities
          : listActivities // ignore: cast_nullable_to_non_nullable
              as List<Activity>?,
      listExperiences: freezed == listExperiences
          ? _value._listExperiences
          : listExperiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      isFetching: freezed == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageHosts: freezed == atTheEndOfThePageHosts
          ? _value.atTheEndOfThePageHosts
          : atTheEndOfThePageHosts // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageEvents: freezed == atTheEndOfThePageEvents
          ? _value.atTheEndOfThePageEvents
          : atTheEndOfThePageEvents // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageActivities: freezed == atTheEndOfThePageActivities
          ? _value.atTheEndOfThePageActivities
          : atTheEndOfThePageActivities // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePageExperiences: freezed == atTheEndOfThePageExperiences
          ? _value.atTheEndOfThePageExperiences
          : atTheEndOfThePageExperiences // ignore: cast_nullable_to_non_nullable
              as bool?,
      pageHosts: freezed == pageHosts
          ? _value.pageHosts
          : pageHosts // ignore: cast_nullable_to_non_nullable
              as int?,
      pageActivities: freezed == pageActivities
          ? _value.pageActivities
          : pageActivities // ignore: cast_nullable_to_non_nullable
              as int?,
      pageExperiences: freezed == pageExperiences
          ? _value.pageExperiences
          : pageExperiences // ignore: cast_nullable_to_non_nullable
              as int?,
      pageEvents: freezed == pageEvents
          ? _value.pageEvents
          : pageEvents // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {this.title,
      this.status,
      this.statusEvent,
      this.statusActivities,
      this.statusExperiences,
      final List<Host>? listHosts,
      final List<Event>? listEvents,
      final List<Activity>? listActivities,
      final List<Experience>? listExperiences,
      this.isFetching,
      this.atTheEndOfThePageHosts,
      this.atTheEndOfThePageEvents,
      this.atTheEndOfThePageActivities,
      this.atTheEndOfThePageExperiences,
      this.pageHosts,
      this.pageActivities,
      this.pageExperiences,
      this.pageEvents})
      : _listHosts = listHosts,
        _listEvents = listEvents,
        _listActivities = listActivities,
        _listExperiences = listExperiences;

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final StateStatus? statusEvent;
  @override
  final StateStatus? statusActivities;
  @override
  final StateStatus? statusExperiences;
  final List<Host>? _listHosts;
  @override
  List<Host>? get listHosts {
    final value = _listHosts;
    if (value == null) return null;
    if (_listHosts is EqualUnmodifiableListView) return _listHosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Event>? _listEvents;
  @override
  List<Event>? get listEvents {
    final value = _listEvents;
    if (value == null) return null;
    if (_listEvents is EqualUnmodifiableListView) return _listEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Activity>? _listActivities;
  @override
  List<Activity>? get listActivities {
    final value = _listActivities;
    if (value == null) return null;
    if (_listActivities is EqualUnmodifiableListView) return _listActivities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Experience>? _listExperiences;
  @override
  List<Experience>? get listExperiences {
    final value = _listExperiences;
    if (value == null) return null;
    if (_listExperiences is EqualUnmodifiableListView) return _listExperiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isFetching;
  @override
  final bool? atTheEndOfThePageHosts;
  @override
  final bool? atTheEndOfThePageEvents;
  @override
  final bool? atTheEndOfThePageActivities;
  @override
  final bool? atTheEndOfThePageExperiences;
  @override
  final int? pageHosts;
  @override
  final int? pageActivities;
  @override
  final int? pageExperiences;
  @override
  final int? pageEvents;

  @override
  String toString() {
    return 'HomeState(title: $title, status: $status, statusEvent: $statusEvent, statusActivities: $statusActivities, statusExperiences: $statusExperiences, listHosts: $listHosts, listEvents: $listEvents, listActivities: $listActivities, listExperiences: $listExperiences, isFetching: $isFetching, atTheEndOfThePageHosts: $atTheEndOfThePageHosts, atTheEndOfThePageEvents: $atTheEndOfThePageEvents, atTheEndOfThePageActivities: $atTheEndOfThePageActivities, atTheEndOfThePageExperiences: $atTheEndOfThePageExperiences, pageHosts: $pageHosts, pageActivities: $pageActivities, pageExperiences: $pageExperiences, pageEvents: $pageEvents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusEvent, statusEvent) ||
                other.statusEvent == statusEvent) &&
            (identical(other.statusActivities, statusActivities) ||
                other.statusActivities == statusActivities) &&
            (identical(other.statusExperiences, statusExperiences) ||
                other.statusExperiences == statusExperiences) &&
            const DeepCollectionEquality()
                .equals(other._listHosts, _listHosts) &&
            const DeepCollectionEquality()
                .equals(other._listEvents, _listEvents) &&
            const DeepCollectionEquality()
                .equals(other._listActivities, _listActivities) &&
            const DeepCollectionEquality()
                .equals(other._listExperiences, _listExperiences) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.atTheEndOfThePageHosts, atTheEndOfThePageHosts) ||
                other.atTheEndOfThePageHosts == atTheEndOfThePageHosts) &&
            (identical(
                    other.atTheEndOfThePageEvents, atTheEndOfThePageEvents) ||
                other.atTheEndOfThePageEvents == atTheEndOfThePageEvents) &&
            (identical(other.atTheEndOfThePageActivities,
                    atTheEndOfThePageActivities) ||
                other.atTheEndOfThePageActivities ==
                    atTheEndOfThePageActivities) &&
            (identical(other.atTheEndOfThePageExperiences,
                    atTheEndOfThePageExperiences) ||
                other.atTheEndOfThePageExperiences ==
                    atTheEndOfThePageExperiences) &&
            (identical(other.pageHosts, pageHosts) ||
                other.pageHosts == pageHosts) &&
            (identical(other.pageActivities, pageActivities) ||
                other.pageActivities == pageActivities) &&
            (identical(other.pageExperiences, pageExperiences) ||
                other.pageExperiences == pageExperiences) &&
            (identical(other.pageEvents, pageEvents) ||
                other.pageEvents == pageEvents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      status,
      statusEvent,
      statusActivities,
      statusExperiences,
      const DeepCollectionEquality().hash(_listHosts),
      const DeepCollectionEquality().hash(_listEvents),
      const DeepCollectionEquality().hash(_listActivities),
      const DeepCollectionEquality().hash(_listExperiences),
      isFetching,
      atTheEndOfThePageHosts,
      atTheEndOfThePageEvents,
      atTheEndOfThePageActivities,
      atTheEndOfThePageExperiences,
      pageHosts,
      pageActivities,
      pageExperiences,
      pageEvents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final String? title,
      final StateStatus? status,
      final StateStatus? statusEvent,
      final StateStatus? statusActivities,
      final StateStatus? statusExperiences,
      final List<Host>? listHosts,
      final List<Event>? listEvents,
      final List<Activity>? listActivities,
      final List<Experience>? listExperiences,
      final bool? isFetching,
      final bool? atTheEndOfThePageHosts,
      final bool? atTheEndOfThePageEvents,
      final bool? atTheEndOfThePageActivities,
      final bool? atTheEndOfThePageExperiences,
      final int? pageHosts,
      final int? pageActivities,
      final int? pageExperiences,
      final int? pageEvents}) = _$_HomeState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  StateStatus? get statusEvent;
  @override
  StateStatus? get statusActivities;
  @override
  StateStatus? get statusExperiences;
  @override
  List<Host>? get listHosts;
  @override
  List<Event>? get listEvents;
  @override
  List<Activity>? get listActivities;
  @override
  List<Experience>? get listExperiences;
  @override
  bool? get isFetching;
  @override
  bool? get atTheEndOfThePageHosts;
  @override
  bool? get atTheEndOfThePageEvents;
  @override
  bool? get atTheEndOfThePageActivities;
  @override
  bool? get atTheEndOfThePageExperiences;
  @override
  int? get pageHosts;
  @override
  int? get pageActivities;
  @override
  int? get pageExperiences;
  @override
  int? get pageEvents;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
