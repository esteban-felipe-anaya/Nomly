// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderItem {

 String get dishId; String get restaurantId; String get name; String get image; double get unitPrice; int get quantity; List<CustomizationOption> get selectedOptions; double get lineTotal; String get instructions;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.dishId, dishId) || other.dishId == dishId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other.selectedOptions, selectedOptions)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dishId,restaurantId,name,image,unitPrice,quantity,const DeepCollectionEquality().hash(selectedOptions),lineTotal,instructions);

@override
String toString() {
  return 'OrderItem(dishId: $dishId, restaurantId: $restaurantId, name: $name, image: $image, unitPrice: $unitPrice, quantity: $quantity, selectedOptions: $selectedOptions, lineTotal: $lineTotal, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String dishId, String restaurantId, String name, String image, double unitPrice, int quantity, List<CustomizationOption> selectedOptions, double lineTotal, String instructions
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dishId = null,Object? restaurantId = null,Object? name = null,Object? image = null,Object? unitPrice = null,Object? quantity = null,Object? selectedOptions = null,Object? lineTotal = null,Object? instructions = null,}) {
  return _then(_self.copyWith(
dishId: null == dishId ? _self.dishId : dishId // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedOptions: null == selectedOptions ? _self.selectedOptions : selectedOptions // ignore: cast_nullable_to_non_nullable
as List<CustomizationOption>,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dishId,  String restaurantId,  String name,  String image,  double unitPrice,  int quantity,  List<CustomizationOption> selectedOptions,  double lineTotal,  String instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.dishId,_that.restaurantId,_that.name,_that.image,_that.unitPrice,_that.quantity,_that.selectedOptions,_that.lineTotal,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dishId,  String restaurantId,  String name,  String image,  double unitPrice,  int quantity,  List<CustomizationOption> selectedOptions,  double lineTotal,  String instructions)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.dishId,_that.restaurantId,_that.name,_that.image,_that.unitPrice,_that.quantity,_that.selectedOptions,_that.lineTotal,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dishId,  String restaurantId,  String name,  String image,  double unitPrice,  int quantity,  List<CustomizationOption> selectedOptions,  double lineTotal,  String instructions)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.dishId,_that.restaurantId,_that.name,_that.image,_that.unitPrice,_that.quantity,_that.selectedOptions,_that.lineTotal,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.dishId, required this.restaurantId, required this.name, this.image = '', required this.unitPrice, this.quantity = 1, final  List<CustomizationOption> selectedOptions = const <CustomizationOption>[], required this.lineTotal, this.instructions = ''}): _selectedOptions = selectedOptions;
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  String dishId;
@override final  String restaurantId;
@override final  String name;
@override@JsonKey() final  String image;
@override final  double unitPrice;
@override@JsonKey() final  int quantity;
 final  List<CustomizationOption> _selectedOptions;
@override@JsonKey() List<CustomizationOption> get selectedOptions {
  if (_selectedOptions is EqualUnmodifiableListView) return _selectedOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedOptions);
}

@override final  double lineTotal;
@override@JsonKey() final  String instructions;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.dishId, dishId) || other.dishId == dishId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&const DeepCollectionEquality().equals(other._selectedOptions, _selectedOptions)&&(identical(other.lineTotal, lineTotal) || other.lineTotal == lineTotal)&&(identical(other.instructions, instructions) || other.instructions == instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dishId,restaurantId,name,image,unitPrice,quantity,const DeepCollectionEquality().hash(_selectedOptions),lineTotal,instructions);

@override
String toString() {
  return 'OrderItem(dishId: $dishId, restaurantId: $restaurantId, name: $name, image: $image, unitPrice: $unitPrice, quantity: $quantity, selectedOptions: $selectedOptions, lineTotal: $lineTotal, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String dishId, String restaurantId, String name, String image, double unitPrice, int quantity, List<CustomizationOption> selectedOptions, double lineTotal, String instructions
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dishId = null,Object? restaurantId = null,Object? name = null,Object? image = null,Object? unitPrice = null,Object? quantity = null,Object? selectedOptions = null,Object? lineTotal = null,Object? instructions = null,}) {
  return _then(_OrderItem(
dishId: null == dishId ? _self.dishId : dishId // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,selectedOptions: null == selectedOptions ? _self._selectedOptions : selectedOptions // ignore: cast_nullable_to_non_nullable
as List<CustomizationOption>,lineTotal: null == lineTotal ? _self.lineTotal : lineTotal // ignore: cast_nullable_to_non_nullable
as double,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderTotals {

 double get subtotal; double get discount; double get deliveryFee; double get serviceFee; double get tax; double get tip; double get total;
/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTotalsCopyWith<OrderTotals> get copyWith => _$OrderTotalsCopyWithImpl<OrderTotals>(this as OrderTotals, _$identity);

  /// Serializes this OrderTotals to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.tip, tip) || other.tip == tip)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,deliveryFee,serviceFee,tax,tip,total);

@override
String toString() {
  return 'OrderTotals(subtotal: $subtotal, discount: $discount, deliveryFee: $deliveryFee, serviceFee: $serviceFee, tax: $tax, tip: $tip, total: $total)';
}


}

/// @nodoc
abstract mixin class $OrderTotalsCopyWith<$Res>  {
  factory $OrderTotalsCopyWith(OrderTotals value, $Res Function(OrderTotals) _then) = _$OrderTotalsCopyWithImpl;
@useResult
$Res call({
 double subtotal, double discount, double deliveryFee, double serviceFee, double tax, double tip, double total
});




}
/// @nodoc
class _$OrderTotalsCopyWithImpl<$Res>
    implements $OrderTotalsCopyWith<$Res> {
  _$OrderTotalsCopyWithImpl(this._self, this._then);

  final OrderTotals _self;
  final $Res Function(OrderTotals) _then;

/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subtotal = null,Object? discount = null,Object? deliveryFee = null,Object? serviceFee = null,Object? tax = null,Object? tip = null,Object? total = null,}) {
  return _then(_self.copyWith(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,serviceFee: null == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,tip: null == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderTotals].
extension OrderTotalsPatterns on OrderTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderTotals value)  $default,){
final _that = this;
switch (_that) {
case _OrderTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderTotals value)?  $default,){
final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double deliveryFee,  double serviceFee,  double tax,  double tip,  double total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.deliveryFee,_that.serviceFee,_that.tax,_that.tip,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double subtotal,  double discount,  double deliveryFee,  double serviceFee,  double tax,  double tip,  double total)  $default,) {final _that = this;
switch (_that) {
case _OrderTotals():
return $default(_that.subtotal,_that.discount,_that.deliveryFee,_that.serviceFee,_that.tax,_that.tip,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double subtotal,  double discount,  double deliveryFee,  double serviceFee,  double tax,  double tip,  double total)?  $default,) {final _that = this;
switch (_that) {
case _OrderTotals() when $default != null:
return $default(_that.subtotal,_that.discount,_that.deliveryFee,_that.serviceFee,_that.tax,_that.tip,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderTotals implements OrderTotals {
  const _OrderTotals({this.subtotal = 0, this.discount = 0, this.deliveryFee = 0, this.serviceFee = 0, this.tax = 0, this.tip = 0, this.total = 0});
  factory _OrderTotals.fromJson(Map<String, dynamic> json) => _$OrderTotalsFromJson(json);

@override@JsonKey() final  double subtotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double deliveryFee;
@override@JsonKey() final  double serviceFee;
@override@JsonKey() final  double tax;
@override@JsonKey() final  double tip;
@override@JsonKey() final  double total;

/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderTotalsCopyWith<_OrderTotals> get copyWith => __$OrderTotalsCopyWithImpl<_OrderTotals>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderTotalsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderTotals&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.serviceFee, serviceFee) || other.serviceFee == serviceFee)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.tip, tip) || other.tip == tip)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subtotal,discount,deliveryFee,serviceFee,tax,tip,total);

@override
String toString() {
  return 'OrderTotals(subtotal: $subtotal, discount: $discount, deliveryFee: $deliveryFee, serviceFee: $serviceFee, tax: $tax, tip: $tip, total: $total)';
}


}

/// @nodoc
abstract mixin class _$OrderTotalsCopyWith<$Res> implements $OrderTotalsCopyWith<$Res> {
  factory _$OrderTotalsCopyWith(_OrderTotals value, $Res Function(_OrderTotals) _then) = __$OrderTotalsCopyWithImpl;
@override @useResult
$Res call({
 double subtotal, double discount, double deliveryFee, double serviceFee, double tax, double tip, double total
});




}
/// @nodoc
class __$OrderTotalsCopyWithImpl<$Res>
    implements _$OrderTotalsCopyWith<$Res> {
  __$OrderTotalsCopyWithImpl(this._self, this._then);

  final _OrderTotals _self;
  final $Res Function(_OrderTotals) _then;

/// Create a copy of OrderTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subtotal = null,Object? discount = null,Object? deliveryFee = null,Object? serviceFee = null,Object? tax = null,Object? tip = null,Object? total = null,}) {
  return _then(_OrderTotals(
subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,serviceFee: null == serviceFee ? _self.serviceFee : serviceFee // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,tip: null == tip ? _self.tip : tip // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$Courier {

 String get name; String get avatar; String get phone; double get lat; double get lng;
/// Create a copy of Courier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourierCopyWith<Courier> get copyWith => _$CourierCopyWithImpl<Courier>(this as Courier, _$identity);

  /// Serializes this Courier to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Courier&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,avatar,phone,lat,lng);

@override
String toString() {
  return 'Courier(name: $name, avatar: $avatar, phone: $phone, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $CourierCopyWith<$Res>  {
  factory $CourierCopyWith(Courier value, $Res Function(Courier) _then) = _$CourierCopyWithImpl;
@useResult
$Res call({
 String name, String avatar, String phone, double lat, double lng
});




}
/// @nodoc
class _$CourierCopyWithImpl<$Res>
    implements $CourierCopyWith<$Res> {
  _$CourierCopyWithImpl(this._self, this._then);

  final Courier _self;
  final $Res Function(Courier) _then;

/// Create a copy of Courier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? avatar = null,Object? phone = null,Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Courier].
extension CourierPatterns on Courier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Courier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Courier() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Courier value)  $default,){
final _that = this;
switch (_that) {
case _Courier():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Courier value)?  $default,){
final _that = this;
switch (_that) {
case _Courier() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String avatar,  String phone,  double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Courier() when $default != null:
return $default(_that.name,_that.avatar,_that.phone,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String avatar,  String phone,  double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _Courier():
return $default(_that.name,_that.avatar,_that.phone,_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String avatar,  String phone,  double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _Courier() when $default != null:
return $default(_that.name,_that.avatar,_that.phone,_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Courier implements Courier {
  const _Courier({required this.name, this.avatar = '', this.phone = '', this.lat = 0, this.lng = 0});
  factory _Courier.fromJson(Map<String, dynamic> json) => _$CourierFromJson(json);

@override final  String name;
@override@JsonKey() final  String avatar;
@override@JsonKey() final  String phone;
@override@JsonKey() final  double lat;
@override@JsonKey() final  double lng;

/// Create a copy of Courier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourierCopyWith<_Courier> get copyWith => __$CourierCopyWithImpl<_Courier>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourierToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Courier&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,avatar,phone,lat,lng);

@override
String toString() {
  return 'Courier(name: $name, avatar: $avatar, phone: $phone, lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$CourierCopyWith<$Res> implements $CourierCopyWith<$Res> {
  factory _$CourierCopyWith(_Courier value, $Res Function(_Courier) _then) = __$CourierCopyWithImpl;
@override @useResult
$Res call({
 String name, String avatar, String phone, double lat, double lng
});




}
/// @nodoc
class __$CourierCopyWithImpl<$Res>
    implements _$CourierCopyWith<$Res> {
  __$CourierCopyWithImpl(this._self, this._then);

  final _Courier _self;
  final $Res Function(_Courier) _then;

/// Create a copy of Courier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? avatar = null,Object? phone = null,Object? lat = null,Object? lng = null,}) {
  return _then(_Courier(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: null == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$Order {

 String get id; String get userId; String get restaurantId; String get restaurantName; String get restaurantCover; String get addressId; List<OrderItem> get items; OrderTotals get totals; String? get promoCode; String get paymentMethod; String? get scheduledFor; String get status; String get placedAt; int get etaMinutes; Courier? get courier; List<List<double>> get route;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);

  /// Serializes this Order to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantCover, restaurantCover) || other.restaurantCover == restaurantCover)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.scheduledFor, scheduledFor) || other.scheduledFor == scheduledFor)&&(identical(other.status, status) || other.status == status)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.courier, courier) || other.courier == courier)&&const DeepCollectionEquality().equals(other.route, route));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,restaurantId,restaurantName,restaurantCover,addressId,const DeepCollectionEquality().hash(items),totals,promoCode,paymentMethod,scheduledFor,status,placedAt,etaMinutes,courier,const DeepCollectionEquality().hash(route));

@override
String toString() {
  return 'Order(id: $id, userId: $userId, restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantCover: $restaurantCover, addressId: $addressId, items: $items, totals: $totals, promoCode: $promoCode, paymentMethod: $paymentMethod, scheduledFor: $scheduledFor, status: $status, placedAt: $placedAt, etaMinutes: $etaMinutes, courier: $courier, route: $route)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String restaurantId, String restaurantName, String restaurantCover, String addressId, List<OrderItem> items, OrderTotals totals, String? promoCode, String paymentMethod, String? scheduledFor, String status, String placedAt, int etaMinutes, Courier? courier, List<List<double>> route
});


$OrderTotalsCopyWith<$Res> get totals;$CourierCopyWith<$Res>? get courier;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? restaurantId = null,Object? restaurantName = null,Object? restaurantCover = null,Object? addressId = null,Object? items = null,Object? totals = null,Object? promoCode = freezed,Object? paymentMethod = null,Object? scheduledFor = freezed,Object? status = null,Object? placedAt = null,Object? etaMinutes = null,Object? courier = freezed,Object? route = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantCover: null == restaurantCover ? _self.restaurantCover : restaurantCover // ignore: cast_nullable_to_non_nullable
as String,addressId: null == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as OrderTotals,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,scheduledFor: freezed == scheduledFor ? _self.scheduledFor : scheduledFor // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as String,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as Courier?,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTotalsCopyWith<$Res> get totals {
  
  return $OrderTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourierCopyWith<$Res>? get courier {
    if (_self.courier == null) {
    return null;
  }

  return $CourierCopyWith<$Res>(_self.courier!, (value) {
    return _then(_self.copyWith(courier: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String restaurantId,  String restaurantName,  String restaurantCover,  String addressId,  List<OrderItem> items,  OrderTotals totals,  String? promoCode,  String paymentMethod,  String? scheduledFor,  String status,  String placedAt,  int etaMinutes,  Courier? courier,  List<List<double>> route)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.userId,_that.restaurantId,_that.restaurantName,_that.restaurantCover,_that.addressId,_that.items,_that.totals,_that.promoCode,_that.paymentMethod,_that.scheduledFor,_that.status,_that.placedAt,_that.etaMinutes,_that.courier,_that.route);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String restaurantId,  String restaurantName,  String restaurantCover,  String addressId,  List<OrderItem> items,  OrderTotals totals,  String? promoCode,  String paymentMethod,  String? scheduledFor,  String status,  String placedAt,  int etaMinutes,  Courier? courier,  List<List<double>> route)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.userId,_that.restaurantId,_that.restaurantName,_that.restaurantCover,_that.addressId,_that.items,_that.totals,_that.promoCode,_that.paymentMethod,_that.scheduledFor,_that.status,_that.placedAt,_that.etaMinutes,_that.courier,_that.route);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String restaurantId,  String restaurantName,  String restaurantCover,  String addressId,  List<OrderItem> items,  OrderTotals totals,  String? promoCode,  String paymentMethod,  String? scheduledFor,  String status,  String placedAt,  int etaMinutes,  Courier? courier,  List<List<double>> route)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.userId,_that.restaurantId,_that.restaurantName,_that.restaurantCover,_that.addressId,_that.items,_that.totals,_that.promoCode,_that.paymentMethod,_that.scheduledFor,_that.status,_that.placedAt,_that.etaMinutes,_that.courier,_that.route);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Order extends Order {
  const _Order({required this.id, this.userId = 'usr_01', required this.restaurantId, this.restaurantName = '', this.restaurantCover = '', required this.addressId, final  List<OrderItem> items = const <OrderItem>[], required this.totals, this.promoCode, this.paymentMethod = 'Card', this.scheduledFor, this.status = 'confirmed', required this.placedAt, this.etaMinutes = 0, this.courier, final  List<List<double>> route = const <List<double>>[]}): _items = items,_route = route,super._();
  factory _Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

@override final  String id;
@override@JsonKey() final  String userId;
@override final  String restaurantId;
@override@JsonKey() final  String restaurantName;
@override@JsonKey() final  String restaurantCover;
@override final  String addressId;
 final  List<OrderItem> _items;
@override@JsonKey() List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  OrderTotals totals;
@override final  String? promoCode;
@override@JsonKey() final  String paymentMethod;
@override final  String? scheduledFor;
@override@JsonKey() final  String status;
@override final  String placedAt;
@override@JsonKey() final  int etaMinutes;
@override final  Courier? courier;
 final  List<List<double>> _route;
@override@JsonKey() List<List<double>> get route {
  if (_route is EqualUnmodifiableListView) return _route;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_route);
}


/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.restaurantName, restaurantName) || other.restaurantName == restaurantName)&&(identical(other.restaurantCover, restaurantCover) || other.restaurantCover == restaurantCover)&&(identical(other.addressId, addressId) || other.addressId == addressId)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totals, totals) || other.totals == totals)&&(identical(other.promoCode, promoCode) || other.promoCode == promoCode)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.scheduledFor, scheduledFor) || other.scheduledFor == scheduledFor)&&(identical(other.status, status) || other.status == status)&&(identical(other.placedAt, placedAt) || other.placedAt == placedAt)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.courier, courier) || other.courier == courier)&&const DeepCollectionEquality().equals(other._route, _route));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,restaurantId,restaurantName,restaurantCover,addressId,const DeepCollectionEquality().hash(_items),totals,promoCode,paymentMethod,scheduledFor,status,placedAt,etaMinutes,courier,const DeepCollectionEquality().hash(_route));

@override
String toString() {
  return 'Order(id: $id, userId: $userId, restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantCover: $restaurantCover, addressId: $addressId, items: $items, totals: $totals, promoCode: $promoCode, paymentMethod: $paymentMethod, scheduledFor: $scheduledFor, status: $status, placedAt: $placedAt, etaMinutes: $etaMinutes, courier: $courier, route: $route)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String restaurantId, String restaurantName, String restaurantCover, String addressId, List<OrderItem> items, OrderTotals totals, String? promoCode, String paymentMethod, String? scheduledFor, String status, String placedAt, int etaMinutes, Courier? courier, List<List<double>> route
});


@override $OrderTotalsCopyWith<$Res> get totals;@override $CourierCopyWith<$Res>? get courier;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? restaurantId = null,Object? restaurantName = null,Object? restaurantCover = null,Object? addressId = null,Object? items = null,Object? totals = null,Object? promoCode = freezed,Object? paymentMethod = null,Object? scheduledFor = freezed,Object? status = null,Object? placedAt = null,Object? etaMinutes = null,Object? courier = freezed,Object? route = null,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,restaurantName: null == restaurantName ? _self.restaurantName : restaurantName // ignore: cast_nullable_to_non_nullable
as String,restaurantCover: null == restaurantCover ? _self.restaurantCover : restaurantCover // ignore: cast_nullable_to_non_nullable
as String,addressId: null == addressId ? _self.addressId : addressId // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,totals: null == totals ? _self.totals : totals // ignore: cast_nullable_to_non_nullable
as OrderTotals,promoCode: freezed == promoCode ? _self.promoCode : promoCode // ignore: cast_nullable_to_non_nullable
as String?,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,scheduledFor: freezed == scheduledFor ? _self.scheduledFor : scheduledFor // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,placedAt: null == placedAt ? _self.placedAt : placedAt // ignore: cast_nullable_to_non_nullable
as String,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as Courier?,route: null == route ? _self._route : route // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderTotalsCopyWith<$Res> get totals {
  
  return $OrderTotalsCopyWith<$Res>(_self.totals, (value) {
    return _then(_self.copyWith(totals: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourierCopyWith<$Res>? get courier {
    if (_self.courier == null) {
    return null;
  }

  return $CourierCopyWith<$Res>(_self.courier!, (value) {
    return _then(_self.copyWith(courier: value));
  });
}
}

// dart format on
