import 'package:flutter/material.dart';

import '../constants.dart';

class LoginButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String centerText;
  final bool isOutlineButton;

  const LoginButton(
      {super.key,
      required this.onPressed,
      required this.centerText,
      this.isOutlineButton = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: AppConstants.buttonHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).buttonTheme.colorScheme!.inversePrimary,
            width: AppConstants.buttonBorderThickness,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(AppConstants.buttonRadius)),
          color: isOutlineButton
              ? Colors.transparent
              : Theme.of(context).buttonTheme.colorScheme?.inversePrimary,
        ),
        child: Center(
          child: Text(
            centerText,
            style: TextStyle(
                color: isOutlineButton
                    ? Theme.of(context).buttonTheme.colorScheme!.inversePrimary
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}
