import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';
import 'package:kitchenwise/widgets/custom_text_form_field.dart';

class ValidationCodePage extends StatefulWidget {
  const ValidationCodePage({super.key});

  @override
  State<ValidationCodePage> createState() => _ValidationCodePageState();
}

class _ValidationCodePageState extends State<ValidationCodePage> {
  final validationCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    validationCodeController.dispose();
  }

  void handleLoginButtonPressed() {
    if (validationCodeController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const CupertinoAlertDialog(
              title: Text("Fill out all fields!"));
        },
      );
    } else {
      context.go(
          '/home'); // TODO: check if the validation code is actually correct
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
                    hintText: 'Enter validation code',
                    controller: validationCodeController,
                    keyboardType: TextInputType.number,
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
