import 'package:flutter/material.dart';
import 'package:kitchenwise/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppConstants.sidePadding,
                  vertical: AppConstants.topPadding),
              child: Column(
                children: [
                  Text(
                    'Welcome Victor!', // TODO: Replace with username in login
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Shopping List',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'About',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Settings',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Log out',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ))
                ],
              ))),
    );
  }
}
