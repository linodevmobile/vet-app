import 'package:flutter/material.dart';

class DsPasswordInput extends StatefulWidget {
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
  State<DsPasswordInput> createState() => _DsPasswordInputState();
}

class _DsPasswordInputState extends State<DsPasswordInput> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        suffixIcon: IconButton(
          onPressed: widget.enabled
              ? () => setState(() => _obscure = !_obscure)
              : null,
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
          tooltip: _obscure ? 'Mostrar contraseña' : 'Ocultar contraseña',
        ),
      ),
      obscureText: _obscure,
      autofillHints: const [AutofillHints.password],
      enabled: widget.enabled,
      validator: widget.validator,
    );
  }
}
