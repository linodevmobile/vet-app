import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class ConsultationAiBar extends StatelessWidget {
  const ConsultationAiBar({
    required this.recording,
    required this.sectionLabel,
    required this.onToggle,
    super.key,
  });

  final bool recording;
  final String sectionLabel;
  final VoidCallback onToggle;

  static const Color _bg = Color(0xFF1A1915);
  static const Color _sparkleIdle = Color(0xFFE6D9B1);

  @override
  Widget build(BuildContext context) {
    final borderColor = recording
        ? DsColors.urgent
        : Colors.white.withValues(alpha: 0.15);
    final sparkleColor = recording ? DsColors.urgent : _sparkleIdle;
    final micBg = recording ? DsColors.urgent : Colors.white;
    final micIconColor = recording ? Colors.white : DsColors.ink;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _bg,
        borderRadius: BorderRadius.circular(DsRadii.pill),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
        child: Row(
          children: [
            Icon(Icons.auto_awesome, size: 14, color: sparkleColor),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    recording ? 'ESCUCHANDO…' : 'DICTAR A',
                    style: DsTypography.mono.copyWith(
                      fontSize: 10,
                      color: Colors.white.withValues(alpha: 0.5),
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    height: 18,
                    child: recording
                        ? const _Waveform()
                        : Text(
                            sectionLabel,
                            style: DsTypography.bodyMd.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            _MicButton(
              recording: recording,
              onTap: onToggle,
              background: micBg,
              iconColor: micIconColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _MicButton extends StatelessWidget {
  const _MicButton({
    required this.recording,
    required this.onTap,
    required this.background,
    required this.iconColor,
  });

  final bool recording;
  final VoidCallback onTap;
  final Color background;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(
            recording ? Icons.stop : Icons.mic,
            size: 18,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}

class _Waveform extends StatefulWidget {
  const _Waveform();

  @override
  State<_Waveform> createState() => _WaveformState();
}

class _WaveformState extends State<_Waveform>
    with SingleTickerProviderStateMixin {
  static const List<double> _maxHeights = [
    6, 12, 4, 14, 8, 10, 4, 12, 6, 14,
    8, 6, 10, 14, 8, 4, 12, 6, 10, 14,
  ];

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _factorFor(int i) {
    final phase = (_controller.value + i * 0.05) % 1.0;
    return 0.3 + 0.7 * math.sin(phase * math.pi).abs();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_maxHeights.length, (i) {
          final height = _maxHeights[i] * _factorFor(i);
          return Padding(
            padding: EdgeInsets.only(
              right: i < _maxHeights.length - 1 ? 2 : 0,
            ),
            child: Container(
              width: 2,
              height: height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          );
        }),
      ),
    );
  }
}
