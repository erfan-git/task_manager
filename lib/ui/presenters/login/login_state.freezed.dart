// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  AsyncRequestStatus? get requestStatus => throw _privateConstructorUsedError;
  bool? get isUsernameValid => throw _privateConstructorUsedError;
  bool? get isPasswordValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncRequestStatus? requestStatus,
      bool? isUsernameValid,
      bool? isPasswordValid});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? requestStatus = freezed,
    Object? isUsernameValid = freezed,
    Object? isPasswordValid = freezed,
  }) {
    return _then(_value.copyWith(
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as AsyncRequestStatus?,
      isUsernameValid: isUsernameValid == freezed
          ? _value.isUsernameValid
          : isUsernameValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncRequestStatus? requestStatus,
      bool? isUsernameValid,
      bool? isPasswordValid});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, (v) => _then(v as _$_LoginState));

  @override
  _$_LoginState get _value => super._value as _$_LoginState;

  @override
  $Res call({
    Object? requestStatus = freezed,
    Object? isUsernameValid = freezed,
    Object? isPasswordValid = freezed,
  }) {
    return _then(_$_LoginState(
      requestStatus: requestStatus == freezed
          ? _value.requestStatus
          : requestStatus // ignore: cast_nullable_to_non_nullable
              as AsyncRequestStatus?,
      isUsernameValid: isUsernameValid == freezed
          ? _value.isUsernameValid
          : isUsernameValid // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  _$_LoginState(
      {this.requestStatus = AsyncRequestStatus.initial,
      this.isUsernameValid = false,
      this.isPasswordValid = false});

  @override
  @JsonKey()
  final AsyncRequestStatus? requestStatus;
  @override
  @JsonKey()
  final bool? isUsernameValid;
  @override
  @JsonKey()
  final bool? isPasswordValid;

  @override
  String toString() {
    return 'LoginState(requestStatus: $requestStatus, isUsernameValid: $isUsernameValid, isPasswordValid: $isPasswordValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            const DeepCollectionEquality()
                .equals(other.requestStatus, requestStatus) &&
            const DeepCollectionEquality()
                .equals(other.isUsernameValid, isUsernameValid) &&
            const DeepCollectionEquality()
                .equals(other.isPasswordValid, isPasswordValid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(requestStatus),
      const DeepCollectionEquality().hash(isUsernameValid),
      const DeepCollectionEquality().hash(isPasswordValid));

  @JsonKey(ignore: true)
  @override
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {final AsyncRequestStatus? requestStatus,
      final bool? isUsernameValid,
      final bool? isPasswordValid}) = _$_LoginState;

  @override
  AsyncRequestStatus? get requestStatus => throw _privateConstructorUsedError;
  @override
  bool? get isUsernameValid => throw _privateConstructorUsedError;
  @override
  bool? get isPasswordValid => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
