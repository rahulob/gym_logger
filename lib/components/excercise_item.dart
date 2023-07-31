import 'package:flutter/material.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';
import 'package:gym_logger/screens/excercise_screen.dart';

class ExcerciseItem extends StatefulWidget {
  const ExcerciseItem({super.key, required this.name});

  final String name;
  @override
  State<ExcerciseItem> createState() => _ExcerciseItemState();
}

class _ExcerciseItemState extends State<ExcerciseItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ExcerciseScreen(name: widget.name)),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
        decoration: BoxDecoration(border: Border.all(color: Colors.green)),
        width: double.infinity,
        // color: Colors.lightGreen[100],
        // constraints: BoxConstraints,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Excercise Name
            //
            Image.network(
              'https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_92x30dp.png',
              width: 60,
              height: 60,
            ),

            // Table to show excercise data
            Column(
              children: [
                Text(
                  widget.name,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 5),
                setsTable(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// TODO: Use proper data for table rows
// Table for the sets information
Table setsTable() {
  return Table(
    columnWidths: const <int, TableColumnWidth>{
      0: IntrinsicColumnWidth(flex: 1),
      1: FixedColumnWidth(120)
    },
    border:
        TableBorder.symmetric(outside: const BorderSide(color: Colors.black)),
    children: [
      // Header row
      TableRow(
        decoration: BoxDecoration(
          color: Colors.green[800],
        ),
        children: [
          centerText('Set'),
          centerText('Weight X reps'),
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
          TitleText(index.toString()),
          if (reps.length > 1)
            for (var _ = 1; _ < reps.length; _++) const SubtitleText('Drop Set')
        ],
      ),
      // add reps and weights
      Column(
        children: [
          for (int i = 0; i < weights.length; i++)
            TitleText('${weights[i]} kg X ${reps[i]}'),
        ],
      )
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
