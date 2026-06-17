// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads order tracking and, for the demo, auto-advances the status on a timer
/// and animates the courier along the route toward the delivery address.

@ProviderFor(TrackingController)
final trackingControllerProvider = TrackingControllerFamily._();

/// Loads order tracking and, for the demo, auto-advances the status on a timer
/// and animates the courier along the route toward the delivery address.
final class TrackingControllerProvider
    extends $AsyncNotifierProvider<TrackingController, TrackingState> {
  /// Loads order tracking and, for the demo, auto-advances the status on a timer
  /// and animates the courier along the route toward the delivery address.
  TrackingControllerProvider._({
    required TrackingControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'trackingControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$trackingControllerHash();

  @override
  String toString() {
    return r'trackingControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TrackingController create() => TrackingController();

  @override
  bool operator ==(Object other) {
    return other is TrackingControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$trackingControllerHash() =>
    r'1104469a6f05dae05958d3e7d35224024198edf5';

/// Loads order tracking and, for the demo, auto-advances the status on a timer
/// and animates the courier along the route toward the delivery address.

final class TrackingControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          TrackingController,
          AsyncValue<TrackingState>,
          TrackingState,
          FutureOr<TrackingState>,
          String
        > {
  TrackingControllerFamily._()
    : super(
        retry: null,
        name: r'trackingControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads order tracking and, for the demo, auto-advances the status on a timer
  /// and animates the courier along the route toward the delivery address.

  TrackingControllerProvider call(String orderId) =>
      TrackingControllerProvider._(argument: orderId, from: this);

  @override
  String toString() => r'trackingControllerProvider';
}

/// Loads order tracking and, for the demo, auto-advances the status on a timer
/// and animates the courier along the route toward the delivery address.

abstract class _$TrackingController extends $AsyncNotifier<TrackingState> {
  late final _$args = ref.$arg as String;
  String get orderId => _$args;

  FutureOr<TrackingState> build(String orderId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<TrackingState>, TrackingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<TrackingState>, TrackingState>,
              AsyncValue<TrackingState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
