import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColors.primary,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  DsAssets.appIcon,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: DsSpacing.xl),
                Text(
                  'VetApp',
                  style: DsTypography.displayLg.copyWith(color: Colors.white),
                ),
                const SizedBox(height: DsSpacing.md),
                Text(
                  'CLÍNICA · HISTORIA · HOSPITAL',
                  style: DsTypography.kicker.copyWith(
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: Center(child: _LoadingDots()),
          ),
        ],
      ),
    );
  }
}

class _LoadingDots extends StatefulWidget {
  const _LoadingDots();

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _Dot(ctrl: _ctrl, interval: const Interval(0, 0.6)),
        const SizedBox(width: DsSpacing.xs),
        _Dot(ctrl: _ctrl, interval: const Interval(0.2, 0.8)),
        const SizedBox(width: DsSpacing.xs),
        _Dot(ctrl: _ctrl, interval: const Interval(0.4, 1)),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.ctrl, required this.interval});

  final AnimationController ctrl;
  final Interval interval;

  @override
  Widget build(BuildContext context) {
    final anim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.3, end: 1), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1, end: 0.3), weight: 1),
    ]).animate(CurvedAnimation(parent: ctrl, curve: interval));

    return FadeTransition(
      opacity: anim,
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
