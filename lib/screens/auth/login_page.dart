import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/login_button.dart';
import 'package:kitchenwise/widgets/text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.isCreateAccount = false});
  final bool isCreateAccount;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        emailAddressController.text.isEmpty ||
        (widget.isCreateAccount && confirmPasswordController.text.isEmpty)) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Fill out all fields!"));
        },
      );
    } else if (widget.isCreateAccount &&
        confirmPasswordController.text != passwordController.text) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Passwords do not match!"));
        },
      );
    } else if (widget.isCreateAccount &&
        !EmailValidator.validate(emailAddressController.text)) {
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
                  CustomTextFormField(
                    hintText: 'Email address',
                    controller: emailAddressController,
                  ),
                  const SizedBox(
                    height: AppConstants.bottomPadding,
                  ),
                  CustomTextFormField(
                    hintText: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: AppConstants.bottomPadding,
                  ),
                  widget.isCreateAccount
                      ? CustomTextFormField(
                          hintText: 'Confirm Password',
                          isPassword: true,
                          controller: confirmPasswordController,
                        )
                      : TextButton(
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
