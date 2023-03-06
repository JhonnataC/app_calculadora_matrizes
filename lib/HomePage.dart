import 'package:app_calculadora_matrizes/CalculatePage.dart';
import 'package:flutter/material.dart';

import 'SobrePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    if (_currentPageIndex == 0) {
      page = const CalculatePage();
    } else if (_currentPageIndex == 1) {
      page = const SobrePage();
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
