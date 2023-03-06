import 'package:flutter/material.dart';
import 'Matriz.dart';
import 'ResultPage.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  int numLinhas = 3;
  int numColunas = 4;
  final linhasFieldController = TextEditingController();
  final colunasFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: linhasFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Linhas',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: colunasFieldController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Colunas',
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  onPressed: () {
                    setState(() {
                      try {
                        numLinhas = int.parse(linhasFieldController.text);
                        numColunas = int.parse(colunasFieldController.text);
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Atenção'),
                              content: const Text('Preencha todos os campos!'),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Fechar'),
                                )
                              ],
                            );
                          },
                        );
                        linhasFieldController.clear();
                        colunasFieldController.clear();
                      }
                    });
                  },
                  child: const Text('Ok'),
                ),
                // Inputs da matriz
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Matriz.inputsMatriz(numLinhas, numColunas),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ResultPage(),
                      ),
                    );
                  },
                  child: const Text('Ver resposta'),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Aviso: não deixe nenhum dos campos da matriz em branco.',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
