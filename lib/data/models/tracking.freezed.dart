// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tracking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrackingStep {

 String get key; String get label; bool get done; bool get active;
/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingStepCopyWith<TrackingStep> get copyWith => _$TrackingStepCopyWithImpl<TrackingStep>(this as TrackingStep, _$identity);

  /// Serializes this TrackingStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrackingStep&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.done, done) || other.done == done)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,done,active);

@override
String toString() {
  return 'TrackingStep(key: $key, label: $label, done: $done, active: $active)';
}


}

/// @nodoc
abstract mixin class $TrackingStepCopyWith<$Res>  {
  factory $TrackingStepCopyWith(TrackingStep value, $Res Function(TrackingStep) _then) = _$TrackingStepCopyWithImpl;
@useResult
$Res call({
 String key, String label, bool done, bool active
});




}
/// @nodoc
class _$TrackingStepCopyWithImpl<$Res>
    implements $TrackingStepCopyWith<$Res> {
  _$TrackingStepCopyWithImpl(this._self, this._then);

  final TrackingStep _self;
  final $Res Function(TrackingStep) _then;

/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,Object? done = null,Object? active = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrackingStep].
extension TrackingStepPatterns on TrackingStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrackingStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrackingStep value)  $default,){
final _that = this;
switch (_that) {
case _TrackingStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrackingStep value)?  $default,){
final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label,  bool done,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
return $default(_that.key,_that.label,_that.done,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label,  bool done,  bool active)  $default,) {final _that = this;
switch (_that) {
case _TrackingStep():
return $default(_that.key,_that.label,_that.done,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label,  bool done,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _TrackingStep() when $default != null:
return $default(_that.key,_that.label,_that.done,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrackingStep implements TrackingStep {
  const _TrackingStep({required this.key, required this.label, this.done = false, this.active = false});
  factory _TrackingStep.fromJson(Map<String, dynamic> json) => _$TrackingStepFromJson(json);

@override final  String key;
@override final  String label;
@override@JsonKey() final  bool done;
@override@JsonKey() final  bool active;

/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingStepCopyWith<_TrackingStep> get copyWith => __$TrackingStepCopyWithImpl<_TrackingStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingStepToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackingStep&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label)&&(identical(other.done, done) || other.done == done)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label,done,active);

@override
String toString() {
  return 'TrackingStep(key: $key, label: $label, done: $done, active: $active)';
}


}

/// @nodoc
abstract mixin class _$TrackingStepCopyWith<$Res> implements $TrackingStepCopyWith<$Res> {
  factory _$TrackingStepCopyWith(_TrackingStep value, $Res Function(_TrackingStep) _then) = __$TrackingStepCopyWithImpl;
@override @useResult
$Res call({
 String key, String label, bool done, bool active
});




}
/// @nodoc
class __$TrackingStepCopyWithImpl<$Res>
    implements _$TrackingStepCopyWith<$Res> {
  __$TrackingStepCopyWithImpl(this._self, this._then);

  final _TrackingStep _self;
  final $Res Function(_TrackingStep) _then;

/// Create a copy of TrackingStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,Object? done = null,Object? active = null,}) {
  return _then(_TrackingStep(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Tracking {

 String get orderId; String get status; int get etaMinutes; Courier? get courier; List<List<double>> get route; List<TrackingStep> get steps;
/// Create a copy of Tracking
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrackingCopyWith<Tracking> get copyWith => _$TrackingCopyWithImpl<Tracking>(this as Tracking, _$identity);

  /// Serializes this Tracking to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tracking&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.courier, courier) || other.courier == courier)&&const DeepCollectionEquality().equals(other.route, route)&&const DeepCollectionEquality().equals(other.steps, steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,status,etaMinutes,courier,const DeepCollectionEquality().hash(route),const DeepCollectionEquality().hash(steps));

@override
String toString() {
  return 'Tracking(orderId: $orderId, status: $status, etaMinutes: $etaMinutes, courier: $courier, route: $route, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $TrackingCopyWith<$Res>  {
  factory $TrackingCopyWith(Tracking value, $Res Function(Tracking) _then) = _$TrackingCopyWithImpl;
@useResult
$Res call({
 String orderId, String status, int etaMinutes, Courier? courier, List<List<double>> route, List<TrackingStep> steps
});


$CourierCopyWith<$Res>? get courier;

}
/// @nodoc
class _$TrackingCopyWithImpl<$Res>
    implements $TrackingCopyWith<$Res> {
  _$TrackingCopyWithImpl(this._self, this._then);

  final Tracking _self;
  final $Res Function(Tracking) _then;

/// Create a copy of Tracking
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? status = null,Object? etaMinutes = null,Object? courier = freezed,Object? route = null,Object? steps = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as Courier?,route: null == route ? _self.route : route // ignore: cast_nullable_to_non_nullable
as List<List<double>>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<TrackingStep>,
  ));
}
/// Create a copy of Tracking
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


/// Adds pattern-matching-related methods to [Tracking].
extension TrackingPatterns on Tracking {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tracking value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tracking() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tracking value)  $default,){
final _that = this;
switch (_that) {
case _Tracking():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tracking value)?  $default,){
final _that = this;
switch (_that) {
case _Tracking() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String status,  int etaMinutes,  Courier? courier,  List<List<double>> route,  List<TrackingStep> steps)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tracking() when $default != null:
return $default(_that.orderId,_that.status,_that.etaMinutes,_that.courier,_that.route,_that.steps);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String status,  int etaMinutes,  Courier? courier,  List<List<double>> route,  List<TrackingStep> steps)  $default,) {final _that = this;
switch (_that) {
case _Tracking():
return $default(_that.orderId,_that.status,_that.etaMinutes,_that.courier,_that.route,_that.steps);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String status,  int etaMinutes,  Courier? courier,  List<List<double>> route,  List<TrackingStep> steps)?  $default,) {final _that = this;
switch (_that) {
case _Tracking() when $default != null:
return $default(_that.orderId,_that.status,_that.etaMinutes,_that.courier,_that.route,_that.steps);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tracking implements Tracking {
  const _Tracking({required this.orderId, required this.status, this.etaMinutes = 0, this.courier, final  List<List<double>> route = const <List<double>>[], final  List<TrackingStep> steps = const <TrackingStep>[]}): _route = route,_steps = steps;
  factory _Tracking.fromJson(Map<String, dynamic> json) => _$TrackingFromJson(json);

@override final  String orderId;
@override final  String status;
@override@JsonKey() final  int etaMinutes;
@override final  Courier? courier;
 final  List<List<double>> _route;
@override@JsonKey() List<List<double>> get route {
  if (_route is EqualUnmodifiableListView) return _route;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_route);
}

 final  List<TrackingStep> _steps;
@override@JsonKey() List<TrackingStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of Tracking
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackingCopyWith<_Tracking> get copyWith => __$TrackingCopyWithImpl<_Tracking>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrackingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tracking&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.status, status) || other.status == status)&&(identical(other.etaMinutes, etaMinutes) || other.etaMinutes == etaMinutes)&&(identical(other.courier, courier) || other.courier == courier)&&const DeepCollectionEquality().equals(other._route, _route)&&const DeepCollectionEquality().equals(other._steps, _steps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,status,etaMinutes,courier,const DeepCollectionEquality().hash(_route),const DeepCollectionEquality().hash(_steps));

@override
String toString() {
  return 'Tracking(orderId: $orderId, status: $status, etaMinutes: $etaMinutes, courier: $courier, route: $route, steps: $steps)';
}


}

/// @nodoc
abstract mixin class _$TrackingCopyWith<$Res> implements $TrackingCopyWith<$Res> {
  factory _$TrackingCopyWith(_Tracking value, $Res Function(_Tracking) _then) = __$TrackingCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String status, int etaMinutes, Courier? courier, List<List<double>> route, List<TrackingStep> steps
});


@override $CourierCopyWith<$Res>? get courier;

}
/// @nodoc
class __$TrackingCopyWithImpl<$Res>
    implements _$TrackingCopyWith<$Res> {
  __$TrackingCopyWithImpl(this._self, this._then);

  final _Tracking _self;
  final $Res Function(_Tracking) _then;

/// Create a copy of Tracking
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? status = null,Object? etaMinutes = null,Object? courier = freezed,Object? route = null,Object? steps = null,}) {
  return _then(_Tracking(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,etaMinutes: null == etaMinutes ? _self.etaMinutes : etaMinutes // ignore: cast_nullable_to_non_nullable
as int,courier: freezed == courier ? _self.courier : courier // ignore: cast_nullable_to_non_nullable
as Courier?,route: null == route ? _self._route : route // ignore: cast_nullable_to_non_nullable
as List<List<double>>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<TrackingStep>,
  ));
}

/// Create a copy of Tracking
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
