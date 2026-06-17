import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo.freezed.dart';
part 'promo.g.dart';

@freezed
abstract class PromoResult with _$PromoResult {
  const factory PromoResult({
    required String code,
    required bool valid,
    @Default(0) double discountPct,
    @Default(false) bool freeDelivery,
    String? description,
    String? reason,
  }) = _PromoResult;

  factory PromoResult.fromJson(Map<String, dynamic> json) =>
      _$PromoResultFromJson(json);
}
