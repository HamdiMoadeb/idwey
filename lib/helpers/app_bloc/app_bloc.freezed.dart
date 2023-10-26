// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() setLoggedIn,
    required TResult Function() setLoggedOut,
    required TResult Function() getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? setLoggedIn,
    TResult? Function()? setLoggedOut,
    TResult? Function()? getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? setLoggedIn,
    TResult Function()? setLoggedOut,
    TResult Function()? getUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetLoggedIn value) setLoggedIn,
    required TResult Function(_SetLoggedOut value) setLoggedOut,
    required TResult Function(_GetUser value) getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetLoggedIn value)? setLoggedIn,
    TResult? Function(_SetLoggedOut value)? setLoggedOut,
    TResult? Function(_GetUser value)? getUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetLoggedIn value)? setLoggedIn,
    TResult Function(_SetLoggedOut value)? setLoggedOut,
    TResult Function(_GetUser value)? getUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SetLoggedInCopyWith<$Res> {
  factory _$$_SetLoggedInCopyWith(
          _$_SetLoggedIn value, $Res Function(_$_SetLoggedIn) then) =
      __$$_SetLoggedInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetLoggedInCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_SetLoggedIn>
    implements _$$_SetLoggedInCopyWith<$Res> {
  __$$_SetLoggedInCopyWithImpl(
      _$_SetLoggedIn _value, $Res Function(_$_SetLoggedIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SetLoggedIn implements _SetLoggedIn {
  const _$_SetLoggedIn();

  @override
  String toString() {
    return 'AppEvent.setLoggedIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SetLoggedIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() setLoggedIn,
    required TResult Function() setLoggedOut,
    required TResult Function() getUser,
  }) {
    return setLoggedIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? setLoggedIn,
    TResult? Function()? setLoggedOut,
    TResult? Function()? getUser,
  }) {
    return setLoggedIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? setLoggedIn,
    TResult Function()? setLoggedOut,
    TResult Function()? getUser,
    required TResult orElse(),
  }) {
    if (setLoggedIn != null) {
      return setLoggedIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetLoggedIn value) setLoggedIn,
    required TResult Function(_SetLoggedOut value) setLoggedOut,
    required TResult Function(_GetUser value) getUser,
  }) {
    return setLoggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetLoggedIn value)? setLoggedIn,
    TResult? Function(_SetLoggedOut value)? setLoggedOut,
    TResult? Function(_GetUser value)? getUser,
  }) {
    return setLoggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetLoggedIn value)? setLoggedIn,
    TResult Function(_SetLoggedOut value)? setLoggedOut,
    TResult Function(_GetUser value)? getUser,
    required TResult orElse(),
  }) {
    if (setLoggedIn != null) {
      return setLoggedIn(this);
    }
    return orElse();
  }
}

abstract class _SetLoggedIn implements AppEvent {
  const factory _SetLoggedIn() = _$_SetLoggedIn;
}

/// @nodoc
abstract class _$$_SetLoggedOutCopyWith<$Res> {
  factory _$$_SetLoggedOutCopyWith(
          _$_SetLoggedOut value, $Res Function(_$_SetLoggedOut) then) =
      __$$_SetLoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SetLoggedOutCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_SetLoggedOut>
    implements _$$_SetLoggedOutCopyWith<$Res> {
  __$$_SetLoggedOutCopyWithImpl(
      _$_SetLoggedOut _value, $Res Function(_$_SetLoggedOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SetLoggedOut implements _SetLoggedOut {
  const _$_SetLoggedOut();

  @override
  String toString() {
    return 'AppEvent.setLoggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SetLoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() setLoggedIn,
    required TResult Function() setLoggedOut,
    required TResult Function() getUser,
  }) {
    return setLoggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? setLoggedIn,
    TResult? Function()? setLoggedOut,
    TResult? Function()? getUser,
  }) {
    return setLoggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? setLoggedIn,
    TResult Function()? setLoggedOut,
    TResult Function()? getUser,
    required TResult orElse(),
  }) {
    if (setLoggedOut != null) {
      return setLoggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetLoggedIn value) setLoggedIn,
    required TResult Function(_SetLoggedOut value) setLoggedOut,
    required TResult Function(_GetUser value) getUser,
  }) {
    return setLoggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetLoggedIn value)? setLoggedIn,
    TResult? Function(_SetLoggedOut value)? setLoggedOut,
    TResult? Function(_GetUser value)? getUser,
  }) {
    return setLoggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetLoggedIn value)? setLoggedIn,
    TResult Function(_SetLoggedOut value)? setLoggedOut,
    TResult Function(_GetUser value)? getUser,
    required TResult orElse(),
  }) {
    if (setLoggedOut != null) {
      return setLoggedOut(this);
    }
    return orElse();
  }
}

abstract class _SetLoggedOut implements AppEvent {
  const factory _SetLoggedOut() = _$_SetLoggedOut;
}

/// @nodoc
abstract class _$$_GetUserCopyWith<$Res> {
  factory _$$_GetUserCopyWith(
          _$_GetUser value, $Res Function(_$_GetUser) then) =
      __$$_GetUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetUserCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$_GetUser>
    implements _$$_GetUserCopyWith<$Res> {
  __$$_GetUserCopyWithImpl(_$_GetUser _value, $Res Function(_$_GetUser) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetUser implements _GetUser {
  const _$_GetUser();

  @override
  String toString() {
    return 'AppEvent.getUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() setLoggedIn,
    required TResult Function() setLoggedOut,
    required TResult Function() getUser,
  }) {
    return getUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? setLoggedIn,
    TResult? Function()? setLoggedOut,
    TResult? Function()? getUser,
  }) {
    return getUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? setLoggedIn,
    TResult Function()? setLoggedOut,
    TResult Function()? getUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetLoggedIn value) setLoggedIn,
    required TResult Function(_SetLoggedOut value) setLoggedOut,
    required TResult Function(_GetUser value) getUser,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetLoggedIn value)? setLoggedIn,
    TResult? Function(_SetLoggedOut value)? setLoggedOut,
    TResult? Function(_GetUser value)? getUser,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetLoggedIn value)? setLoggedIn,
    TResult Function(_SetLoggedOut value)? setLoggedOut,
    TResult Function(_GetUser value)? getUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements AppEvent {
  const factory _GetUser() = _$_GetUser;
}

/// @nodoc
mixin _$AppState {
  StateStatus? get status => throw _privateConstructorUsedError;
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lastname => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {StateStatus? status,
      bool? isLoggedIn,
      String? name,
      String? lastname,
      String? email,
      String? phone,
      String? id});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isLoggedIn = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StateStatus? status,
      bool? isLoggedIn,
      String? name,
      String? lastname,
      String? email,
      String? phone,
      String? id});
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? isLoggedIn = freezed,
    Object? name = freezed,
    Object? lastname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_AppState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      isLoggedIn: freezed == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastname: freezed == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {this.status,
      this.isLoggedIn,
      this.name,
      this.lastname,
      this.email,
      this.phone,
      this.id});

  @override
  final StateStatus? status;
  @override
  final bool? isLoggedIn;
  @override
  final String? name;
  @override
  final String? lastname;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  final String? id;

  @override
  String toString() {
    return 'AppState(status: $status, isLoggedIn: $isLoggedIn, name: $name, lastname: $lastname, email: $email, phone: $phone, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, isLoggedIn, name, lastname, email, phone, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final StateStatus? status,
      final bool? isLoggedIn,
      final String? name,
      final String? lastname,
      final String? email,
      final String? phone,
      final String? id}) = _$_AppState;

  @override
  StateStatus? get status;
  @override
  bool? get isLoggedIn;
  @override
  String? get name;
  @override
  String? get lastname;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
