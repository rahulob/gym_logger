import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';

class ResetToDefault extends StatefulWidget {
  const ResetToDefault({super.key, required this.onTap});
  final Function() onTap;
  @override
  State<ResetToDefault> createState() => _ResetToDefaultState();
}

class _ResetToDefaultState extends State<ResetToDefault> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => reset(context, onReset: widget.onTap),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText('Reset to default'),
              SubtitleText('Reset all settings to default')
            ],
          ),
          Icon(FontAwesomeIcons.rotateRight)
        ],
      ),
    );
  }
}

reset(BuildContext context, {required Function() onReset}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const TitleText('Do you want to reset all settings to default?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const SubtitleText('No'),
        ),
        TextButton(
          onPressed: () {
            onReset();
            Navigator.pop(context);
          },
          child: const SubtitleText('Yes'),
        ),
      ],
    ),
  );
}
