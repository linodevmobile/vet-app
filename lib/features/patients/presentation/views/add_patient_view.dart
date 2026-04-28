import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_app/app/router/app_routes.dart';
import 'package:vet_app/core/validations/core_validation_service.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/molecules/ds_field_label.dart';
import 'package:vet_app/design_system/molecules/ds_screen_header.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/presentation/controllers/create_consultation_controller.dart';
import 'package:vet_app/features/patients/domain/entities/patient.dart';
import 'package:vet_app/features/patients/domain/validation/patient_validation_service.dart';
import 'package:vet_app/features/patients/presentation/controllers/add_patient_controller.dart';
import 'package:vet_app/features/patients/presentation/controllers/sex_selection_controller.dart';
import 'package:vet_app/features/patients/presentation/controllers/species_selection_controller.dart';
import 'package:vet_app/features/patients/presentation/sections/add_patient_sex_selector.dart';
import 'package:vet_app/features/patients/presentation/sections/add_patient_species_selector.dart';

class AddPatientView extends ConsumerStatefulWidget {
  const AddPatientView({super.key});

  @override
  ConsumerState<AddPatientView> createState() => _AddPatientViewState();
}

class _AddPatientViewState extends ConsumerState<AddPatientView> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _weight = TextEditingController();
  final _owner = TextEditingController();
  final _phone = TextEditingController();

  // Patient recién creado, esperando que termine la creación de su consulta
  // antes de navegar. Mantiene el dato completo para pasarlo al ConsultationView.
  Patient? _pendingPatient;

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    _weight.dispose();
    _owner.dispose();
    _phone.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final draft = Patient(
      id: '',
      name: _name.text.trim(),
      species: ref.read(speciesSelectionControllerProvider),
      sex: ref.read(sexSelectionControllerProvider),
      breed: '',
      ageYears: int.tryParse(_age.text.trim()) ?? 0,
      ownerName: _owner.text.trim(),
      lastVisit: DateTime.now(),
      weightKg: double.tryParse(_weight.text.trim().replaceAll(',', '.')),
      ownerPhone: _phone.text.trim().isEmpty ? null : _phone.text.trim(),
    );
    ref.read(addPatientControllerProvider.notifier).submit(draft);
  }

  void _pop() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.patients);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<Patient?>>(addPatientControllerProvider, (prev, next) {
      next.whenOrNull(
        error: (e, _) => DsToast.show(
          context,
          message: '$e',
          variant: DsToastVariant.error,
        ),
        data: (patient) {
          if (patient == null) return;
          DsToast.show(
            context,
            message: '${patient.name} creado',
            variant: DsToastVariant.success,
          );
          // Encadenar: paciente creado → crear consulta vacía → navegar.
          // El segundo listener (createConsultationController) maneja el push.
          _pendingPatient = patient;
          ref
              .read(createConsultationControllerProvider.notifier)
              .create(patientId: patient.id);
        },
      );
    });

    ref.listen<AsyncValue<String?>>(createConsultationControllerProvider, (
      prev,
      next,
    ) {
      next.whenOrNull(
        error: (e, _) => DsToast.show(
          context,
          message: 'No se pudo crear la consulta: $e',
          variant: DsToastVariant.error,
        ),
        data: (id) {
          final patient = _pendingPatient;
          if (id == null || patient == null) return;
          context.go(
            AppRoutes.consultationNew,
            extra: (patient: patient, consultationId: id),
          );
        },
      );
    });

    final isSaving = ref.watch(addPatientControllerProvider).isLoading ||
        ref.watch(createConsultationControllerProvider).isLoading;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                DsSpacing.lg,
                DsSpacing.md,
                DsSpacing.lg,
                DsSpacing.md,
              ),
              child: DsScreenHeader(title: 'Paciente nuevo', onBack: _pop),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  DsSpacing.lg,
                  0,
                  DsSpacing.lg,
                  DsSpacing.xxl,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Solo lo mínimo para empezar. Podrás completar el '
                        'resto durante o después de la consulta.',
                        style: DsTypography.bodyMd
                            .copyWith(color: DsColors.ink60),
                      ),
                      const SizedBox(height: DsSpacing.lg),
                      _Card(
                        child: DsFieldLabel(
                          label: 'Nombre del paciente',
                          child: DsTextInput(
                            controller: _name,
                            hint: 'Ej. Luna',
                            enabled: !isSaving,
                            validator: (v) =>
                                CoreValidationService.validateRequired(
                              v,
                              fieldName: 'Nombre',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: DsSpacing.md),
                      const _Card(
                        child: DsFieldLabel(
                          label: 'Especie',
                          child: AddPatientSpeciesSelector(),
                        ),
                      ),
                      const SizedBox(height: DsSpacing.md),
                      const _Card(
                        child: DsFieldLabel(
                          label: 'Sexo',
                          child: AddPatientSexSelector(),
                        ),
                      ),
                      const SizedBox(height: DsSpacing.md),
                      _Card(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: DsFieldLabel(
                                label: 'Edad',
                                child: DsTextInput(
                                  controller: _age,
                                  hint: '4 años',
                                  enabled: !isSaving,
                                  keyboardType: TextInputType.number,
                                  validator:
                                      PatientValidationService.validateAge,
                                ),
                              ),
                            ),
                            const SizedBox(width: DsSpacing.md),
                            Expanded(
                              child: DsFieldLabel(
                                label: 'Peso',
                                child: DsTextInput(
                                  controller: _weight,
                                  hint: '12.5 kg',
                                  enabled: !isSaving,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  validator:
                                      PatientValidationService.validateWeight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: DsSpacing.md),
                      _Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DsFieldLabel(
                              label: 'Dueño',
                              child: DsTextInput(
                                controller: _owner,
                                hint: 'Nombre y apellido',
                                enabled: !isSaving,
                                validator: (v) =>
                                    CoreValidationService.validateRequired(
                                  v,
                                  fieldName: 'Dueño',
                                ),
                              ),
                            ),
                            const SizedBox(height: DsSpacing.md),
                            DsFieldLabel(
                              label: 'Teléfono',
                              child: DsTextInput(
                                controller: _phone,
                                hint: '+34 600 000 000',
                                enabled: !isSaving,
                                keyboardType: TextInputType.phone,
                                validator:
                                    PatientValidationService.validatePhone,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: DsSpacing.xl),
                      DsPrimaryButton(
                        label: 'Guardar y empezar consulta',
                        isLoading: isSaving,
                        onPressed: _submit,
                        icon: const Icon(Icons.arrow_forward, size: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DsSpacing.md),
        child: child,
      ),
    );
  }
}
