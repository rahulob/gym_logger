import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';

class UnitsChangeSetting extends StatefulWidget {
  const UnitsChangeSetting(
      {super.key, required this.selected, required this.onChange});

  final String selected;
  final Function(String) onChange;
  @override
  State<UnitsChangeSetting> createState() => _UnitsChangeSettingState();
}

// Button to change units to kg/lb
class _UnitsChangeSettingState extends State<UnitsChangeSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText('Units'),
            SubtitleText('Metric to imperial units'),
          ],
        ),
        SegmentedButton<String>(
          segments: const [
            ButtonSegment<String>(
              value: 'kg',
              label: Text('kg'),
              icon: Icon(FontAwesomeIcons.xmark),
            ),
            ButtonSegment<String>(
              value: 'lb',
              label: Text('lb'),
              icon: Icon(FontAwesomeIcons.xmark),
            ),
          ],
          selected: {widget.selected},
          onSelectionChanged: (_) => widget.onChange(_.first),
        ),
      ],
    );
  }
}
