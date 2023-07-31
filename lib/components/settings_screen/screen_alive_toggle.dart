import 'package:flutter/material.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';

class ScreenAliveToggle extends StatefulWidget {
  const ScreenAliveToggle(
      {super.key, required this.keepScreenAlive, this.onChange});
  final bool keepScreenAlive;
  final Function(bool)? onChange;

  @override
  State<ScreenAliveToggle> createState() => _ScreenAliveToggleState();
}

class _ScreenAliveToggleState extends State<ScreenAliveToggle> {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText('Alive Screen'),
            SubtitleText('Keep Screen Alive on Home Screen'),
          ],
        ),
        Switch(
          thumbIcon: thumbIcon,
          value: widget.keepScreenAlive,
          onChanged: widget.onChange,
        ),
      ],
    );
  }
}
