// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cities_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CitiesResponseBody _$CitiesResponseBodyFromJson(Map<String, dynamic> json) {
  return _CitiesResponseBody.fromJson(json);
}

/// @nodoc
mixin _$CitiesResponseBody {
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CitiesResponseBodyCopyWith<CitiesResponseBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CitiesResponseBodyCopyWith<$Res> {
  factory $CitiesResponseBodyCopyWith(
          CitiesResponseBody value, $Res Function(CitiesResponseBody) then) =
      _$CitiesResponseBodyCopyWithImpl<$Res, CitiesResponseBody>;
  @useResult
  $Res call({Data data});
}

/// @nodoc
class _$CitiesResponseBodyCopyWithImpl<$Res, $Val extends CitiesResponseBody>
    implements $CitiesResponseBodyCopyWith<$Res> {
  _$CitiesResponseBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CitiesResponseBodyImplCopyWith<$Res>
    implements $CitiesResponseBodyCopyWith<$Res> {
  factory _$$CitiesResponseBodyImplCopyWith(_$CitiesResponseBodyImpl value,
          $Res Function(_$CitiesResponseBodyImpl) then) =
      __$$CitiesResponseBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Data data});
}

/// @nodoc
class __$$CitiesResponseBodyImplCopyWithImpl<$Res>
    extends _$CitiesResponseBodyCopyWithImpl<$Res, _$CitiesResponseBodyImpl>
    implements _$$CitiesResponseBodyImplCopyWith<$Res> {
  __$$CitiesResponseBodyImplCopyWithImpl(_$CitiesResponseBodyImpl _value,
      $Res Function(_$CitiesResponseBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CitiesResponseBodyImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CitiesResponseBodyImpl implements _CitiesResponseBody {
  _$CitiesResponseBodyImpl({required this.data});

  factory _$CitiesResponseBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CitiesResponseBodyImplFromJson(json);

  @override
  final Data data;

  @override
  String toString() {
    return 'CitiesResponseBody(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CitiesResponseBodyImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CitiesResponseBodyImplCopyWith<_$CitiesResponseBodyImpl> get copyWith =>
      __$$CitiesResponseBodyImplCopyWithImpl<_$CitiesResponseBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CitiesResponseBodyImplToJson(
      this,
    );
  }
}

abstract class _CitiesResponseBody implements CitiesResponseBody {
  factory _CitiesResponseBody({required final Data data}) =
      _$CitiesResponseBodyImpl;

  factory _CitiesResponseBody.fromJson(Map<String, dynamic> json) =
      _$CitiesResponseBodyImpl.fromJson;

  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$CitiesResponseBodyImplCopyWith<_$CitiesResponseBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
