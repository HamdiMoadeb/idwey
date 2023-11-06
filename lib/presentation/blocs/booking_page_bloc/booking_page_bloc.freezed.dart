// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookingPageEvent {
  int get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBookingList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBookingList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBookingList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBookingList value) getBookingList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBookingList value)? getBookingList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBookingList value)? getBookingList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingPageEventCopyWith<BookingPageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingPageEventCopyWith<$Res> {
  factory $BookingPageEventCopyWith(
          BookingPageEvent value, $Res Function(BookingPageEvent) then) =
      _$BookingPageEventCopyWithImpl<$Res, BookingPageEvent>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$BookingPageEventCopyWithImpl<$Res, $Val extends BookingPageEvent>
    implements $BookingPageEventCopyWith<$Res> {
  _$BookingPageEventCopyWithImpl(this._value, this._then);

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
abstract class _$$_GetBookingListCopyWith<$Res>
    implements $BookingPageEventCopyWith<$Res> {
  factory _$$_GetBookingListCopyWith(
          _$_GetBookingList value, $Res Function(_$_GetBookingList) then) =
      __$$_GetBookingListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_GetBookingListCopyWithImpl<$Res>
    extends _$BookingPageEventCopyWithImpl<$Res, _$_GetBookingList>
    implements _$$_GetBookingListCopyWith<$Res> {
  __$$_GetBookingListCopyWithImpl(
      _$_GetBookingList _value, $Res Function(_$_GetBookingList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetBookingList(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetBookingList implements _GetBookingList {
  const _$_GetBookingList(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'BookingPageEvent.getBookingList(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetBookingList &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetBookingListCopyWith<_$_GetBookingList> get copyWith =>
      __$$_GetBookingListCopyWithImpl<_$_GetBookingList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) getBookingList,
  }) {
    return getBookingList(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? getBookingList,
  }) {
    return getBookingList?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? getBookingList,
    required TResult orElse(),
  }) {
    if (getBookingList != null) {
      return getBookingList(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetBookingList value) getBookingList,
  }) {
    return getBookingList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetBookingList value)? getBookingList,
  }) {
    return getBookingList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetBookingList value)? getBookingList,
    required TResult orElse(),
  }) {
    if (getBookingList != null) {
      return getBookingList(this);
    }
    return orElse();
  }
}

abstract class _GetBookingList implements BookingPageEvent {
  const factory _GetBookingList(final int id) = _$_GetBookingList;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_GetBookingListCopyWith<_$_GetBookingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingPageState {
  StateStatus? get status => throw _privateConstructorUsedError;
  List<BookingDto>? get bookingList => throw _privateConstructorUsedError;
  List<BookingDto>? get waitingBookingList =>
      throw _privateConstructorUsedError;
  List<BookingDto>? get canceledBookingList =>
      throw _privateConstructorUsedError;
  List<BookingDto>? get confirmedBookingList =>
      throw _privateConstructorUsedError;
  List<BookingDto>? get paidBookingList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingPageStateCopyWith<BookingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingPageStateCopyWith<$Res> {
  factory $BookingPageStateCopyWith(
          BookingPageState value, $Res Function(BookingPageState) then) =
      _$BookingPageStateCopyWithImpl<$Res, BookingPageState>;
  @useResult
  $Res call(
      {StateStatus? status,
      List<BookingDto>? bookingList,
      List<BookingDto>? waitingBookingList,
      List<BookingDto>? canceledBookingList,
      List<BookingDto>? confirmedBookingList,
      List<BookingDto>? paidBookingList});
}

/// @nodoc
class _$BookingPageStateCopyWithImpl<$Res, $Val extends BookingPageState>
    implements $BookingPageStateCopyWith<$Res> {
  _$BookingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? bookingList = freezed,
    Object? waitingBookingList = freezed,
    Object? canceledBookingList = freezed,
    Object? confirmedBookingList = freezed,
    Object? paidBookingList = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      bookingList: freezed == bookingList
          ? _value.bookingList
          : bookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      waitingBookingList: freezed == waitingBookingList
          ? _value.waitingBookingList
          : waitingBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      canceledBookingList: freezed == canceledBookingList
          ? _value.canceledBookingList
          : canceledBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      confirmedBookingList: freezed == confirmedBookingList
          ? _value.confirmedBookingList
          : confirmedBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      paidBookingList: freezed == paidBookingList
          ? _value.paidBookingList
          : paidBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingPageStateCopyWith<$Res>
    implements $BookingPageStateCopyWith<$Res> {
  factory _$$_BookingPageStateCopyWith(
          _$_BookingPageState value, $Res Function(_$_BookingPageState) then) =
      __$$_BookingPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StateStatus? status,
      List<BookingDto>? bookingList,
      List<BookingDto>? waitingBookingList,
      List<BookingDto>? canceledBookingList,
      List<BookingDto>? confirmedBookingList,
      List<BookingDto>? paidBookingList});
}

/// @nodoc
class __$$_BookingPageStateCopyWithImpl<$Res>
    extends _$BookingPageStateCopyWithImpl<$Res, _$_BookingPageState>
    implements _$$_BookingPageStateCopyWith<$Res> {
  __$$_BookingPageStateCopyWithImpl(
      _$_BookingPageState _value, $Res Function(_$_BookingPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? bookingList = freezed,
    Object? waitingBookingList = freezed,
    Object? canceledBookingList = freezed,
    Object? confirmedBookingList = freezed,
    Object? paidBookingList = freezed,
  }) {
    return _then(_$_BookingPageState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      bookingList: freezed == bookingList
          ? _value._bookingList
          : bookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      waitingBookingList: freezed == waitingBookingList
          ? _value._waitingBookingList
          : waitingBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      canceledBookingList: freezed == canceledBookingList
          ? _value._canceledBookingList
          : canceledBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      confirmedBookingList: freezed == confirmedBookingList
          ? _value._confirmedBookingList
          : confirmedBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
      paidBookingList: freezed == paidBookingList
          ? _value._paidBookingList
          : paidBookingList // ignore: cast_nullable_to_non_nullable
              as List<BookingDto>?,
    ));
  }
}

/// @nodoc

class _$_BookingPageState implements _BookingPageState {
  const _$_BookingPageState(
      {this.status,
      final List<BookingDto>? bookingList,
      final List<BookingDto>? waitingBookingList,
      final List<BookingDto>? canceledBookingList,
      final List<BookingDto>? confirmedBookingList,
      final List<BookingDto>? paidBookingList})
      : _bookingList = bookingList,
        _waitingBookingList = waitingBookingList,
        _canceledBookingList = canceledBookingList,
        _confirmedBookingList = confirmedBookingList,
        _paidBookingList = paidBookingList;

  @override
  final StateStatus? status;
  final List<BookingDto>? _bookingList;
  @override
  List<BookingDto>? get bookingList {
    final value = _bookingList;
    if (value == null) return null;
    if (_bookingList is EqualUnmodifiableListView) return _bookingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BookingDto>? _waitingBookingList;
  @override
  List<BookingDto>? get waitingBookingList {
    final value = _waitingBookingList;
    if (value == null) return null;
    if (_waitingBookingList is EqualUnmodifiableListView)
      return _waitingBookingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BookingDto>? _canceledBookingList;
  @override
  List<BookingDto>? get canceledBookingList {
    final value = _canceledBookingList;
    if (value == null) return null;
    if (_canceledBookingList is EqualUnmodifiableListView)
      return _canceledBookingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BookingDto>? _confirmedBookingList;
  @override
  List<BookingDto>? get confirmedBookingList {
    final value = _confirmedBookingList;
    if (value == null) return null;
    if (_confirmedBookingList is EqualUnmodifiableListView)
      return _confirmedBookingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BookingDto>? _paidBookingList;
  @override
  List<BookingDto>? get paidBookingList {
    final value = _paidBookingList;
    if (value == null) return null;
    if (_paidBookingList is EqualUnmodifiableListView) return _paidBookingList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BookingPageState(status: $status, bookingList: $bookingList, waitingBookingList: $waitingBookingList, canceledBookingList: $canceledBookingList, confirmedBookingList: $confirmedBookingList, paidBookingList: $paidBookingList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingPageState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._bookingList, _bookingList) &&
            const DeepCollectionEquality()
                .equals(other._waitingBookingList, _waitingBookingList) &&
            const DeepCollectionEquality()
                .equals(other._canceledBookingList, _canceledBookingList) &&
            const DeepCollectionEquality()
                .equals(other._confirmedBookingList, _confirmedBookingList) &&
            const DeepCollectionEquality()
                .equals(other._paidBookingList, _paidBookingList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_bookingList),
      const DeepCollectionEquality().hash(_waitingBookingList),
      const DeepCollectionEquality().hash(_canceledBookingList),
      const DeepCollectionEquality().hash(_confirmedBookingList),
      const DeepCollectionEquality().hash(_paidBookingList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingPageStateCopyWith<_$_BookingPageState> get copyWith =>
      __$$_BookingPageStateCopyWithImpl<_$_BookingPageState>(this, _$identity);
}

abstract class _BookingPageState implements BookingPageState {
  const factory _BookingPageState(
      {final StateStatus? status,
      final List<BookingDto>? bookingList,
      final List<BookingDto>? waitingBookingList,
      final List<BookingDto>? canceledBookingList,
      final List<BookingDto>? confirmedBookingList,
      final List<BookingDto>? paidBookingList}) = _$_BookingPageState;

  @override
  StateStatus? get status;
  @override
  List<BookingDto>? get bookingList;
  @override
  List<BookingDto>? get waitingBookingList;
  @override
  List<BookingDto>? get canceledBookingList;
  @override
  List<BookingDto>? get confirmedBookingList;
  @override
  List<BookingDto>? get paidBookingList;
  @override
  @JsonKey(ignore: true)
  _$$_BookingPageStateCopyWith<_$_BookingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
