import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/auth_widgets/email_text_form_field.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/auth_widgets/password_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailAddressController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
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
            AutofillGroup(
              child: Container(
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
                    TextButton(
                      onPressed: () {
                        context.go('/login/forgot_password');
                      },
                      child: Text(
                        'Forgot Password? Click here to reset',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
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
