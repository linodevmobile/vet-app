// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseDto _$AuthResponseDtoFromJson(Map<String, dynamic> json) =>
    _AuthResponseDto(
      veterinarian: VeterinarianDto.fromJson(
        json['veterinarian'] as Map<String, dynamic>,
      ),
      session: SessionDto.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthResponseDtoToJson(_AuthResponseDto instance) =>
    <String, dynamic>{
      'veterinarian': instance.veterinarian.toJson(),
      'session': instance.session.toJson(),
    };
