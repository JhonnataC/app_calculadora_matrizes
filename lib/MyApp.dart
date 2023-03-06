import 'package:flutter/material.dart';
import 'HomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora De Matrizes',
      home: HomePage(),
    );
  }
}
