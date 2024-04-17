import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/login_button.dart';
import 'package:kitchenwise/widgets/text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailAddressController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
  }

  void handleLoginButtonPressed() {
    if (emailAddressController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Fill out all fields!"));
        },
      );
    } else if (!EmailValidator.validate(emailAddressController.text)) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Email is not correct!"));
        },
      );
    } else {
      context.go('/login/forgot_password/validation_page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.symmetric(
                  horizontal: AppConstants.headerPadding),
              child: Text(
                'kitchenwise.',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            AutofillGroup(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: AppConstants.textFormSidePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomTextFormField(
                      hintText: 'Email address',
                      controller: emailAddressController,
                      autofillHints: const [AutofillHints.email],
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                LoginButton(
                    onPressed: handleLoginButtonPressed,
                    centerText: 'Continue'),
                LoginButton(
                  onPressed: () => context.go('/'),
                  centerText: 'Cancel',
                  isOutlineButton: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
