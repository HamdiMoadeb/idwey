// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) setEmail,
    required TResult Function(String email) setPassword,
    required TResult Function(String email) setConfirmPassword,
    required TResult Function(String email) setFirstName,
    required TResult Function() signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? setEmail,
    TResult? Function(String email)? setPassword,
    TResult? Function(String email)? setConfirmPassword,
    TResult? Function(String email)? setFirstName,
    TResult? Function()? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? setEmail,
    TResult Function(String email)? setPassword,
    TResult Function(String email)? setConfirmPassword,
    TResult Function(String email)? setFirstName,
    TResult Function()? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPassword value) setPassword,
    required TResult Function(_SetConfirmPassword value) setConfirmPassword,
    required TResult Function(_SetFirstName value) setFirstName,
    required TResult Function(_SignUp value) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPassword value)? setPassword,
    TResult? Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult? Function(_SetFirstName value)? setFirstName,
    TResult? Function(_SignUp value)? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPassword value)? setPassword,
    TResult Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult Function(_SetFirstName value)? setFirstName,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res, SignUpEvent>;
}

/// @nodoc
class _$SignUpEventCopyWithImpl<$Res, $Val extends SignUpEvent>
    implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SetEmailCopyWith<$Res> {
  factory _$$_SetEmailCopyWith(
          _$_SetEmail value, $Res Function(_$_SetEmail) then) =
      __$$_SetEmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_SetEmailCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$_SetEmail>
    implements _$$_SetEmailCopyWith<$Res> {
  __$$_SetEmailCopyWithImpl(
      _$_SetEmail _value, $Res Function(_$_SetEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_SetEmail(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetEmail implements _SetEmail {
  const _$_SetEmail(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignUpEvent.setEmail(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetEmail &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetEmailCopyWith<_$_SetEmail> get copyWith =>
      __$$_SetEmailCopyWithImpl<_$_SetEmail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) setEmail,
    required TResult Function(String email) setPassword,
    required TResult Function(String email) setConfirmPassword,
    required TResult Function(String email) setFirstName,
    required TResult Function() signUp,
  }) {
    return setEmail(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? setEmail,
    TResult? Function(String email)? setPassword,
    TResult? Function(String email)? setConfirmPassword,
    TResult? Function(String email)? setFirstName,
    TResult? Function()? signUp,
  }) {
    return setEmail?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? setEmail,
    TResult Function(String email)? setPassword,
    TResult Function(String email)? setConfirmPassword,
    TResult Function(String email)? setFirstName,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (setEmail != null) {
      return setEmail(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPassword value) setPassword,
    required TResult Function(_SetConfirmPassword value) setConfirmPassword,
    required TResult Function(_SetFirstName value) setFirstName,
    required TResult Function(_SignUp value) signUp,
  }) {
    return setEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPassword value)? setPassword,
    TResult? Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult? Function(_SetFirstName value)? setFirstName,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return setEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPassword value)? setPassword,
    TResult Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult Function(_SetFirstName value)? setFirstName,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (setEmail != null) {
      return setEmail(this);
    }
    return orElse();
  }
}

abstract class _SetEmail implements SignUpEvent {
  const factory _SetEmail(final String password) = _$_SetEmail;

  String get password;
  @JsonKey(ignore: true)
  _$$_SetEmailCopyWith<_$_SetEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetPasswordCopyWith<$Res> {
  factory _$$_SetPasswordCopyWith(
          _$_SetPassword value, $Res Function(_$_SetPassword) then) =
      __$$_SetPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_SetPasswordCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$_SetPassword>
    implements _$$_SetPasswordCopyWith<$Res> {
  __$$_SetPasswordCopyWithImpl(
      _$_SetPassword _value, $Res Function(_$_SetPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_SetPassword(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetPassword implements _SetPassword {
  const _$_SetPassword(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignUpEvent.setPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetPassword &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetPasswordCopyWith<_$_SetPassword> get copyWith =>
      __$$_SetPasswordCopyWithImpl<_$_SetPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) setEmail,
    required TResult Function(String email) setPassword,
    required TResult Function(String email) setConfirmPassword,
    required TResult Function(String email) setFirstName,
    required TResult Function() signUp,
  }) {
    return setPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? setEmail,
    TResult? Function(String email)? setPassword,
    TResult? Function(String email)? setConfirmPassword,
    TResult? Function(String email)? setFirstName,
    TResult? Function()? signUp,
  }) {
    return setPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? setEmail,
    TResult Function(String email)? setPassword,
    TResult Function(String email)? setConfirmPassword,
    TResult Function(String email)? setFirstName,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (setPassword != null) {
      return setPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPassword value) setPassword,
    required TResult Function(_SetConfirmPassword value) setConfirmPassword,
    required TResult Function(_SetFirstName value) setFirstName,
    required TResult Function(_SignUp value) signUp,
  }) {
    return setPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPassword value)? setPassword,
    TResult? Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult? Function(_SetFirstName value)? setFirstName,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return setPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPassword value)? setPassword,
    TResult Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult Function(_SetFirstName value)? setFirstName,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (setPassword != null) {
      return setPassword(this);
    }
    return orElse();
  }
}

abstract class _SetPassword implements SignUpEvent {
  const factory _SetPassword(final String email) = _$_SetPassword;

  String get email;
  @JsonKey(ignore: true)
  _$$_SetPasswordCopyWith<_$_SetPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetConfirmPasswordCopyWith<$Res> {
  factory _$$_SetConfirmPasswordCopyWith(_$_SetConfirmPassword value,
          $Res Function(_$_SetConfirmPassword) then) =
      __$$_SetConfirmPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_SetConfirmPasswordCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$_SetConfirmPassword>
    implements _$$_SetConfirmPasswordCopyWith<$Res> {
  __$$_SetConfirmPasswordCopyWithImpl(
      _$_SetConfirmPassword _value, $Res Function(_$_SetConfirmPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_SetConfirmPassword(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetConfirmPassword implements _SetConfirmPassword {
  const _$_SetConfirmPassword(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignUpEvent.setConfirmPassword(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetConfirmPassword &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetConfirmPasswordCopyWith<_$_SetConfirmPassword> get copyWith =>
      __$$_SetConfirmPasswordCopyWithImpl<_$_SetConfirmPassword>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) setEmail,
    required TResult Function(String email) setPassword,
    required TResult Function(String email) setConfirmPassword,
    required TResult Function(String email) setFirstName,
    required TResult Function() signUp,
  }) {
    return setConfirmPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? setEmail,
    TResult? Function(String email)? setPassword,
    TResult? Function(String email)? setConfirmPassword,
    TResult? Function(String email)? setFirstName,
    TResult? Function()? signUp,
  }) {
    return setConfirmPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? setEmail,
    TResult Function(String email)? setPassword,
    TResult Function(String email)? setConfirmPassword,
    TResult Function(String email)? setFirstName,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (setConfirmPassword != null) {
      return setConfirmPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPassword value) setPassword,
    required TResult Function(_SetConfirmPassword value) setConfirmPassword,
    required TResult Function(_SetFirstName value) setFirstName,
    required TResult Function(_SignUp value) signUp,
  }) {
    return setConfirmPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPassword value)? setPassword,
    TResult? Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult? Function(_SetFirstName value)? setFirstName,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return setConfirmPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPassword value)? setPassword,
    TResult Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult Function(_SetFirstName value)? setFirstName,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (setConfirmPassword != null) {
      return setConfirmPassword(this);
    }
    return orElse();
  }
}

abstract class _SetConfirmPassword implements SignUpEvent {
  const factory _SetConfirmPassword(final String email) = _$_SetConfirmPassword;

  String get email;
  @JsonKey(ignore: true)
  _$$_SetConfirmPasswordCopyWith<_$_SetConfirmPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SetFirstNameCopyWith<$Res> {
  factory _$$_SetFirstNameCopyWith(
          _$_SetFirstName value, $Res Function(_$_SetFirstName) then) =
      __$$_SetFirstNameCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_SetFirstNameCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$_SetFirstName>
    implements _$$_SetFirstNameCopyWith<$Res> {
  __$$_SetFirstNameCopyWithImpl(
      _$_SetFirstName _value, $Res Function(_$_SetFirstName) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_SetFirstName(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SetFirstName implements _SetFirstName {
  const _$_SetFirstName(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignUpEvent.setFirstName(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetFirstName &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetFirstNameCopyWith<_$_SetFirstName> get copyWith =>
      __$$_SetFirstNameCopyWithImpl<_$_SetFirstName>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) setEmail,
    required TResult Function(String email) setPassword,
    required TResult Function(String email) setConfirmPassword,
    required TResult Function(String email) setFirstName,
    required TResult Function() signUp,
  }) {
    return setFirstName(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? setEmail,
    TResult? Function(String email)? setPassword,
    TResult? Function(String email)? setConfirmPassword,
    TResult? Function(String email)? setFirstName,
    TResult? Function()? signUp,
  }) {
    return setFirstName?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? setEmail,
    TResult Function(String email)? setPassword,
    TResult Function(String email)? setConfirmPassword,
    TResult Function(String email)? setFirstName,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (setFirstName != null) {
      return setFirstName(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPassword value) setPassword,
    required TResult Function(_SetConfirmPassword value) setConfirmPassword,
    required TResult Function(_SetFirstName value) setFirstName,
    required TResult Function(_SignUp value) signUp,
  }) {
    return setFirstName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPassword value)? setPassword,
    TResult? Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult? Function(_SetFirstName value)? setFirstName,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return setFirstName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPassword value)? setPassword,
    TResult Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult Function(_SetFirstName value)? setFirstName,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (setFirstName != null) {
      return setFirstName(this);
    }
    return orElse();
  }
}

abstract class _SetFirstName implements SignUpEvent {
  const factory _SetFirstName(final String email) = _$_SetFirstName;

  String get email;
  @JsonKey(ignore: true)
  _$$_SetFirstNameCopyWith<_$_SetFirstName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpCopyWith<$Res> {
  factory _$$_SignUpCopyWith(_$_SignUp value, $Res Function(_$_SignUp) then) =
      __$$_SignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignUpCopyWithImpl<$Res>
    extends _$SignUpEventCopyWithImpl<$Res, _$_SignUp>
    implements _$$_SignUpCopyWith<$Res> {
  __$$_SignUpCopyWithImpl(_$_SignUp _value, $Res Function(_$_SignUp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignUp implements _SignUp {
  const _$_SignUp();

  @override
  String toString() {
    return 'SignUpEvent.signUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password) setEmail,
    required TResult Function(String email) setPassword,
    required TResult Function(String email) setConfirmPassword,
    required TResult Function(String email) setFirstName,
    required TResult Function() signUp,
  }) {
    return signUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password)? setEmail,
    TResult? Function(String email)? setPassword,
    TResult? Function(String email)? setConfirmPassword,
    TResult? Function(String email)? setFirstName,
    TResult? Function()? signUp,
  }) {
    return signUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password)? setEmail,
    TResult Function(String email)? setPassword,
    TResult Function(String email)? setConfirmPassword,
    TResult Function(String email)? setFirstName,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetEmail value) setEmail,
    required TResult Function(_SetPassword value) setPassword,
    required TResult Function(_SetConfirmPassword value) setConfirmPassword,
    required TResult Function(_SetFirstName value) setFirstName,
    required TResult Function(_SignUp value) signUp,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetEmail value)? setEmail,
    TResult? Function(_SetPassword value)? setPassword,
    TResult? Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult? Function(_SetFirstName value)? setFirstName,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetEmail value)? setEmail,
    TResult Function(_SetPassword value)? setPassword,
    TResult Function(_SetConfirmPassword value)? setConfirmPassword,
    TResult Function(_SetFirstName value)? setFirstName,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements SignUpEvent {
  const factory _SignUp() = _$_SignUp;
}

/// @nodoc
mixin _$SignUpState {
  StateStatus? get status => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get confirmPassword => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  bool? get isValid => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res, SignUpState>;
  @useResult
  $Res call(
      {StateStatus? status,
      String? email,
      String? password,
      String? confirmPassword,
      String? firstName,
      bool? isValid,
      String? errorText});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res, $Val extends SignUpState>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? firstName = freezed,
    Object? isValid = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$$_SignUpStateCopyWith(
          _$_SignUpState value, $Res Function(_$_SignUpState) then) =
      __$$_SignUpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StateStatus? status,
      String? email,
      String? password,
      String? confirmPassword,
      String? firstName,
      bool? isValid,
      String? errorText});
}

/// @nodoc
class __$$_SignUpStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res, _$_SignUpState>
    implements _$$_SignUpStateCopyWith<$Res> {
  __$$_SignUpStateCopyWithImpl(
      _$_SignUpState _value, $Res Function(_$_SignUpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? confirmPassword = freezed,
    Object? firstName = freezed,
    Object? isValid = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_$_SignUpState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: freezed == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: freezed == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SignUpState implements _SignUpState {
  const _$_SignUpState(
      {this.status,
      this.email,
      this.password,
      this.confirmPassword,
      this.firstName,
      this.isValid,
      this.errorText});

  @override
  final StateStatus? status;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? confirmPassword;
  @override
  final String? firstName;
  @override
  final bool? isValid;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SignUpState(status: $status, email: $email, password: $password, confirmPassword: $confirmPassword, firstName: $firstName, isValid: $isValid, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, password,
      confirmPassword, firstName, isValid, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      __$$_SignUpStateCopyWithImpl<_$_SignUpState>(this, _$identity);
}

abstract class _SignUpState implements SignUpState {
  const factory _SignUpState(
      {final StateStatus? status,
      final String? email,
      final String? password,
      final String? confirmPassword,
      final String? firstName,
      final bool? isValid,
      final String? errorText}) = _$_SignUpState;

  @override
  StateStatus? get status;
  @override
  String? get email;
  @override
  String? get password;
  @override
  String? get confirmPassword;
  @override
  String? get firstName;
  @override
  bool? get isValid;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpStateCopyWith<_$_SignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
