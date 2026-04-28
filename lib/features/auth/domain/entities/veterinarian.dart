import 'package:freezed_annotation/freezed_annotation.dart';

part 'veterinarian.freezed.dart';

@freezed
abstract class Veterinarian with _$Veterinarian {
  const factory Veterinarian({
    required String id,
    required String email,
    required String fullName,
    String? licenseNumber,
    String? phone,
    String? salutation,
  }) = _Veterinarian;
}
