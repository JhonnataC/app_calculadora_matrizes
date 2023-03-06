import 'package:flutter/material.dart';
import 'Matriz.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<List<double>> matrizEscalonada;
  late double widthBox;

  @override
  Widget build(BuildContext context) {
    matrizEscalonada = Matriz.escalonarMatriz(
      Matriz.criarMatrizDosInputs(Matriz.matrizEstatica.dimensao),
    );

    if (matrizEscalonada[0].length < 10) {
      widthBox = 30;
    } else if (matrizEscalonada[0].length >= 10 &&
        matrizEscalonada[0].length < 20) {
      widthBox = 20;
    } else if (matrizEscalonada[0].length >= 20) {
      widthBox = 15;
    }

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
                              width: widthBox,
                              height: 40,
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
