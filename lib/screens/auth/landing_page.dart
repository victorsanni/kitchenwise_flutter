import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kitchenwise/constants.dart';
import 'package:kitchenwise/widgets/auth_widgets/login_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: AppConstants.sidePadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Kitchenwise.',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(
                      height: AppConstants.textPadding,
                    ),
                    Text(
                      'The Future of Cooking. Powered by Alexa',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  LoginButton(
                    onPressed: () => context.go('/login'),
                    centerText: 'Login',
                  ),
                  LoginButton(
                    onPressed: () => context.go('/create_account'),
                    centerText: 'Create New Account',
                    isOutlineButton: true,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
