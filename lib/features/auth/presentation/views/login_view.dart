import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vet_app/core/validations/core_validation_service.dart';
import 'package:vet_app/design_system/atoms/ds_password_input.dart';
import 'package:vet_app/design_system/atoms/ds_primary_button.dart';
import 'package:vet_app/design_system/atoms/ds_text_input.dart';
import 'package:vet_app/design_system/molecules/ds_field_label.dart';
import 'package:vet_app/design_system/tokens/ds_spacing.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ref.read(loginActionProvider.notifier).submit(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(loginActionProvider, (prev, next) {
      next.whenOrNull(
        error: (e, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$e')),
        ),
      );
    });

    final isLoading = ref.watch(loginActionProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Ingresar')),
      body: Padding(
        padding: const EdgeInsets.all(DsSpacing.xxl),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DsFieldLabel(
                label: 'Email',
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
                  validator: (v) => CoreValidationService.validateMinLength(
                    v,
                    6,
                    fieldName: 'Contraseña',
                  ),
                  enabled: !isLoading,
                ),
              ),
              const SizedBox(height: DsSpacing.section),
              DsPrimaryButton(
                label: 'Ingresar',
                isLoading: isLoading,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
