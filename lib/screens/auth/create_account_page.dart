import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/auth_widgets/email_text_form_field.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/auth_widgets/password_text_form_field.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final emailAddressController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void handleLoginButtonPressed() {
    if (passwordController.text.isEmpty ||
        emailAddressController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Fill out all fields!"));
        },
      );
    } else if (confirmPasswordController.text != passwordController.text) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Passwords do not match!"));
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
      context.go('/home');
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
                  EmailTextFormField(emailAddressController: emailAddressController),
                  const SizedBox(
                    height: AppConstants.bottomPadding,
                  ),
                  PasswordTextFormField(passwordController: passwordController),
                  const SizedBox(
                    height: AppConstants.bottomPadding,
                  ),
                  CustomTextFormField(
                    hintText: 'Confirm Password',
                    isPassword: true,
                    controller: confirmPasswordController,
                  )
                ],
              ),
            ),
            Column(
              children: [
                // TODO: Change to navigate to home page, while saving user info
                // TODO: use user data to validate login
                LoginButton(
                    onPressed: handleLoginButtonPressed, centerText: 'Login'),
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
