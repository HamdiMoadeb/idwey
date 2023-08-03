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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserRole value) getUserRole,
    required TResult Function(GetListHost value) getListHosts,
    required TResult Function(GetListEvent value) getListEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
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
  }) {
    return getUserRole(roleUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
  }) {
    return getUserRole?.call(roleUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
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
  }) {
    return getUserRole(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
  }) {
    return getUserRole?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
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
  }) {
    return getListHosts(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
  }) {
    return getListHosts?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
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
  }) {
    return getListHosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
  }) {
    return getListHosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
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
  }) {
    return getListEvents(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roleUser)? getUserRole,
    TResult? Function(bool isFetching)? getListHosts,
    TResult? Function(bool isFetching)? getListEvents,
  }) {
    return getListEvents?.call(isFetching);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roleUser)? getUserRole,
    TResult Function(bool isFetching)? getListHosts,
    TResult Function(bool isFetching)? getListEvents,
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
  }) {
    return getListEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserRole value)? getUserRole,
    TResult? Function(GetListHost value)? getListHosts,
    TResult? Function(GetListEvent value)? getListEvents,
  }) {
    return getListEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserRole value)? getUserRole,
    TResult Function(GetListHost value)? getListHosts,
    TResult Function(GetListEvent value)? getListEvents,
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
mixin _$HomeState {
  String? get title => throw _privateConstructorUsedError;
  StateStatus? get status => throw _privateConstructorUsedError;
  StateStatus? get statusEvent => throw _privateConstructorUsedError;
  List<Host>? get listHosts => throw _privateConstructorUsedError;
  List<Event>? get listEvents => throw _privateConstructorUsedError;
  bool? get isFetching => throw _privateConstructorUsedError;
  bool? get atTheEndOfThePage => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

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
      List<Host>? listHosts,
      List<Event>? listEvents,
      bool? isFetching,
      bool? atTheEndOfThePage,
      int? page});
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
    Object? listHosts = freezed,
    Object? listEvents = freezed,
    Object? isFetching = freezed,
    Object? atTheEndOfThePage = freezed,
    Object? page = freezed,
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
      listHosts: freezed == listHosts
          ? _value.listHosts
          : listHosts // ignore: cast_nullable_to_non_nullable
              as List<Host>?,
      listEvents: freezed == listEvents
          ? _value.listEvents
          : listEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      isFetching: freezed == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePage: freezed == atTheEndOfThePage
          ? _value.atTheEndOfThePage
          : atTheEndOfThePage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
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
      List<Host>? listHosts,
      List<Event>? listEvents,
      bool? isFetching,
      bool? atTheEndOfThePage,
      int? page});
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
    Object? listHosts = freezed,
    Object? listEvents = freezed,
    Object? isFetching = freezed,
    Object? atTheEndOfThePage = freezed,
    Object? page = freezed,
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
      listHosts: freezed == listHosts
          ? _value._listHosts
          : listHosts // ignore: cast_nullable_to_non_nullable
              as List<Host>?,
      listEvents: freezed == listEvents
          ? _value._listEvents
          : listEvents // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      isFetching: freezed == isFetching
          ? _value.isFetching
          : isFetching // ignore: cast_nullable_to_non_nullable
              as bool?,
      atTheEndOfThePage: freezed == atTheEndOfThePage
          ? _value.atTheEndOfThePage
          : atTheEndOfThePage // ignore: cast_nullable_to_non_nullable
              as bool?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
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
      final List<Host>? listHosts,
      final List<Event>? listEvents,
      this.isFetching,
      this.atTheEndOfThePage,
      this.page})
      : _listHosts = listHosts,
        _listEvents = listEvents;

  @override
  final String? title;
  @override
  final StateStatus? status;
  @override
  final StateStatus? statusEvent;
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

  @override
  final bool? isFetching;
  @override
  final bool? atTheEndOfThePage;
  @override
  final int? page;

  @override
  String toString() {
    return 'HomeState(title: $title, status: $status, statusEvent: $statusEvent, listHosts: $listHosts, listEvents: $listEvents, isFetching: $isFetching, atTheEndOfThePage: $atTheEndOfThePage, page: $page)';
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
            const DeepCollectionEquality()
                .equals(other._listHosts, _listHosts) &&
            const DeepCollectionEquality()
                .equals(other._listEvents, _listEvents) &&
            (identical(other.isFetching, isFetching) ||
                other.isFetching == isFetching) &&
            (identical(other.atTheEndOfThePage, atTheEndOfThePage) ||
                other.atTheEndOfThePage == atTheEndOfThePage) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      status,
      statusEvent,
      const DeepCollectionEquality().hash(_listHosts),
      const DeepCollectionEquality().hash(_listEvents),
      isFetching,
      atTheEndOfThePage,
      page);

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
      final List<Host>? listHosts,
      final List<Event>? listEvents,
      final bool? isFetching,
      final bool? atTheEndOfThePage,
      final int? page}) = _$_HomeState;

  @override
  String? get title;
  @override
  StateStatus? get status;
  @override
  StateStatus? get statusEvent;
  @override
  List<Host>? get listHosts;
  @override
  List<Event>? get listEvents;
  @override
  bool? get isFetching;
  @override
  bool? get atTheEndOfThePage;
  @override
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
