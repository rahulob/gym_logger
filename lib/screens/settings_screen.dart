import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // TODO: Make a way to store this somewhere
  Set<WeightsUnit> units = {WeightsUnit.kg};
  ThemeMode theme = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Button to change units
              unitsButton(
                context,
                selected: units,
                onChange: (p0) => setState(() => units = p0),
              ),
              const Divider(),
              // Button to change app theme
              themeButton(
                context,
                selected: theme,
                onChange: (p0) => setState(() => theme = p0),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

// Button to change units to kg/lb
enum WeightsUnit { kg, lb }

Widget unitsButton(
  BuildContext context, {
  required Set<WeightsUnit> selected,
  required Function(Set<WeightsUnit>)? onChange,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Units',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      SegmentedButton(
        segments: const [
          ButtonSegment<WeightsUnit>(
            value: WeightsUnit.kg,
            label: Text('kg'),
            icon: Icon(Icons.cancel),
          ),
          ButtonSegment<WeightsUnit>(
            value: WeightsUnit.lb,
            label: Text('lb'),
            icon: Icon(Icons.cancel),
          ),
        ],
        selected: selected,
        onSelectionChanged: onChange,
      ),
    ],
  );
}

// Theme buttons
enum ThemeMode { system, light, dark }

Widget themeButton(
  BuildContext context, {
  required ThemeMode selected,
  required onChange,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'App Theme',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      DropdownButton<ThemeMode>(
        items: const [
          DropdownMenuItem(
            value: ThemeMode.system,
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
            value: ThemeMode.light,
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
            value: ThemeMode.dark,
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
