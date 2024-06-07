import 'package:flutter/material.dart';
import 'package:food_app/pages/HomePage.dart';

void main() {
  runApp(const FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(255, 0, 0, 1),
          primary: const Color.fromRGBO(255, 0, 0, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 60,
            height: 0.90,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40,
            height: 0.98,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
