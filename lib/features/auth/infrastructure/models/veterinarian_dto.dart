import 'package:freezed_annotation/freezed_annotation.dart';

part 'veterinarian_dto.freezed.dart';
part 'veterinarian_dto.g.dart';

@freezed
abstract class VeterinarianDto with _$VeterinarianDto {
  const factory VeterinarianDto({
    required String id,
    required String email,
    required String fullName,
    String? licenseNumber,
    String? phone,
    String? salutation,
  }) = _VeterinarianDto;

  factory VeterinarianDto.fromJson(Map<String, dynamic> json) =>
      _$VeterinarianDtoFromJson(json);
}
