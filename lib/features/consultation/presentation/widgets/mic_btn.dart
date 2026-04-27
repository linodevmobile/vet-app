import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/ds_colors.dart';

class MicBtn extends StatefulWidget {
  const MicBtn({
    required this.isRecording,
    required this.onTap,
    this.enabled = true,
    super.key,
  });

  final bool isRecording;
  final VoidCallback onTap;
  final bool enabled;

  @override
  State<MicBtn> createState() => _MicBtnState();
}

class _MicBtnState extends State<MicBtn> with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  @override
  void didUpdateWidget(MicBtn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRecording && !_pulse.isAnimating) {
      _pulse.repeat(reverse: true);
    } else if (!widget.isRecording && _pulse.isAnimating) {
      _pulse
        ..stop()
        ..value = 1;
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.isRecording ? DsColors.urgent : DsColors.ink60;
    final bg = widget.isRecording ? DsColors.urgentSoft : DsColors.surface;
    final border = widget.isRecording ? DsColors.urgent : DsColors.line;

    return AnimatedBuilder(
      animation: _pulse,
      builder: (context, _) {
        final opacity = widget.isRecording ? (0.35 + 0.65 * _pulse.value) : 1.0;
        return Opacity(
          opacity: opacity,
          child: Material(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: widget.enabled ? widget.onTap : null,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: border),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  widget.isRecording ? Icons.stop_rounded : Icons.mic_rounded,
                  size: 16,
                  color: color,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
