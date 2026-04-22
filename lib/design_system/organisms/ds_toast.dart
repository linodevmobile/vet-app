import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

enum DsToastVariant { success, error }

abstract final class DsToast {
  static const _duration = Duration(seconds: 3);
  static const _animDuration = Duration(milliseconds: 220);
  static const _badgeSize = 32.0;

  static OverlayEntry? _current;

  static void show(
    BuildContext context, {
    required String message,
    required DsToastVariant variant,
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);
    final topInset = MediaQuery.of(context).padding.top;

    _current?.remove();
    _current = null;

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _DsToastOverlay(
        message: message,
        variant: variant,
        topInset: topInset,
        visibleDuration: _duration,
        animDuration: _animDuration,
        onDismissed: () {
          if (identical(_current, entry)) _current = null;
          entry.remove();
        },
      ),
    );
    _current = entry;
    overlay.insert(entry);
  }
}

class _DsToastOverlay extends StatefulWidget {
  const _DsToastOverlay({
    required this.message,
    required this.variant,
    required this.topInset,
    required this.visibleDuration,
    required this.animDuration,
    required this.onDismissed,
  });

  final String message;
  final DsToastVariant variant;
  final double topInset;
  final Duration visibleDuration;
  final Duration animDuration;
  final VoidCallback onDismissed;

  @override
  State<_DsToastOverlay> createState() => _DsToastOverlayState();
}

class _DsToastOverlayState extends State<_DsToastOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  late final Animation<double> _fade;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animDuration,
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, -0.4),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();
    _dismissTimer = Timer(widget.visibleDuration, _dismiss);
  }

  Future<void> _dismiss() async {
    _dismissTimer?.cancel();
    if (!mounted) return;
    await _controller.reverse();
    widget.onDismissed();
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.topInset + DsSpacing.md,
      left: DsSpacing.lg,
      right: DsSpacing.lg,
      child: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: _dismiss,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: DsSpacing.sm,
                  vertical: DsSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: DsColors.ink,
                  borderRadius: BorderRadius.circular(DsRadii.r4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.18),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: _Content(
                  message: widget.message,
                  variant: widget.variant,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({required this.message, required this.variant});

  final String message;
  final DsToastVariant variant;

  Color get _badgeColor => switch (variant) {
        DsToastVariant.success => DsColors.ok,
        DsToastVariant.error => DsColors.urgent,
      };

  IconData get _iconData => switch (variant) {
        DsToastVariant.success => Icons.check_rounded,
        DsToastVariant.error => Icons.warning_amber_rounded,
      };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: DsToast._badgeSize,
          height: DsToast._badgeSize,
          decoration: BoxDecoration(color: _badgeColor, shape: BoxShape.circle),
          child: Icon(_iconData, color: Colors.white, size: 18),
        ),
        const SizedBox(width: DsSpacing.md),
        Flexible(
          child: Text(
            message,
            style: DsTypography.bodyMd.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
