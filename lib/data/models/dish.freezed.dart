// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomizationOption {

 String get name; double get priceDelta;
/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomizationOptionCopyWith<CustomizationOption> get copyWith => _$CustomizationOptionCopyWithImpl<CustomizationOption>(this as CustomizationOption, _$identity);

  /// Serializes this CustomizationOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomizationOption&&(identical(other.name, name) || other.name == name)&&(identical(other.priceDelta, priceDelta) || other.priceDelta == priceDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,priceDelta);

@override
String toString() {
  return 'CustomizationOption(name: $name, priceDelta: $priceDelta)';
}


}

/// @nodoc
abstract mixin class $CustomizationOptionCopyWith<$Res>  {
  factory $CustomizationOptionCopyWith(CustomizationOption value, $Res Function(CustomizationOption) _then) = _$CustomizationOptionCopyWithImpl;
@useResult
$Res call({
 String name, double priceDelta
});




}
/// @nodoc
class _$CustomizationOptionCopyWithImpl<$Res>
    implements $CustomizationOptionCopyWith<$Res> {
  _$CustomizationOptionCopyWithImpl(this._self, this._then);

  final CustomizationOption _self;
  final $Res Function(CustomizationOption) _then;

/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? priceDelta = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomizationOption].
extension CustomizationOptionPatterns on CustomizationOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomizationOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomizationOption value)  $default,){
final _that = this;
switch (_that) {
case _CustomizationOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomizationOption value)?  $default,){
final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double priceDelta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
return $default(_that.name,_that.priceDelta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double priceDelta)  $default,) {final _that = this;
switch (_that) {
case _CustomizationOption():
return $default(_that.name,_that.priceDelta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double priceDelta)?  $default,) {final _that = this;
switch (_that) {
case _CustomizationOption() when $default != null:
return $default(_that.name,_that.priceDelta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomizationOption implements CustomizationOption {
  const _CustomizationOption({required this.name, this.priceDelta = 0});
  factory _CustomizationOption.fromJson(Map<String, dynamic> json) => _$CustomizationOptionFromJson(json);

@override final  String name;
@override@JsonKey() final  double priceDelta;

/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomizationOptionCopyWith<_CustomizationOption> get copyWith => __$CustomizationOptionCopyWithImpl<_CustomizationOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomizationOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomizationOption&&(identical(other.name, name) || other.name == name)&&(identical(other.priceDelta, priceDelta) || other.priceDelta == priceDelta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,priceDelta);

@override
String toString() {
  return 'CustomizationOption(name: $name, priceDelta: $priceDelta)';
}


}

/// @nodoc
abstract mixin class _$CustomizationOptionCopyWith<$Res> implements $CustomizationOptionCopyWith<$Res> {
  factory _$CustomizationOptionCopyWith(_CustomizationOption value, $Res Function(_CustomizationOption) _then) = __$CustomizationOptionCopyWithImpl;
@override @useResult
$Res call({
 String name, double priceDelta
});




}
/// @nodoc
class __$CustomizationOptionCopyWithImpl<$Res>
    implements _$CustomizationOptionCopyWith<$Res> {
  __$CustomizationOptionCopyWithImpl(this._self, this._then);

  final _CustomizationOption _self;
  final $Res Function(_CustomizationOption) _then;

/// Create a copy of CustomizationOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? priceDelta = null,}) {
  return _then(_CustomizationOption(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceDelta: null == priceDelta ? _self.priceDelta : priceDelta // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CustomizationGroup {

 String get group; String get type;@JsonKey(name: 'required') bool get isRequired; List<CustomizationOption> get options;
/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomizationGroupCopyWith<CustomizationGroup> get copyWith => _$CustomizationGroupCopyWithImpl<CustomizationGroup>(this as CustomizationGroup, _$identity);

  /// Serializes this CustomizationGroup to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomizationGroup&&(identical(other.group, group) || other.group == group)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,group,type,isRequired,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'CustomizationGroup(group: $group, type: $type, isRequired: $isRequired, options: $options)';
}


}

/// @nodoc
abstract mixin class $CustomizationGroupCopyWith<$Res>  {
  factory $CustomizationGroupCopyWith(CustomizationGroup value, $Res Function(CustomizationGroup) _then) = _$CustomizationGroupCopyWithImpl;
@useResult
$Res call({
 String group, String type,@JsonKey(name: 'required') bool isRequired, List<CustomizationOption> options
});




}
/// @nodoc
class _$CustomizationGroupCopyWithImpl<$Res>
    implements $CustomizationGroupCopyWith<$Res> {
  _$CustomizationGroupCopyWithImpl(this._self, this._then);

  final CustomizationGroup _self;
  final $Res Function(CustomizationGroup) _then;

/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? group = null,Object? type = null,Object? isRequired = null,Object? options = null,}) {
  return _then(_self.copyWith(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<CustomizationOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomizationGroup].
extension CustomizationGroupPatterns on CustomizationGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomizationGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomizationGroup value)  $default,){
final _that = this;
switch (_that) {
case _CustomizationGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomizationGroup value)?  $default,){
final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String group,  String type, @JsonKey(name: 'required')  bool isRequired,  List<CustomizationOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
return $default(_that.group,_that.type,_that.isRequired,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String group,  String type, @JsonKey(name: 'required')  bool isRequired,  List<CustomizationOption> options)  $default,) {final _that = this;
switch (_that) {
case _CustomizationGroup():
return $default(_that.group,_that.type,_that.isRequired,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String group,  String type, @JsonKey(name: 'required')  bool isRequired,  List<CustomizationOption> options)?  $default,) {final _that = this;
switch (_that) {
case _CustomizationGroup() when $default != null:
return $default(_that.group,_that.type,_that.isRequired,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomizationGroup extends CustomizationGroup {
  const _CustomizationGroup({required this.group, this.type = 'single', @JsonKey(name: 'required') this.isRequired = false, final  List<CustomizationOption> options = const <CustomizationOption>[]}): _options = options,super._();
  factory _CustomizationGroup.fromJson(Map<String, dynamic> json) => _$CustomizationGroupFromJson(json);

@override final  String group;
@override@JsonKey() final  String type;
@override@JsonKey(name: 'required') final  bool isRequired;
 final  List<CustomizationOption> _options;
@override@JsonKey() List<CustomizationOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomizationGroupCopyWith<_CustomizationGroup> get copyWith => __$CustomizationGroupCopyWithImpl<_CustomizationGroup>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomizationGroupToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomizationGroup&&(identical(other.group, group) || other.group == group)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,group,type,isRequired,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'CustomizationGroup(group: $group, type: $type, isRequired: $isRequired, options: $options)';
}


}

/// @nodoc
abstract mixin class _$CustomizationGroupCopyWith<$Res> implements $CustomizationGroupCopyWith<$Res> {
  factory _$CustomizationGroupCopyWith(_CustomizationGroup value, $Res Function(_CustomizationGroup) _then) = __$CustomizationGroupCopyWithImpl;
@override @useResult
$Res call({
 String group, String type,@JsonKey(name: 'required') bool isRequired, List<CustomizationOption> options
});




}
/// @nodoc
class __$CustomizationGroupCopyWithImpl<$Res>
    implements _$CustomizationGroupCopyWith<$Res> {
  __$CustomizationGroupCopyWithImpl(this._self, this._then);

  final _CustomizationGroup _self;
  final $Res Function(_CustomizationGroup) _then;

/// Create a copy of CustomizationGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? group = null,Object? type = null,Object? isRequired = null,Object? options = null,}) {
  return _then(_CustomizationGroup(
group: null == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<CustomizationOption>,
  ));
}


}


/// @nodoc
mixin _$Dish {

 String get id; String get restaurantId; String get name; String get category; String get description; double get price; String get currency; String get image; bool get popular; List<CustomizationGroup> get customization;
/// Create a copy of Dish
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DishCopyWith<Dish> get copyWith => _$DishCopyWithImpl<Dish>(this as Dish, _$identity);

  /// Serializes this Dish to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Dish&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.image, image) || other.image == image)&&(identical(other.popular, popular) || other.popular == popular)&&const DeepCollectionEquality().equals(other.customization, customization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,name,category,description,price,currency,image,popular,const DeepCollectionEquality().hash(customization));

@override
String toString() {
  return 'Dish(id: $id, restaurantId: $restaurantId, name: $name, category: $category, description: $description, price: $price, currency: $currency, image: $image, popular: $popular, customization: $customization)';
}


}

/// @nodoc
abstract mixin class $DishCopyWith<$Res>  {
  factory $DishCopyWith(Dish value, $Res Function(Dish) _then) = _$DishCopyWithImpl;
@useResult
$Res call({
 String id, String restaurantId, String name, String category, String description, double price, String currency, String image, bool popular, List<CustomizationGroup> customization
});




}
/// @nodoc
class _$DishCopyWithImpl<$Res>
    implements $DishCopyWith<$Res> {
  _$DishCopyWithImpl(this._self, this._then);

  final Dish _self;
  final $Res Function(Dish) _then;

/// Create a copy of Dish
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? restaurantId = null,Object? name = null,Object? category = null,Object? description = null,Object? price = null,Object? currency = null,Object? image = null,Object? popular = null,Object? customization = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as bool,customization: null == customization ? _self.customization : customization // ignore: cast_nullable_to_non_nullable
as List<CustomizationGroup>,
  ));
}

}


/// Adds pattern-matching-related methods to [Dish].
extension DishPatterns on Dish {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Dish value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Dish() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Dish value)  $default,){
final _that = this;
switch (_that) {
case _Dish():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Dish value)?  $default,){
final _that = this;
switch (_that) {
case _Dish() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String restaurantId,  String name,  String category,  String description,  double price,  String currency,  String image,  bool popular,  List<CustomizationGroup> customization)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Dish() when $default != null:
return $default(_that.id,_that.restaurantId,_that.name,_that.category,_that.description,_that.price,_that.currency,_that.image,_that.popular,_that.customization);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String restaurantId,  String name,  String category,  String description,  double price,  String currency,  String image,  bool popular,  List<CustomizationGroup> customization)  $default,) {final _that = this;
switch (_that) {
case _Dish():
return $default(_that.id,_that.restaurantId,_that.name,_that.category,_that.description,_that.price,_that.currency,_that.image,_that.popular,_that.customization);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String restaurantId,  String name,  String category,  String description,  double price,  String currency,  String image,  bool popular,  List<CustomizationGroup> customization)?  $default,) {final _that = this;
switch (_that) {
case _Dish() when $default != null:
return $default(_that.id,_that.restaurantId,_that.name,_that.category,_that.description,_that.price,_that.currency,_that.image,_that.popular,_that.customization);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Dish implements Dish {
  const _Dish({required this.id, required this.restaurantId, required this.name, this.category = '', this.description = '', required this.price, this.currency = 'USD', this.image = '', this.popular = false, final  List<CustomizationGroup> customization = const <CustomizationGroup>[]}): _customization = customization;
  factory _Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

@override final  String id;
@override final  String restaurantId;
@override final  String name;
@override@JsonKey() final  String category;
@override@JsonKey() final  String description;
@override final  double price;
@override@JsonKey() final  String currency;
@override@JsonKey() final  String image;
@override@JsonKey() final  bool popular;
 final  List<CustomizationGroup> _customization;
@override@JsonKey() List<CustomizationGroup> get customization {
  if (_customization is EqualUnmodifiableListView) return _customization;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customization);
}


/// Create a copy of Dish
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DishCopyWith<_Dish> get copyWith => __$DishCopyWithImpl<_Dish>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DishToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Dish&&(identical(other.id, id) || other.id == id)&&(identical(other.restaurantId, restaurantId) || other.restaurantId == restaurantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.image, image) || other.image == image)&&(identical(other.popular, popular) || other.popular == popular)&&const DeepCollectionEquality().equals(other._customization, _customization));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,restaurantId,name,category,description,price,currency,image,popular,const DeepCollectionEquality().hash(_customization));

@override
String toString() {
  return 'Dish(id: $id, restaurantId: $restaurantId, name: $name, category: $category, description: $description, price: $price, currency: $currency, image: $image, popular: $popular, customization: $customization)';
}


}

/// @nodoc
abstract mixin class _$DishCopyWith<$Res> implements $DishCopyWith<$Res> {
  factory _$DishCopyWith(_Dish value, $Res Function(_Dish) _then) = __$DishCopyWithImpl;
@override @useResult
$Res call({
 String id, String restaurantId, String name, String category, String description, double price, String currency, String image, bool popular, List<CustomizationGroup> customization
});




}
/// @nodoc
class __$DishCopyWithImpl<$Res>
    implements _$DishCopyWith<$Res> {
  __$DishCopyWithImpl(this._self, this._then);

  final _Dish _self;
  final $Res Function(_Dish) _then;

/// Create a copy of Dish
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? restaurantId = null,Object? name = null,Object? category = null,Object? description = null,Object? price = null,Object? currency = null,Object? image = null,Object? popular = null,Object? customization = null,}) {
  return _then(_Dish(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,restaurantId: null == restaurantId ? _self.restaurantId : restaurantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,popular: null == popular ? _self.popular : popular // ignore: cast_nullable_to_non_nullable
as bool,customization: null == customization ? _self._customization : customization // ignore: cast_nullable_to_non_nullable
as List<CustomizationGroup>,
  ));
}


}

// dart format on
