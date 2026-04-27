import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';
import 'package:vet_app/features/consultation/presentation/widgets/mic_btn.dart';

class FieldWithMic extends StatelessWidget {
  const FieldWithMic({
    required this.controller,
    required this.label,
    required this.isRecording,
    required this.onMicTap,
    this.minLines = 2,
    this.maxLines = 6,
    this.hint,
    this.micEnabled = true,
    this.isProcessing = false,
    this.recordingElapsed,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final bool isRecording;
  final VoidCallback onMicTap;
  final int minLines;
  final int maxLines;
  final String? hint;
  final bool micEnabled;
  final bool isProcessing;
  final Duration? recordingElapsed;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    final borderColor = isRecording ? DsColors.urgent : DsColors.ink20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: DsColors.ink80,
                ),
              ),
            ),
            MicBtn(
              isRecording: isRecording,
              enabled: micEnabled,
              onTap: onMicTap,
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          minLines: minLines,
          maxLines: maxLines,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          style: const TextStyle(fontSize: 14, color: DsColors.ink),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: DsColors.ink40),
            filled: true,
            fillColor: DsColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isRecording ? DsColors.urgent : DsColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
        if (isRecording) ...[
          const SizedBox(height: 6),
          _RecordingPill(elapsed: recordingElapsed ?? Duration.zero),
        ] else if (isProcessing) ...[
          const SizedBox(height: 6),
          const _ProcessingPill(),
        ],
      ],
    );
  }
}

class _RecordingPill extends StatefulWidget {
  const _RecordingPill({required this.elapsed});

  final Duration elapsed;

  @override
  State<_RecordingPill> createState() => _RecordingPillState();
}

class _RecordingPillState extends State<_RecordingPill>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  String _format(Duration d) {
    final m = d.inMinutes.toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: DsColors.urgentSoft,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: _pulse,
            builder: (_, __) => Opacity(
              opacity: 0.4 + 0.6 * _pulse.value,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: DsColors.urgent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Escuchando…',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: DsColors.urgent,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            _format(widget.elapsed),
            style: const TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              color: DsColors.ink60,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProcessingPill extends StatelessWidget {
  const _ProcessingPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: DsColors.aiSoft,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(
              strokeWidth: 1.6,
              valueColor: AlwaysStoppedAnimation(DsColors.ai),
            ),
          ),
          SizedBox(width: 8),
          Text(
            'Procesando audio…',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: DsColors.ai,
            ),
          ),
        ],
      ),
    );
  }
}
