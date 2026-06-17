// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuCategory {

 String get category; List<Dish> get items;
/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuCategoryCopyWith<MenuCategory> get copyWith => _$MenuCategoryCopyWithImpl<MenuCategory>(this as MenuCategory, _$identity);

  /// Serializes this MenuCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuCategory&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MenuCategory(category: $category, items: $items)';
}


}

/// @nodoc
abstract mixin class $MenuCategoryCopyWith<$Res>  {
  factory $MenuCategoryCopyWith(MenuCategory value, $Res Function(MenuCategory) _then) = _$MenuCategoryCopyWithImpl;
@useResult
$Res call({
 String category, List<Dish> items
});




}
/// @nodoc
class _$MenuCategoryCopyWithImpl<$Res>
    implements $MenuCategoryCopyWith<$Res> {
  _$MenuCategoryCopyWithImpl(this._self, this._then);

  final MenuCategory _self;
  final $Res Function(MenuCategory) _then;

/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? items = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Dish>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuCategory].
extension MenuCategoryPatterns on MenuCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuCategory value)  $default,){
final _that = this;
switch (_that) {
case _MenuCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuCategory value)?  $default,){
final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  List<Dish> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that.category,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  List<Dish> items)  $default,) {final _that = this;
switch (_that) {
case _MenuCategory():
return $default(_that.category,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  List<Dish> items)?  $default,) {final _that = this;
switch (_that) {
case _MenuCategory() when $default != null:
return $default(_that.category,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuCategory implements MenuCategory {
  const _MenuCategory({required this.category, final  List<Dish> items = const <Dish>[]}): _items = items;
  factory _MenuCategory.fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);

@override final  String category;
 final  List<Dish> _items;
@override@JsonKey() List<Dish> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuCategoryCopyWith<_MenuCategory> get copyWith => __$MenuCategoryCopyWithImpl<_MenuCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuCategory&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MenuCategory(category: $category, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MenuCategoryCopyWith<$Res> implements $MenuCategoryCopyWith<$Res> {
  factory _$MenuCategoryCopyWith(_MenuCategory value, $Res Function(_MenuCategory) _then) = __$MenuCategoryCopyWithImpl;
@override @useResult
$Res call({
 String category, List<Dish> items
});




}
/// @nodoc
class __$MenuCategoryCopyWithImpl<$Res>
    implements _$MenuCategoryCopyWith<$Res> {
  __$MenuCategoryCopyWithImpl(this._self, this._then);

  final _MenuCategory _self;
  final $Res Function(_MenuCategory) _then;

/// Create a copy of MenuCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? items = null,}) {
  return _then(_MenuCategory(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Dish>,
  ));
}


}


/// @nodoc
mixin _$Restaurant {

 String get id; String get name; String get cuisineId; String get cuisine; String get description; String get cover; String get logo; double get rating; int get ratingCount; int get deliveryMinutes; double get deliveryFee; int get priceLevel; bool get freeDelivery; List<String> get offers; double get distanceKm; double? get lat; double? get lng; String get address; List<MenuCategory> get menu;
/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RestaurantCopyWith<Restaurant> get copyWith => _$RestaurantCopyWithImpl<Restaurant>(this as Restaurant, _$identity);

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cuisineId, cuisineId) || other.cuisineId == cuisineId)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.deliveryMinutes, deliveryMinutes) || other.deliveryMinutes == deliveryMinutes)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.priceLevel, priceLevel) || other.priceLevel == priceLevel)&&(identical(other.freeDelivery, freeDelivery) || other.freeDelivery == freeDelivery)&&const DeepCollectionEquality().equals(other.offers, offers)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.menu, menu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,cuisineId,cuisine,description,cover,logo,rating,ratingCount,deliveryMinutes,deliveryFee,priceLevel,freeDelivery,const DeepCollectionEquality().hash(offers),distanceKm,lat,lng,address,const DeepCollectionEquality().hash(menu)]);

@override
String toString() {
  return 'Restaurant(id: $id, name: $name, cuisineId: $cuisineId, cuisine: $cuisine, description: $description, cover: $cover, logo: $logo, rating: $rating, ratingCount: $ratingCount, deliveryMinutes: $deliveryMinutes, deliveryFee: $deliveryFee, priceLevel: $priceLevel, freeDelivery: $freeDelivery, offers: $offers, distanceKm: $distanceKm, lat: $lat, lng: $lng, address: $address, menu: $menu)';
}


}

/// @nodoc
abstract mixin class $RestaurantCopyWith<$Res>  {
  factory $RestaurantCopyWith(Restaurant value, $Res Function(Restaurant) _then) = _$RestaurantCopyWithImpl;
@useResult
$Res call({
 String id, String name, String cuisineId, String cuisine, String description, String cover, String logo, double rating, int ratingCount, int deliveryMinutes, double deliveryFee, int priceLevel, bool freeDelivery, List<String> offers, double distanceKm, double? lat, double? lng, String address, List<MenuCategory> menu
});




}
/// @nodoc
class _$RestaurantCopyWithImpl<$Res>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._self, this._then);

  final Restaurant _self;
  final $Res Function(Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cuisineId = null,Object? cuisine = null,Object? description = null,Object? cover = null,Object? logo = null,Object? rating = null,Object? ratingCount = null,Object? deliveryMinutes = null,Object? deliveryFee = null,Object? priceLevel = null,Object? freeDelivery = null,Object? offers = null,Object? distanceKm = null,Object? lat = freezed,Object? lng = freezed,Object? address = null,Object? menu = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cuisineId: null == cuisineId ? _self.cuisineId : cuisineId // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,deliveryMinutes: null == deliveryMinutes ? _self.deliveryMinutes : deliveryMinutes // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,priceLevel: null == priceLevel ? _self.priceLevel : priceLevel // ignore: cast_nullable_to_non_nullable
as int,freeDelivery: null == freeDelivery ? _self.freeDelivery : freeDelivery // ignore: cast_nullable_to_non_nullable
as bool,offers: null == offers ? _self.offers : offers // ignore: cast_nullable_to_non_nullable
as List<String>,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,menu: null == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [Restaurant].
extension RestaurantPatterns on Restaurant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Restaurant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Restaurant value)  $default,){
final _that = this;
switch (_that) {
case _Restaurant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Restaurant value)?  $default,){
final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String cuisineId,  String cuisine,  String description,  String cover,  String logo,  double rating,  int ratingCount,  int deliveryMinutes,  double deliveryFee,  int priceLevel,  bool freeDelivery,  List<String> offers,  double distanceKm,  double? lat,  double? lng,  String address,  List<MenuCategory> menu)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.name,_that.cuisineId,_that.cuisine,_that.description,_that.cover,_that.logo,_that.rating,_that.ratingCount,_that.deliveryMinutes,_that.deliveryFee,_that.priceLevel,_that.freeDelivery,_that.offers,_that.distanceKm,_that.lat,_that.lng,_that.address,_that.menu);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String cuisineId,  String cuisine,  String description,  String cover,  String logo,  double rating,  int ratingCount,  int deliveryMinutes,  double deliveryFee,  int priceLevel,  bool freeDelivery,  List<String> offers,  double distanceKm,  double? lat,  double? lng,  String address,  List<MenuCategory> menu)  $default,) {final _that = this;
switch (_that) {
case _Restaurant():
return $default(_that.id,_that.name,_that.cuisineId,_that.cuisine,_that.description,_that.cover,_that.logo,_that.rating,_that.ratingCount,_that.deliveryMinutes,_that.deliveryFee,_that.priceLevel,_that.freeDelivery,_that.offers,_that.distanceKm,_that.lat,_that.lng,_that.address,_that.menu);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String cuisineId,  String cuisine,  String description,  String cover,  String logo,  double rating,  int ratingCount,  int deliveryMinutes,  double deliveryFee,  int priceLevel,  bool freeDelivery,  List<String> offers,  double distanceKm,  double? lat,  double? lng,  String address,  List<MenuCategory> menu)?  $default,) {final _that = this;
switch (_that) {
case _Restaurant() when $default != null:
return $default(_that.id,_that.name,_that.cuisineId,_that.cuisine,_that.description,_that.cover,_that.logo,_that.rating,_that.ratingCount,_that.deliveryMinutes,_that.deliveryFee,_that.priceLevel,_that.freeDelivery,_that.offers,_that.distanceKm,_that.lat,_that.lng,_that.address,_that.menu);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Restaurant extends Restaurant {
  const _Restaurant({required this.id, required this.name, this.cuisineId = '', this.cuisine = '', this.description = '', this.cover = '', this.logo = '', this.rating = 0, this.ratingCount = 0, this.deliveryMinutes = 30, this.deliveryFee = 0, this.priceLevel = 1, this.freeDelivery = false, final  List<String> offers = const <String>[], this.distanceKm = 0, this.lat, this.lng, this.address = '', final  List<MenuCategory> menu = const <MenuCategory>[]}): _offers = offers,_menu = menu,super._();
  factory _Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String cuisineId;
@override@JsonKey() final  String cuisine;
@override@JsonKey() final  String description;
@override@JsonKey() final  String cover;
@override@JsonKey() final  String logo;
@override@JsonKey() final  double rating;
@override@JsonKey() final  int ratingCount;
@override@JsonKey() final  int deliveryMinutes;
@override@JsonKey() final  double deliveryFee;
@override@JsonKey() final  int priceLevel;
@override@JsonKey() final  bool freeDelivery;
 final  List<String> _offers;
@override@JsonKey() List<String> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

@override@JsonKey() final  double distanceKm;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey() final  String address;
 final  List<MenuCategory> _menu;
@override@JsonKey() List<MenuCategory> get menu {
  if (_menu is EqualUnmodifiableListView) return _menu;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menu);
}


/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RestaurantCopyWith<_Restaurant> get copyWith => __$RestaurantCopyWithImpl<_Restaurant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RestaurantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Restaurant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cuisineId, cuisineId) || other.cuisineId == cuisineId)&&(identical(other.cuisine, cuisine) || other.cuisine == cuisine)&&(identical(other.description, description) || other.description == description)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.deliveryMinutes, deliveryMinutes) || other.deliveryMinutes == deliveryMinutes)&&(identical(other.deliveryFee, deliveryFee) || other.deliveryFee == deliveryFee)&&(identical(other.priceLevel, priceLevel) || other.priceLevel == priceLevel)&&(identical(other.freeDelivery, freeDelivery) || other.freeDelivery == freeDelivery)&&const DeepCollectionEquality().equals(other._offers, _offers)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._menu, _menu));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,cuisineId,cuisine,description,cover,logo,rating,ratingCount,deliveryMinutes,deliveryFee,priceLevel,freeDelivery,const DeepCollectionEquality().hash(_offers),distanceKm,lat,lng,address,const DeepCollectionEquality().hash(_menu)]);

@override
String toString() {
  return 'Restaurant(id: $id, name: $name, cuisineId: $cuisineId, cuisine: $cuisine, description: $description, cover: $cover, logo: $logo, rating: $rating, ratingCount: $ratingCount, deliveryMinutes: $deliveryMinutes, deliveryFee: $deliveryFee, priceLevel: $priceLevel, freeDelivery: $freeDelivery, offers: $offers, distanceKm: $distanceKm, lat: $lat, lng: $lng, address: $address, menu: $menu)';
}


}

/// @nodoc
abstract mixin class _$RestaurantCopyWith<$Res> implements $RestaurantCopyWith<$Res> {
  factory _$RestaurantCopyWith(_Restaurant value, $Res Function(_Restaurant) _then) = __$RestaurantCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String cuisineId, String cuisine, String description, String cover, String logo, double rating, int ratingCount, int deliveryMinutes, double deliveryFee, int priceLevel, bool freeDelivery, List<String> offers, double distanceKm, double? lat, double? lng, String address, List<MenuCategory> menu
});




}
/// @nodoc
class __$RestaurantCopyWithImpl<$Res>
    implements _$RestaurantCopyWith<$Res> {
  __$RestaurantCopyWithImpl(this._self, this._then);

  final _Restaurant _self;
  final $Res Function(_Restaurant) _then;

/// Create a copy of Restaurant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cuisineId = null,Object? cuisine = null,Object? description = null,Object? cover = null,Object? logo = null,Object? rating = null,Object? ratingCount = null,Object? deliveryMinutes = null,Object? deliveryFee = null,Object? priceLevel = null,Object? freeDelivery = null,Object? offers = null,Object? distanceKm = null,Object? lat = freezed,Object? lng = freezed,Object? address = null,Object? menu = null,}) {
  return _then(_Restaurant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cuisineId: null == cuisineId ? _self.cuisineId : cuisineId // ignore: cast_nullable_to_non_nullable
as String,cuisine: null == cuisine ? _self.cuisine : cuisine // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as String,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,deliveryMinutes: null == deliveryMinutes ? _self.deliveryMinutes : deliveryMinutes // ignore: cast_nullable_to_non_nullable
as int,deliveryFee: null == deliveryFee ? _self.deliveryFee : deliveryFee // ignore: cast_nullable_to_non_nullable
as double,priceLevel: null == priceLevel ? _self.priceLevel : priceLevel // ignore: cast_nullable_to_non_nullable
as int,freeDelivery: null == freeDelivery ? _self.freeDelivery : freeDelivery // ignore: cast_nullable_to_non_nullable
as bool,offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<String>,distanceKm: null == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,menu: null == menu ? _self._menu : menu // ignore: cast_nullable_to_non_nullable
as List<MenuCategory>,
  ));
}


}

// dart format on
