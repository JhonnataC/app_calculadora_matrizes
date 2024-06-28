import 'package:app_calculadora_matrizes/src/screens/calculate_screen.dart';
import 'package:flutter/material.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    if (_currentPageIndex == 0) {
      page = const CalculatorScreen();
    } else if (_currentPageIndex == 1) {
      page = const InfoScreen();
    } else {
      throw UnimplementedError('no widget for $_currentPageIndex');
    }

    return Scaffold(
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        backgroundColor: Colors.black87,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate_outlined,
            ),
            activeIcon: Icon(Icons.calculate_rounded),
            label: 'Calcule',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info_outline,
            ),
            activeIcon: Icon(Icons.info),
            label: 'Sobre',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
    );
  }
}
