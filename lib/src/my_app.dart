import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora De Matrizes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: ThemeData().appBarTheme.copyWith(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          bodyMedium: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.black,
          secondary: Colors.white,
        )
      ),
      home: const HomeScreen(),
    );
  }
}
