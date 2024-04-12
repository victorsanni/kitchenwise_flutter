import 'package:flutter/material.dart';
import 'package:kitchenwise/router.dart';

void main() {
  runApp(const Kitchenwise());
}

class Kitchenwise extends StatelessWidget {
  const Kitchenwise({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: PredictiveBackPageTransitionsBuilder(),
          },
        ),
        hintColor: Colors.black26,
        textTheme: const TextTheme(
          displaySmall:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
          bodyLarge:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w700),
          labelLarge: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 18.0),
          labelMedium: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              fontSize: 15.0),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white60,
          primary: Colors.black45,
          inversePrimary: Colors.black,
          secondary: const Color.fromARGB(255, 180, 124, 28),
          tertiary: Colors.white60,
        ),
        useMaterial3: true,
      ),
    );
  }
}
