import 'package:flutter/material.dart';
import '../controllers/matriz.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late List<List<double>> matrizEscalonada;

  @override
  Widget build(BuildContext context) {
    matrizEscalonada = Matriz.escalonarMatriz(
      Matriz.criarMatrizDosInputs(Matriz.matrizEstatica.dimensao),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.fact_check),
          ),
        ],
        title: const Text('Resultado'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < matrizEscalonada.length; i++)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int j = 0; j < matrizEscalonada[0].length; j++)
                        Column(
                          children: [
                            SizedBox(
                              width: 35,
                              height: 35,
                              child: Text(
                                matrizEscalonada[i][j].toStringAsFixed(1),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
