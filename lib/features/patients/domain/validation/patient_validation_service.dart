import 'package:vet_app/core/validations/core_validation_service.dart';

abstract final class PatientValidationService {
  static String? validateAge(String? value) {
    final required =
        CoreValidationService.validateRequired(value, fieldName: 'Edad');
    if (required != null) return required;
    final n = int.tryParse(value!.trim());
    if (n == null || n < 0 || n > 60) return 'Edad inválida';
    return null;
  }

  static String? validateWeight(String? value) {
    final required =
        CoreValidationService.validateRequired(value, fieldName: 'Peso');
    if (required != null) return required;
    final n = double.tryParse(value!.trim().replaceAll(',', '.'));
    if (n == null || n <= 0 || n > 200) return 'Peso inválido';
    return null;
  }

  static String? validatePhone(String? value) {
    final required =
        CoreValidationService.validateRequired(value, fieldName: 'Teléfono');
    if (required != null) return required;
    final digits = value!.replaceAll(RegExp(r'[^0-9]'), '');
    if (digits.length < 7) return 'Teléfono inválido';
    return null;
  }
}
