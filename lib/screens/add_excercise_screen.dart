import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/center_text.dart';
import 'package:gym_logger/components/excercise_card.dart';
import 'package:gym_logger/components/routines.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Excercise'),
          actions: _actions(),
          bottom: const TabBar(
            tabs: [
              TitleText('All Excercises'),
              TitleText('Routines'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TabBarView(
            children: [
              _body(),
              const Routines(),
            ],
          ),
        ),
      ),
    );
  }

  // Future builder for the body
  _body() {
    return FutureBuilder<List<ExcerciseData>>(
      future: _dbModel.getExcerciseDataList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final list = snapshot.data;
          if (list!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CenterText(
                    'It seems like there is no excercise present in this list. Try adding a new excercise in the list.',
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: _addDefaultExcercises,
                        child: const Text('Add defaults'),
                      ),
                      FilledButton(
                        onPressed: _createExcerciseScreen,
                        child: const Text('Create Excercise'),
                      ),
                    ],
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
    );
  }

  // Actions present in the app bar
  List<Widget>? _actions() {
    return [
      IconButton(
        onPressed: _createExcerciseScreen,
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

  // push to create excercise screen
  void _createExcerciseScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateExcerciseScreen(
          updateParent: () => setState(() {}),
        ),
      ),
    );
  }

  // add my favorite excercises to the empty list
  _addDefaultExcercises() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const TitleText('Are you sure?'),
        content: const SubtitleText(
          'This will add the favourite excercises of the developer to the list.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              for (var data in defaultExcercises) {
                _dbModel.insertExcerciseData(data);
              }
              setState(() {});
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }
}
