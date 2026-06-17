// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartState {

 List<CartItem> get items; String? get restaurantId; String get restaurantName; double get baseDeliveryFee; String get currency; PromoResult? get promo; double get tip;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);

  /// Serializes this CartState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.baseDeliveryFee, baseDeliveryFee) || other.baseDeliveryFee == baseDeliveryFee)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.promo, promo) || other.promo == promo)&&(identical(other.tip, tip) || other.tip == tip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),restaurantId,restaurantName,baseDeliveryFee,currency,promo,tip);

@override
String toString() {
  return 'CartState(items: $items, restaurantId: $restaurantId, restaurantName: $restaurantName, baseDeliveryFee: $baseDeliveryFee, currency: $currency, promo: $promo, tip: $tip)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 List<CartItem> items, String? restaurantId, String restaurantName, double baseDeliveryFee, String currency, PromoResult? promo, double tip
});


$PromoResultCopyWith<$Res>? get promo;

}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? restaurantId = freezed,Object? restaurantName = null,Object? baseDeliveryFee = null,Object? currency = null,Object? promo = freezed,Object? tip = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,baseDeliveryFee: null == baseDeliveryFee ? _self.baseDeliveryFee : baseDeliveryFee // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,promo: freezed == promo ? _self.promo : promo // ignore: cast_nullable_to_non_nullable
as PromoResult?,tip: null == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromoResultCopyWith<$Res>? get promo {
    if (_self.promo == null) {
    return null;
  }

  return $PromoResultCopyWith<$Res>(_self.promo!, (value) {
    return _then(_self.copyWith(promo: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartItem> items,  String? restaurantId,  String restaurantName,  double baseDeliveryFee,  String currency,  PromoResult? promo,  double tip)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.items,_that.restaurantId,_that.restaurantName,_that.baseDeliveryFee,_that.currency,_that.promo,_that.tip);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartItem> items,  String? restaurantId,  String restaurantName,  double baseDeliveryFee,  String currency,  PromoResult? promo,  double tip)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.items,_that.restaurantId,_that.restaurantName,_that.baseDeliveryFee,_that.currency,_that.promo,_that.tip);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartItem> items,  String? restaurantId,  String restaurantName,  double baseDeliveryFee,  String currency,  PromoResult? promo,  double tip)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.items,_that.restaurantId,_that.restaurantName,_that.baseDeliveryFee,_that.currency,_that.promo,_that.tip);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartState extends CartState {
  const _CartState({final  List<CartItem> items = const <CartItem>[], this.restaurantId, this.restaurantName = '', this.baseDeliveryFee = 0, this.currency = 'USD', this.promo, this.tip = 0}): _items = items,super._();
  factory _CartState.fromJson(Map<String, dynamic> json) => _$CartStateFromJson(json);

 final  List<CartItem> _items;
@override@JsonKey() List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? restaurantId;
@override@JsonKey() final  String restaurantName;
@override@JsonKey() final  double baseDeliveryFee;
@override@JsonKey() final  String currency;
@override final  PromoResult? promo;
@override@JsonKey() final  double tip;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.baseDeliveryFee, baseDeliveryFee) || other.baseDeliveryFee == baseDeliveryFee)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.promo, promo) || other.promo == promo)&&(identical(other.tip, tip) || other.tip == tip));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),restaurantId,restaurantName,baseDeliveryFee,currency,promo,tip);

@override
String toString() {
  return 'CartState(items: $items, restaurantId: $restaurantId, restaurantName: $restaurantName, baseDeliveryFee: $baseDeliveryFee, currency: $currency, promo: $promo, tip: $tip)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 List<CartItem> items, String? restaurantId, String restaurantName, double baseDeliveryFee, String currency, PromoResult? promo, double tip
});


@override $PromoResultCopyWith<$Res>? get promo;

}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? restaurantId = freezed,Object? restaurantName = null,Object? baseDeliveryFee = null,Object? currency = null,Object? promo = freezed,Object? tip = null,}) {
  return _then(_CartState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,restaurantId: freezed == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String?,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,baseDeliveryFee: null == baseDeliveryFee ? _self.baseDeliveryFee : baseDeliveryFee // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,promo: freezed == promo ? _self.promo : promo // ignore: cast_nullable_to_non_nullable
as PromoResult?,tip: null == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromoResultCopyWith<$Res>? get promo {
    if (_self.promo == null) {
    return null;
  }

  return $PromoResultCopyWith<$Res>(_self.promo!, (value) {
    return _then(_self.copyWith(promo: value));
  });
}
}

// dart format on
