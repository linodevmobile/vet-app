import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/core/validations/core_validation_service.dart';
import 'package:vet_app/design_system/atoms/ds_password_input.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/molecules/ds_app_mark.dart';
import 'package:vet_app/design_system/molecules/ds_field_label.dart';
import 'package:vet_app/design_system/organisms/ds_toast.dart';
import 'package:vet_app/design_system/tokens/tokens.dart';
import 'package:vet_app/features/auth/presentation/controllers/login_action.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ref
        .read(loginActionProvider.notifier)
        .submit(email: _emailController.text.trim(), password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(loginActionProvider, (prev, next) {
      next.whenOrNull(
        error: (e, _) => DsToast.show(
          context,
          message: '$e',
          variant: DsToastVariant.error,
        ),
      );
    });

    final isLoading = ref.watch(loginActionProvider).isLoading;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(DsSpacing.xxl),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                const Align(alignment: Alignment.centerLeft, child: DsAppMark()),
                const SizedBox(height: DsSpacing.section),
                Text('Hola de nuevo.', style: DsTypography.displayLg),
                const SizedBox(height: DsSpacing.sm),
                Text(
                  'Accede con tus credenciales profesionales.',
                  style: DsTypography.bodyMd.copyWith(color: DsColors.ink60),
                ),
                const SizedBox(height: DsSpacing.xxl),
                DsFieldLabel(
                  label: 'Correo profesional',
                  child: DsTextInput(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    validator: CoreValidationService.validateEmail,
                    enabled: !isLoading,
                  ),
                ),
                const SizedBox(height: DsSpacing.lg),
                DsFieldLabel(
                  label: 'Contraseña',
                  child: DsPasswordInput(
                    controller: _passwordController,
                    validator: (v) => CoreValidationService.validateMinLength(v, 6, fieldName: 'Contraseña'),
                    enabled: !isLoading,
                  ),
                ),
                const SizedBox(height: DsSpacing.md),
                _RememberRow(
                  value: _rememberMe,
                  enabled: !isLoading,
                  onChanged: (v) => setState(() => _rememberMe = v ?? false),
                  onForgot: () {},
                ),
                const Spacer(),
                DsPrimaryButton(
                  label: 'Entrar',
                  isLoading: isLoading,
                  onPressed: _submit,
                  icon: const Icon(Icons.arrow_forward, size: 18),
                ),
                        const SizedBox(height: DsSpacing.md),
                        _SignupFooter(onTap: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RememberRow extends StatelessWidget {
  const _RememberRow({required this.value, required this.enabled, required this.onChanged, required this.onForgot});

  final bool value;
  final bool enabled;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onForgot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: enabled ? onChanged : null,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
        const SizedBox(width: DsSpacing.sm),
        Text('Mantener sesión', style: DsTypography.bodyMd.copyWith(color: DsColors.ink60)),
        const Spacer(),
        TextButton(onPressed: enabled ? onForgot : null, child: const Text('¿Olvidaste?')),
      ],
    );
  }
}

class _SignupFooter extends StatelessWidget {
  const _SignupFooter({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          style: DsTypography.bodyMd.copyWith(color: DsColors.ink60),
          children: [
            const TextSpan(text: '¿Nuevo en la clínica? '),
            TextSpan(
              text: 'Solicita acceso',
              style: TextStyle(color: DsColors.primary, fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
