import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vet_app/features/auth/infrastructure/models/session_dto.dart';
import 'package:vet_app/features/auth/infrastructure/models/veterinarian_dto.dart';

part 'auth_response_dto.freezed.dart';
part 'auth_response_dto.g.dart';

@freezed
abstract class AuthResponseDto with _$AuthResponseDto {
  const factory AuthResponseDto({
    required VeterinarianDto veterinarian,
    required SessionDto session,
  }) = _AuthResponseDto;

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDtoFromJson(json);
}
