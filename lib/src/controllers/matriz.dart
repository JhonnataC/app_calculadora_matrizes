import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Matriz {
  List<List<double>> dimensao = [];
  List<List<TextEditingController>> listaInputsControllers = [];

  static Matriz matrizEstatica = Matriz();

  // Monta a matriz com as dimensões informadas no número de linhas e colunas
  void _criarMatriz(int numLinhas, int numColunas) {
    for (int i = 0; i < numLinhas; i++) {
      dimensao.add(List<double>.filled(numColunas, 0));
    }
  }

  // Cria uma matriz de controllers com as dimenções informadas no número de linhas de colunas
  void _montarListaInputsControllers(int numLinhas, int numColunas) {
    for (int i = 0; i < numLinhas; i++) {
      listaInputsControllers.add(List<TextEditingController>.filled(
          numColunas, TextEditingController()));
    }
    _criarListaInputsControllers(numLinhas, numColunas);
  }

  // Com a matriz de controllers já montada, agora inicia eles
  void _criarListaInputsControllers(int numLinhas, int numColunas) {
    for (int i = 0; i < numLinhas; i++) {
      for (int j = 0; j < numColunas; j++) {
        listaInputsControllers[i][j] = TextEditingController();
      }
    }
  }

  // Cria a matriz vinda dos inputs, para que possa ser escalonada
  static List<List<double>> criarMatrizDosInputs(List<List<double>> matriz) {
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[0].length; j++) {
        matriz[i][j] =
            double.parse(matrizEstatica.listaInputsControllers[i][j].text);
      }
    }
    return matriz;
  }

  // Método que desencadeia todos os outros
  static Widget inputsMatriz(int numLinhas, int numColunas) {
    late Widget inputs;
    late double widthBox;

    Matriz matriz = Matriz();
    matriz._criarMatriz(numLinhas, numColunas);
    matriz._montarListaInputsControllers(numLinhas, numColunas);

    matrizEstatica = matriz;

    if (numColunas < 10) {
      widthBox = 20;
    } else if (numColunas >= 10 && numColunas < 20) {
      widthBox = 15;
    } else if (numColunas >= 20) {
      widthBox = 10;
    }

    inputs = Column(
      children: [
        for (int i = 0; i < numLinhas; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int j = 0; j < numColunas; j++)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SizedBox(
                        width: 45,
                        height: 45,
                        child: TextField(
                          controller: matriz.listaInputsControllers[i][j],
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            counterText: '',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
      ],
    );
    return inputs;
  }

  static List<List<double>> escalonarMatriz(List<List<double>> matriz) {
    int n = matriz.length;
    int m = matriz[0].length;
    for (int i = 0; i < n; i++) {
      double pivo = matriz[i][i];
      if (pivo == 0) {
        for (int j = i + 1; j < n; j++) {
          if (matriz[j][i] != 0) {
            List<double> temp = matriz[i];
            matriz[i] = matriz[j];
            matriz[j] = temp;
            break;
          }
        }
        pivo = matriz[i][i];
      }
      for (int j = i; j < m; j++) {
        matriz[i][j] /= pivo;
      }
      for (int j = i + 1; j < n; j++) {
        double fator = matriz[j][i];
        for (int k = i; k < m; k++) {
          matriz[j][k] -= fator * matriz[i][k];
        }
      }
    }
    return matriz;
  }
}
