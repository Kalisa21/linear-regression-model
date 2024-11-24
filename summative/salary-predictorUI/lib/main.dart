import 'package:flutter/material.dart';
import 'welcomescreen.dart'; // Import the WelcomeScreen file
import 'predictscreen.dart'; // Import the PredictScreen file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set WelcomeScreen as the initial screen
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/predict': (context) => const PredictScreen(),
      },
    );
  }
}
