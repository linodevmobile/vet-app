import 'package:flutter/material.dart';
import 'package:vet_app/app/shared/utils/duration_formatters.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/consultation/presentation/controllers/consultation_recorder_state.dart';

class ConsultationAiBar extends StatelessWidget {
  const ConsultationAiBar({
    required this.state,
    required this.sectionLabel,
    required this.onToggle,
    required this.onDiscard,
    super.key,
  });

  final ConsultationRecorderState state;
  final String sectionLabel;
  final VoidCallback onToggle;
  final VoidCallback onDiscard;

  static const Color _bg = Color(0xFF1A1915);
  static const Color _sparkleIdle = Color(0xFFE6D9B1);

  @override
  Widget build(BuildContext context) {
    final isRecording = state is RecorderRecording;
    final isUploading = state is RecorderUploading;

    final borderColor = isRecording
        ? DsColors.urgent
        : Colors.white.withValues(alpha: 0.15);
    final sparkleColor = isRecording ? DsColors.urgent : _sparkleIdle;

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
            if (isRecording)
              _DiscardButton(onTap: onDiscard)
            else
              Icon(Icons.auto_awesome, size: 14, color: sparkleColor),
            const SizedBox(width: 10),
            Expanded(
              child: _Content(state: state, sectionLabel: sectionLabel),
            ),
            const SizedBox(width: 10),
            _MicButton(
              state: state,
              onTap: isUploading ? null : onToggle,
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.state, required this.sectionLabel});

  final ConsultationRecorderState state;
  final String sectionLabel;

  @override
  Widget build(BuildContext context) {
    final kicker = switch (state) {
      RecorderIdle() => 'DICTAR A',
      RecorderRecording() => 'ESCUCHANDO…',
      RecorderUploading() => 'PROCESANDO…',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          kicker,
          style: DsTypography.mono.copyWith(
            fontSize: 10,
            color: Colors.white.withValues(alpha: 0.5),
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(height: 18, child: _body(state, sectionLabel)),
      ],
    );
  }

  Widget _body(ConsultationRecorderState s, String sectionLabel) {
    return switch (s) {
      RecorderIdle() => _label(sectionLabel),
      RecorderRecording(:final elapsed, :final amplitude) => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LiveWaveform(amplitude: amplitude),
            const SizedBox(width: 8),
            Text(
              DurationFormatters.mmss(elapsed),
              style: DsTypography.mono.copyWith(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      RecorderUploading(:final section) => _label(section.title),
    };
  }

  Widget _label(String text) => Text(
        text,
        style: DsTypography.bodyMd.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
}

class _MicButton extends StatelessWidget {
  const _MicButton({required this.state, required this.onTap});

  final ConsultationRecorderState state;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final (background, iconColor) = switch (state) {
      RecorderRecording() => (DsColors.urgent, Colors.white),
      RecorderUploading() => (
          Colors.white.withValues(alpha: 0.2),
          Colors.white,
        ),
      RecorderIdle() => (Colors.white, DsColors.ink),
    };

    return Material(
      color: background,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Center(child: _icon(state, iconColor)),
        ),
      ),
    );
  }

  Widget _icon(ConsultationRecorderState s, Color color) {
    return switch (s) {
      RecorderIdle() => Icon(Icons.mic, size: 18, color: color),
      RecorderRecording() => Icon(Icons.stop, size: 18, color: color),
      RecorderUploading() => SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
    };
  }
}

class _DiscardButton extends StatelessWidget {
  const _DiscardButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 18,
      child: Icon(
        Icons.delete_outline,
        size: 18,
        color: Colors.white.withValues(alpha: 0.7),
      ),
    );
  }
}

class _LiveWaveform extends StatefulWidget {
  const _LiveWaveform({required this.amplitude});

  final double amplitude;

  @override
  State<_LiveWaveform> createState() => _LiveWaveformState();
}

class _LiveWaveformState extends State<_LiveWaveform> {
  static const int _bars = 20;
  static const double _minHeight = 2;
  static const double _maxHeight = 14;

  final List<double> _history = List<double>.filled(_bars, 0, growable: true);

  @override
  void didUpdateWidget(_LiveWaveform oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.amplitude != oldWidget.amplitude) {
      setState(() {
        _history
          ..removeAt(0)
          ..add(widget.amplitude);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_bars, (i) {
        final height = _minHeight + _history[i] * (_maxHeight - _minHeight);
        return Padding(
          padding: EdgeInsets.only(right: i < _bars - 1 ? 2 : 0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            width: 2,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        );
      }),
    );
  }
}
