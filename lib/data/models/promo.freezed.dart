// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromoResult {

 String get code; bool get valid; double get discountPct; bool get freeDelivery; String? get description; String? get reason;
/// Create a copy of PromoResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromoResultCopyWith<PromoResult> get copyWith => _$PromoResultCopyWithImpl<PromoResult>(this as PromoResult, _$identity);

  /// Serializes this PromoResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromoResult&&(identical(other.code, code) || other.code == code)&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.discountPct, discountPct) || other.discountPct == discountPct)&&(identical(other.freeDelivery, freeDelivery) || other.freeDelivery == freeDelivery)&&(identical(other.description, description) || other.description == description)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,valid,discountPct,freeDelivery,description,reason);

@override
String toString() {
  return 'PromoResult(code: $code, valid: $valid, discountPct: $discountPct, freeDelivery: $freeDelivery, description: $description, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $PromoResultCopyWith<$Res>  {
  factory $PromoResultCopyWith(PromoResult value, $Res Function(PromoResult) _then) = _$PromoResultCopyWithImpl;
@useResult
$Res call({
 String code, bool valid, double discountPct, bool freeDelivery, String? description, String? reason
});




}
/// @nodoc
class _$PromoResultCopyWithImpl<$Res>
    implements $PromoResultCopyWith<$Res> {
  _$PromoResultCopyWithImpl(this._self, this._then);

  final PromoResult _self;
  final $Res Function(PromoResult) _then;

/// Create a copy of PromoResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? valid = null,Object? discountPct = null,Object? freeDelivery = null,Object? description = freezed,Object? reason = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,discountPct: null == discountPct ? _self.discountPct : discountPct // ignore: cast_nullable_to_non_nullable
as double,freeDelivery: null == freeDelivery ? _self.freeDelivery : freeDelivery // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PromoResult].
extension PromoResultPatterns on PromoResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromoResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromoResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromoResult value)  $default,){
final _that = this;
switch (_that) {
case _PromoResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromoResult value)?  $default,){
final _that = this;
switch (_that) {
case _PromoResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  bool valid,  double discountPct,  bool freeDelivery,  String? description,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromoResult() when $default != null:
return $default(_that.code,_that.valid,_that.discountPct,_that.freeDelivery,_that.description,_that.reason);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  bool valid,  double discountPct,  bool freeDelivery,  String? description,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _PromoResult():
return $default(_that.code,_that.valid,_that.discountPct,_that.freeDelivery,_that.description,_that.reason);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  bool valid,  double discountPct,  bool freeDelivery,  String? description,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _PromoResult() when $default != null:
return $default(_that.code,_that.valid,_that.discountPct,_that.freeDelivery,_that.description,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromoResult implements PromoResult {
  const _PromoResult({required this.code, required this.valid, this.discountPct = 0, this.freeDelivery = false, this.description, this.reason});
  factory _PromoResult.fromJson(Map<String, dynamic> json) => _$PromoResultFromJson(json);

@override final  String code;
@override final  bool valid;
@override@JsonKey() final  double discountPct;
@override@JsonKey() final  bool freeDelivery;
@override final  String? description;
@override final  String? reason;

/// Create a copy of PromoResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromoResultCopyWith<_PromoResult> get copyWith => __$PromoResultCopyWithImpl<_PromoResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromoResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromoResult&&(identical(other.code, code) || other.code == code)&&(identical(other.valid, valid) || other.valid == valid)&&(identical(other.discountPct, discountPct) || other.discountPct == discountPct)&&(identical(other.freeDelivery, freeDelivery) || other.freeDelivery == freeDelivery)&&(identical(other.description, description) || other.description == description)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,valid,discountPct,freeDelivery,description,reason);

@override
String toString() {
  return 'PromoResult(code: $code, valid: $valid, discountPct: $discountPct, freeDelivery: $freeDelivery, description: $description, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$PromoResultCopyWith<$Res> implements $PromoResultCopyWith<$Res> {
  factory _$PromoResultCopyWith(_PromoResult value, $Res Function(_PromoResult) _then) = __$PromoResultCopyWithImpl;
@override @useResult
$Res call({
 String code, bool valid, double discountPct, bool freeDelivery, String? description, String? reason
});




}
/// @nodoc
class __$PromoResultCopyWithImpl<$Res>
    implements _$PromoResultCopyWith<$Res> {
  __$PromoResultCopyWithImpl(this._self, this._then);

  final _PromoResult _self;
  final $Res Function(_PromoResult) _then;

/// Create a copy of PromoResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? valid = null,Object? discountPct = null,Object? freeDelivery = null,Object? description = freezed,Object? reason = freezed,}) {
  return _then(_PromoResult(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,valid: null == valid ? _self.valid : valid // ignore: cast_nullable_to_non_nullable
as bool,discountPct: null == discountPct ? _self.discountPct : discountPct // ignore: cast_nullable_to_non_nullable
as double,freeDelivery: null == freeDelivery ? _self.freeDelivery : freeDelivery // ignore: cast_nullable_to_non_nullable
as bool,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
