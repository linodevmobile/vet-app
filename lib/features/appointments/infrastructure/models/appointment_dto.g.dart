// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentDto _$AppointmentDtoFromJson(Map<String, dynamic> json) =>
    _AppointmentDto(
      id: json['id'] as String,
      patientId: json['patient_id'] as String,
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      status: json['status'] as String,
      reason: json['reason'] as String?,
      urgent: json['urgent'] as bool? ?? false,
      consultationId: json['consultation_id'] as String?,
      patient: json['patient'] == null
          ? null
          : AppointmentPatientDto.fromJson(
              json['patient'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AppointmentDtoToJson(_AppointmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient_id': instance.patientId,
      'scheduled_at': instance.scheduledAt.toIso8601String(),
      'status': instance.status,
      'reason': instance.reason,
      'urgent': instance.urgent,
      'consultation_id': instance.consultationId,
      'patient': instance.patient?.toJson(),
    };
