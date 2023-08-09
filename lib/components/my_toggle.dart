import 'package:flutter/material.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';

class MyToggle extends StatelessWidget {
  const MyToggle({
    super.key,
    required this.value,
    required this.onChange,
    required this.title,
    required this.subTitle,
  });
  final bool value;
  final String title;
  final String subTitle;
  final Function(bool)? onChange;

  // final MaterialStateProperty<Icon?> thumbIcon =
  //     MaterialStateProperty.resolveWith<Icon?>(
  //   (Set<MaterialState> states) {
  //     if (states.contains(MaterialState.selected)) {
  //       return const Icon(Icons.check);
  //     }
  //     return const Icon(Icons.close);
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(title),
            SubtitleText(subTitle),
          ],
        ),
        Switch(
          // thumbIcon: thumbIcon,
          value: value,
          onChanged: onChange,
        ),
      ],
    );
  }
}
