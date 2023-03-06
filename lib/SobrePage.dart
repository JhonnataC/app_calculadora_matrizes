import 'package:flutter/material.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({super.key});

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.info),
          ),
        ],
        title: const Text('Sobre'),
      ),
      body: Column(
        children: const [
          Text(
            '\nSeja Bem-Vindo à Calculadora de Matrizes',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              ' A Calculadora de Matrizes foi criada com o objetivo de trazer a facilidade da cola na hora da prova para a palma da sua mão. Com ela você pode obter a resposta da sua questão sobre matrizes de maneira rápida! \nDesenvolvido por: Jhonnata Carvalho.\nCurso: Sistemas De Informação.\nDisciplina: Álgebra Linear.\nProfessor: Rafael Barbosa da Silva',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
