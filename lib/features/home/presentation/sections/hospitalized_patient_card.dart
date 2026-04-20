import 'package:flutter/material.dart';
import 'package:vet_app/design_system/atoms/ds_pet_avatar.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/hospitalization/domain/entities/hospitalized_patient.dart';

class HospitalizedPatientCard extends StatelessWidget {
  const HospitalizedPatientCard({
    required this.data,
    required this.onTap,
    super.key,
  });

  final HospitalizedPatient data;
  final VoidCallback onTap;

  int get _completed => data.tasks.where((t) => t).length;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DsRadii.r3),
        side: BorderSide(
          color: data.critical ? DsColors.urgentSoft : DsColors.line,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(DsSpacing.md),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                DsPetAvatar(
                  species: data.patient.species,
                  size: 28,
                  urgent: data.critical,
                ),
                const SizedBox(width: DsSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.patient.name,
                        style: DsTypography.titleSm,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'DÍA ${data.day}',
                        style: DsTypography.kicker,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: DsSpacing.sm),
            SizedBox(
              height: 30,
              child: Text(
                data.note,
                style: DsTypography.bodySm,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: DsSpacing.sm),
            Row(
              children: [
                Expanded(child: _TasksBar(tasks: data.tasks)),
                const SizedBox(width: DsSpacing.sm),
                Text(
                  '$_completed/${data.tasks.length}',
                  style: DsTypography.mono.copyWith(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class _TasksBar extends StatelessWidget {
  const _TasksBar({required this.tasks});

  final List<bool> tasks;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(tasks.length, (i) {
        final done = tasks[i];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i < tasks.length - 1 ? 4 : 0),
            child: Container(
              height: 4,
              decoration: BoxDecoration(
                color: done ? DsColors.primary : DsColors.line,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        );
      }),
    );
  }
}
