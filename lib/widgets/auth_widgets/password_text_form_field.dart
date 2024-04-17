
import 'package:flutter/material.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Password',
      isPassword: true,
      controller: passwordController,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.text,
    );
  }
}
