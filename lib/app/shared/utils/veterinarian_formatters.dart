import 'package:vet_app/features/auth/domain/entities/veterinarian.dart';

abstract final class VeterinarianFormatters {
  /// Forma de tratamiento profesional. Backend puede dejarlo `null` si el vet
  /// no lo configuró; en ese caso componemos uno básico con el nombre.
  static String salutation(Veterinarian v) =>
      (v.salutation != null && v.salutation!.isNotEmpty)
          ? v.salutation!
          : 'Dr. ${v.fullName}';

  /// Línea inferior de la firma clínica (debajo del nombre del vet).
  /// Si no hay matrícula registrada, devolvemos string vacío.
  static String registry(Veterinarian v) =>
      (v.licenseNumber != null && v.licenseNumber!.isNotEmpty)
          ? 'MV · Reg. ${v.licenseNumber}'
          : '';
}
