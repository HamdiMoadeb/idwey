// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_banner_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageBannerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Gallery> listImages) setListImages,
    required TResult Function(int index) setCurrentImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Gallery> listImages)? setListImages,
    TResult? Function(int index)? setCurrentImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Gallery> listImages)? setListImages,
    TResult Function(int index)? setCurrentImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetListImages value) setListImages,
    required TResult Function(SetCurrentImage value) setCurrentImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetListImages value)? setListImages,
    TResult? Function(SetCurrentImage value)? setCurrentImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetListImages value)? setListImages,
    TResult Function(SetCurrentImage value)? setCurrentImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageBannerEventCopyWith<$Res> {
  factory $ImageBannerEventCopyWith(
          ImageBannerEvent value, $Res Function(ImageBannerEvent) then) =
      _$ImageBannerEventCopyWithImpl<$Res, ImageBannerEvent>;
}

/// @nodoc
class _$ImageBannerEventCopyWithImpl<$Res, $Val extends ImageBannerEvent>
    implements $ImageBannerEventCopyWith<$Res> {
  _$ImageBannerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ImageBannerEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ImageBannerEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Gallery> listImages) setListImages,
    required TResult Function(int index) setCurrentImage,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Gallery> listImages)? setListImages,
    TResult? Function(int index)? setCurrentImage,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Gallery> listImages)? setListImages,
    TResult Function(int index)? setCurrentImage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetListImages value) setListImages,
    required TResult Function(SetCurrentImage value) setCurrentImage,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetListImages value)? setListImages,
    TResult? Function(SetCurrentImage value)? setCurrentImage,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetListImages value)? setListImages,
    TResult Function(SetCurrentImage value)? setCurrentImage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ImageBannerEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$SetListImagesCopyWith<$Res> {
  factory _$$SetListImagesCopyWith(
          _$SetListImages value, $Res Function(_$SetListImages) then) =
      __$$SetListImagesCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Gallery> listImages});
}

/// @nodoc
class __$$SetListImagesCopyWithImpl<$Res>
    extends _$ImageBannerEventCopyWithImpl<$Res, _$SetListImages>
    implements _$$SetListImagesCopyWith<$Res> {
  __$$SetListImagesCopyWithImpl(
      _$SetListImages _value, $Res Function(_$SetListImages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listImages = null,
  }) {
    return _then(_$SetListImages(
      null == listImages
          ? _value._listImages
          : listImages // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
    ));
  }
}

/// @nodoc

class _$SetListImages implements SetListImages {
  const _$SetListImages(final List<Gallery> listImages)
      : _listImages = listImages;

  final List<Gallery> _listImages;
  @override
  List<Gallery> get listImages {
    if (_listImages is EqualUnmodifiableListView) return _listImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listImages);
  }

  @override
  String toString() {
    return 'ImageBannerEvent.setListImages(listImages: $listImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetListImages &&
            const DeepCollectionEquality()
                .equals(other._listImages, _listImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_listImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetListImagesCopyWith<_$SetListImages> get copyWith =>
      __$$SetListImagesCopyWithImpl<_$SetListImages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Gallery> listImages) setListImages,
    required TResult Function(int index) setCurrentImage,
  }) {
    return setListImages(listImages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Gallery> listImages)? setListImages,
    TResult? Function(int index)? setCurrentImage,
  }) {
    return setListImages?.call(listImages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Gallery> listImages)? setListImages,
    TResult Function(int index)? setCurrentImage,
    required TResult orElse(),
  }) {
    if (setListImages != null) {
      return setListImages(listImages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetListImages value) setListImages,
    required TResult Function(SetCurrentImage value) setCurrentImage,
  }) {
    return setListImages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetListImages value)? setListImages,
    TResult? Function(SetCurrentImage value)? setCurrentImage,
  }) {
    return setListImages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetListImages value)? setListImages,
    TResult Function(SetCurrentImage value)? setCurrentImage,
    required TResult orElse(),
  }) {
    if (setListImages != null) {
      return setListImages(this);
    }
    return orElse();
  }
}

abstract class SetListImages implements ImageBannerEvent {
  const factory SetListImages(final List<Gallery> listImages) = _$SetListImages;

  List<Gallery> get listImages;
  @JsonKey(ignore: true)
  _$$SetListImagesCopyWith<_$SetListImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetCurrentImageCopyWith<$Res> {
  factory _$$SetCurrentImageCopyWith(
          _$SetCurrentImage value, $Res Function(_$SetCurrentImage) then) =
      __$$SetCurrentImageCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SetCurrentImageCopyWithImpl<$Res>
    extends _$ImageBannerEventCopyWithImpl<$Res, _$SetCurrentImage>
    implements _$$SetCurrentImageCopyWith<$Res> {
  __$$SetCurrentImageCopyWithImpl(
      _$SetCurrentImage _value, $Res Function(_$SetCurrentImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SetCurrentImage(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SetCurrentImage implements SetCurrentImage {
  const _$SetCurrentImage(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ImageBannerEvent.setCurrentImage(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetCurrentImage &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetCurrentImageCopyWith<_$SetCurrentImage> get copyWith =>
      __$$SetCurrentImageCopyWithImpl<_$SetCurrentImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(List<Gallery> listImages) setListImages,
    required TResult Function(int index) setCurrentImage,
  }) {
    return setCurrentImage(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(List<Gallery> listImages)? setListImages,
    TResult? Function(int index)? setCurrentImage,
  }) {
    return setCurrentImage?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(List<Gallery> listImages)? setListImages,
    TResult Function(int index)? setCurrentImage,
    required TResult orElse(),
  }) {
    if (setCurrentImage != null) {
      return setCurrentImage(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetListImages value) setListImages,
    required TResult Function(SetCurrentImage value) setCurrentImage,
  }) {
    return setCurrentImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetListImages value)? setListImages,
    TResult? Function(SetCurrentImage value)? setCurrentImage,
  }) {
    return setCurrentImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetListImages value)? setListImages,
    TResult Function(SetCurrentImage value)? setCurrentImage,
    required TResult orElse(),
  }) {
    if (setCurrentImage != null) {
      return setCurrentImage(this);
    }
    return orElse();
  }
}

abstract class SetCurrentImage implements ImageBannerEvent {
  const factory SetCurrentImage(final int index) = _$SetCurrentImage;

  int get index;
  @JsonKey(ignore: true)
  _$$SetCurrentImageCopyWith<_$SetCurrentImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ImageBannerState {
  StateStatus? get status => throw _privateConstructorUsedError;
  List<Gallery>? get listImages => throw _privateConstructorUsedError;
  int? get currentImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageBannerStateCopyWith<ImageBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageBannerStateCopyWith<$Res> {
  factory $ImageBannerStateCopyWith(
          ImageBannerState value, $Res Function(ImageBannerState) then) =
      _$ImageBannerStateCopyWithImpl<$Res, ImageBannerState>;
  @useResult
  $Res call(
      {StateStatus? status, List<Gallery>? listImages, int? currentImage});
}

/// @nodoc
class _$ImageBannerStateCopyWithImpl<$Res, $Val extends ImageBannerState>
    implements $ImageBannerStateCopyWith<$Res> {
  _$ImageBannerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? listImages = freezed,
    Object? currentImage = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      listImages: freezed == listImages
          ? _value.listImages
          : listImages // ignore: cast_nullable_to_non_nullable
              as List<Gallery>?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageBannerStateCopyWith<$Res>
    implements $ImageBannerStateCopyWith<$Res> {
  factory _$$_ImageBannerStateCopyWith(
          _$_ImageBannerState value, $Res Function(_$_ImageBannerState) then) =
      __$$_ImageBannerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {StateStatus? status, List<Gallery>? listImages, int? currentImage});
}

/// @nodoc
class __$$_ImageBannerStateCopyWithImpl<$Res>
    extends _$ImageBannerStateCopyWithImpl<$Res, _$_ImageBannerState>
    implements _$$_ImageBannerStateCopyWith<$Res> {
  __$$_ImageBannerStateCopyWithImpl(
      _$_ImageBannerState _value, $Res Function(_$_ImageBannerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? listImages = freezed,
    Object? currentImage = freezed,
  }) {
    return _then(_$_ImageBannerState(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus?,
      listImages: freezed == listImages
          ? _value._listImages
          : listImages // ignore: cast_nullable_to_non_nullable
              as List<Gallery>?,
      currentImage: freezed == currentImage
          ? _value.currentImage
          : currentImage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_ImageBannerState implements _ImageBannerState {
  const _$_ImageBannerState(
      {this.status, final List<Gallery>? listImages, this.currentImage})
      : _listImages = listImages;

  @override
  final StateStatus? status;
  final List<Gallery>? _listImages;
  @override
  List<Gallery>? get listImages {
    final value = _listImages;
    if (value == null) return null;
    if (_listImages is EqualUnmodifiableListView) return _listImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? currentImage;

  @override
  String toString() {
    return 'ImageBannerState(status: $status, listImages: $listImages, currentImage: $currentImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImageBannerState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._listImages, _listImages) &&
            (identical(other.currentImage, currentImage) ||
                other.currentImage == currentImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_listImages), currentImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageBannerStateCopyWith<_$_ImageBannerState> get copyWith =>
      __$$_ImageBannerStateCopyWithImpl<_$_ImageBannerState>(this, _$identity);
}

abstract class _ImageBannerState implements ImageBannerState {
  const factory _ImageBannerState(
      {final StateStatus? status,
      final List<Gallery>? listImages,
      final int? currentImage}) = _$_ImageBannerState;

  @override
  StateStatus? get status;
  @override
  List<Gallery>? get listImages;
  @override
  int? get currentImage;
  @override
  @JsonKey(ignore: true)
  _$$_ImageBannerStateCopyWith<_$_ImageBannerState> get copyWith =>
      throw _privateConstructorUsedError;
}
