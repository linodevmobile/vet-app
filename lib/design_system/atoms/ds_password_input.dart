import 'package:flutter/material.dart';

class DsPasswordInput extends StatelessWidget {
  const DsPasswordInput({
    required this.controller,
    this.hint,
    this.validator,
    this.enabled = true,
    super.key,
  });

  final TextEditingController controller;
  final String? hint;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
      obscureText: true,
      autofillHints: const [AutofillHints.password],
      enabled: enabled,
      validator: validator,
    );
  }
}
