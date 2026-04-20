import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/patients/presentation/controllers/patient_search_query.dart';

class PatientSearchInput extends ConsumerStatefulWidget {
  const PatientSearchInput({super.key});

  @override
  ConsumerState<PatientSearchInput> createState() => _PatientSearchInputState();
}

class _PatientSearchInputState extends ConsumerState<PatientSearchInput> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(patientSearchQueryProvider),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(patientSearchQueryProvider);
    final hasQuery = query.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: DsColors.surface,
        borderRadius: BorderRadius.circular(DsRadii.r2),
        border: Border.all(
          color: hasQuery ? DsColors.primary : DsColors.line,
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, size: 18, color: DsColors.ink60),
          const SizedBox(width: DsSpacing.sm),
          Expanded(
            child: TextField(
              controller: _controller,
              autofocus: true,
              style: DsTypography.bodyLg,
              decoration: const InputDecoration(
                hintText: 'Nombre del paciente, dueño o raza…',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                filled: false,
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
              onChanged: (v) =>
                  ref.read(patientSearchQueryProvider.notifier).update(v),
            ),
          ),
          if (hasQuery)
            IconButton(
              icon: const Icon(Icons.close, size: 16, color: DsColors.ink40),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                _controller.clear();
                ref.read(patientSearchQueryProvider.notifier).clear();
              },
            ),
        ],
      ),
    );
  }
}
