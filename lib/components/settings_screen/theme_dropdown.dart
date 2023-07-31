import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';

class ThemeDropdown extends StatefulWidget {
  const ThemeDropdown({super.key, required this.selected, this.onChange});
  final String selected;
  final Function(String?)? onChange;
  @override
  State<ThemeDropdown> createState() => _ThemeDropdownState();
}

class _ThemeDropdownState extends State<ThemeDropdown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText('Theme'),
            SubtitleText('Change app theme'),
          ],
        ),
        DropdownButton<String>(
          items: const [
            DropdownMenuItem(
              value: 'system',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.mobileScreenButton),
                  SizedBox(width: 10),
                  Text('System'),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 'light',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.solidLightbulb),
                  SizedBox(width: 10),
                  Text('Light'),
                ],
              ),
            ),
            DropdownMenuItem(
              value: 'dark',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.solidMoon),
                  SizedBox(width: 10),
                  Text('Dark'),
                ],
              ),
            ),
          ],
          value: widget.selected,
          onChanged: widget.onChange,
          underline: Container(),
          focusColor: Colors.transparent,
          icon: const Padding(padding: EdgeInsets.zero),
        ),
      ],
    );
  }
}
