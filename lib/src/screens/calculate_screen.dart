import 'package:flutter/material.dart';
import '../controllers/matriz.dart';
import 'result_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int lines = 3;
  int columns = 4;

  final List options = [2, 3, 4, 5, 6, 7];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.calculate),
          ),
        ],
        title: const Text(
          'Calculadora de Matrizes',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text('Linhas:',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 10),
                    DropdownButton<int>(
                      value: lines,
                      onChanged: (value) {
                        setState(() => lines = value ?? 3);
                      },
                      items: options.map((value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Colunas:',
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(width: 10),
                    DropdownButton<int>(
                      value: columns,
                      onChanged: (value) {
                        setState(() => columns = value ?? 3);
                      },
                      items: options.map((value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Matriz.inputsMatriz(lines, columns),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ResultScreen(),
                  ),
                );
              },
              child: const Text(
                'Ver resposta',
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
