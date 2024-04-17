
import 'package:flutter/material.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    super.key,
    required this.emailAddressController,
  });

  final TextEditingController emailAddressController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'Email address',
      controller: emailAddressController,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
    );
  }
}
