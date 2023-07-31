import 'package:flutter/material.dart';
import 'package:gym_logger/components/settings/app_credits.dart';
import 'package:gym_logger/components/settings/units_change_setting.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';
import 'package:gym_logger/components/settings/weight_increment_setting.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _prefs = Hive.box('settings');
  late String theme = _prefs.get('theme') ?? 'system';
  late double weightIncrement = _prefs.get('increment') ?? 2.5;
  late String units = _prefs.get('units') ?? 'kg';
  late bool keepScreenAlive = _prefs.get('keepScreenAlive') ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Button to change units
            UnitsChangeSetting(
              selected: units,
              onChange: (v) {
                _prefs.put('units', v);
                setState(() => units = v);
              },
            ),
            const Divider(),
            // Button to change app theme
            themeButton(
              selected: theme,
              onChange: (v) {
                _prefs.put('theme', v ?? 'system');
                setState(() => theme = _prefs.get('theme') ?? 'system');
              },
            ),
            const Divider(),
            // Screen on while you are on the home screen
            WeightIncrementSetting(
              weight: weightIncrement,
              units: units,
              onChange: (v) {
                _prefs.put('increment', v);
                setState(() => weightIncrement = v);
              },
            ),
            const Divider(),
            screenAliveToggle(
              keepScreenOn: keepScreenAlive,
              onChange: (v) {
                _prefs.put('keepScreenAlive', v);
                setState(() => keepScreenAlive = v);
              },
            ),
            const Divider(),
            Spacer(),
            const AppCredits(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

// Theme buttons to change app theme
Widget themeButton({
  required String selected,
  required Function(String?)? onChange,
}) {
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
                Icon(Icons.phone_iphone),
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
                Icon(Icons.light_mode),
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
                Icon(Icons.dark_mode),
                SizedBox(width: 10),
                Text('Dark'),
              ],
            ),
          ),
        ],
        value: selected,
        onChanged: onChange,
        underline: Container(),
        focusColor: Colors.transparent,
        icon: const Padding(padding: EdgeInsets.zero),
      ),
    ],
  );
}

// Switch to keep screen alive when on home screen
Widget screenAliveToggle({
  required bool keepScreenOn,
  required Function(bool)? onChange,
}) {
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
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
        value: keepScreenOn,
        onChanged: onChange,
      ),
    ],
  );
}
