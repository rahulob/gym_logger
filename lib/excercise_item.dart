import 'package:flutter/material.dart';

class ExcerciseItem extends StatefulWidget {
  const ExcerciseItem({super.key});

  @override
  State<ExcerciseItem> createState() => _ExcerciseItemState();
}

class _ExcerciseItemState extends State<ExcerciseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      width: double.infinity,
      color: Colors.lightGreen[100],
      // constraints: BoxConstraints,
      child: Column(
        children: [
          Text(
            "Bicep curls",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          //
          const SizedBox(height: 5),
          // Table to show excercise data
          setsTable()
        ],
      ),
    );
  }
}

// TODO: Use proper data for table rows
// Table for the sets information
Table setsTable() {
  return Table(
    border: TableBorder.symmetric(outside: const BorderSide(color: Colors.black)),
    children: [
      // Header row
      TableRow(
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
        children: [
          centerText('Set'),
          centerText('Weight'),
          centerText('Reps'),
        ],
      ),
      // TODO: Fetch sets from data base
      setInfo(index: 1, weights: [100], reps: [12]),
      setInfo(index: 2, weights: [100], reps: [12]),
      setInfo(index: 3, weights: [100, 90], reps: [12, 10]),
    ],
  );
}

// Table row which will show the set's info
TableRow setInfo({
  required int index,
  // Here the List of weight and reps is used for drop sets
  required List<int> weights,
  required List<int> reps,
}) {
  return TableRow(
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: Colors.black)),
    ),
    children: [
      // add set index
      Column(
        children: [
          centerText(index.toString()),
          if (reps.length > 1)
            for (var _ = 1; _ < reps.length; _++)
              const Text(
                'Drop Set',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
        ],
      ),
      // add reps and weights
      Column(
        children: [
          for (int weight in weights) centerText(weight.toString()),
        ],
      ),
      Column(
        children: [
          for (int rep in reps) centerText(rep.toString()),
        ],
      ),
    ],
  );
}

// Text widget with Text Aligned to center
Widget centerText(String data) {
  return Text(
    data,
    textAlign: TextAlign.center,
  );
}
