import 'package:flutter/material.dart';

class DsTextInput extends StatelessWidget {
  const DsTextInput({
    required this.controller,
    this.hint,
    this.validator,
    this.keyboardType,
    this.autofillHints,
    this.enabled = true,
    super.key,
  });

  final TextEditingController controller;
  final String? hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hint),
      keyboardType: keyboardType,
      autofillHints: autofillHints,
      enabled: enabled,
      validator: validator,
    );
  }
}
