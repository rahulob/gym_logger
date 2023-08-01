import 'package:flutter/material.dart';
import 'package:gym_logger/components/center_text.dart';
import 'package:gym_logger/components/screen.dart';

class ExcerciseScreen extends StatefulWidget {
  const ExcerciseScreen({super.key, required this.name});

  final String name;
  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: IntrinsicColumnWidth(flex: 0.3),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        border: TableBorder.all(color: Colors.white),
        children: [
          headerRow(),
          const TableRow(
            children: [
              CenterText('1'),
              CenterText('100 Kg'),
              CenterText('10'),
            ],
          ),
        ],
      ),
    );
  }
}

TableRow headerRow() {
  return const TableRow(
    children: [
      CenterText('SET'),
      CenterText('WEIGHT'),
      CenterText('REPS'),
    ],
  );
}
