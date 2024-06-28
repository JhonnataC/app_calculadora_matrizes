import 'package:flutter/material.dart';

class MeasurementsMatrixInputs extends StatefulWidget {
  const MeasurementsMatrixInputs({super.key});

  @override
  State<MeasurementsMatrixInputs> createState() =>
      _MeasurementsMatrixInputsState();
}

class _MeasurementsMatrixInputsState extends State<MeasurementsMatrixInputs> {
  int lines = 3;
  int columns = 4;

  final List options = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        Text('Linhas:', style: Theme.of(context).textTheme.bodyMedium),
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
        Text('Colunas:', style: Theme.of(context).textTheme.bodyMedium),
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
    );
  }
}