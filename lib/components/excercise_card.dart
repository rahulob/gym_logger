import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';
import 'package:gym_logger/models/database/excercise_db_model.dart';

import 'package:gym_logger/models/excercise_data_model.dart';
import 'package:gym_logger/screens/create_excercise_screen.dart';

class ExcerciseCard extends StatelessWidget {
  ExcerciseCard({super.key, required this.data, required this.updateParent});
  final ExcerciseData data;
  final _dbModel = ExcerciseDBModel.instance;
  final Function() updateParent;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bottomSheetButton(
                    iconData: FontAwesomeIcons.pencil,
                    title: 'Edit',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateExcerciseScreen(
                          data: data,
                          updateParent: updateParent,
                        ),
                      ),
                    ),
                  ),
                  _bottomSheetButton(
                    iconData: FontAwesomeIcons.solidTrashCan,
                    iconColor: Colors.red,
                    title: 'Delete',
                    onPressed: () {
                      _dbModel.deleteExcerciseData(data.id!);
                      updateParent();
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(data.name),
                  SubtitleText(data.category!.toUpperCase()),
                ],
              ),
              const SizedBox(height: 8),
              SubtitleText(data.description ?? ''),
            ],
          ),
        ),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(data.name),
                  SubtitleText(data.category!.toUpperCase()),
                ],
              ),
              SubtitleText(data.description!, maxLines: 5)
            ],
          ),
        ),
      ),
    );
  }

  _bottomSheetButton({
    required IconData iconData,
    required String title,
    Color? iconColor,
    required Function()? onPressed,
  }) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(iconData, color: iconColor),
      label: TitleText(title),
    );
  }
}
