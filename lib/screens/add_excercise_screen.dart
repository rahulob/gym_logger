import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/center_text.dart';
import 'package:gym_logger/components/excercise_card.dart';
import 'package:gym_logger/models/database/excercise_db_model.dart';
import 'package:gym_logger/models/excercise_data_model.dart';
import 'package:gym_logger/screens/create_excercise_screen.dart';

class AddExcerciseScreen extends StatefulWidget {
  const AddExcerciseScreen({super.key});

  @override
  State<AddExcerciseScreen> createState() => _AddExcerciseScreenState();
}

class _AddExcerciseScreenState extends State<AddExcerciseScreen> {
  final _dbModel = ExcerciseDBModel.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Excercise'),
        actions: _actions(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<ExcerciseData>>(
          future: _dbModel.getExcerciseDataList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final list = snapshot.data;
              if (list!.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CenterText(
                        'It seems like there is no excercise present in the list. Try adding a new excercise in the list.',
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  final ExcerciseData data = list[index];
                  return ExcerciseCard(
                    data: data,
                    updateParent: () => setState(() => {}),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  List<Widget>? _actions() {
    return [
      IconButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateExcerciseScreen(
              updateParent: () => setState(() {}),
            ),
          ),
        ),
        icon: const Icon(FontAwesomeIcons.plus),
      ),
      IconButton(
        onPressed: () {
          // for (var data in defaultExcercises)
          //   _dbModel.insertExcerciseData(data);
          // for (var id = 1; id < 1000; id++) _dbModel.deleteExcerciseData(id);
        },
        icon: const Icon(FontAwesomeIcons.ellipsisVertical),
      ),
    ];
  }
}
