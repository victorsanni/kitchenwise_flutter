import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/login_button.dart';
import 'package:kitchenwise/widgets/text_form_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key, this.isValidationCodePage = false});

  final bool isValidationCodePage;

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailAddressController = TextEditingController();
  final validationCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
    validationCodeController.dispose();
  }

  void handleLoginButtonPressed() {
    if (emailAddressController.text.isEmpty &&
        validationCodeController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Fill out all fields!"));
        },
      );
    } else if (!widget.isValidationCodePage &&
        !EmailValidator.validate(emailAddressController.text)) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Email is not correct!"));
        },
      );
    } else {
      widget.isValidationCodePage
          ? context.go(
              '/home') // TODO: check if the validation code is actually correct
          : context.go('/login/forgot_password/validation_page');
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
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppConstants.textFormSidePadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  widget.isValidationCodePage
                      ? CustomTextFormField(
                          hintText: 'Enter validation code',
                          controller: validationCodeController,
                        )
                      : CustomTextFormField(
                          hintText: 'Email address',
                          controller: emailAddressController,
                        ),
                ],
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
