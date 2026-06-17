import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  const Address._();

  const factory Address({
    required String id,
    @Default('usr_01') String userId,
    required String label,
    required String line1,
    @Default('') String line2,
    @Default('') String city,
    @Default('') String notes,
    double? lat,
    double? lng,
    @Default(false) bool isDefault,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  /// Single-line summary for compact display.
  String get summary =>
      [line1, if (line2.isNotEmpty) line2, if (city.isNotEmpty) city]
          .join(', ');
}
