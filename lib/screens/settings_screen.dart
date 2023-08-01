import 'package:flutter/material.dart';
import 'package:gym_logger/components/screen.dart';
import 'package:gym_logger/components/settings_screen/app_credits.dart';
import 'package:gym_logger/components/settings_screen/reset_to_default.dart';
import 'package:gym_logger/components/settings_screen/screen_alive_toggle.dart';
import 'package:gym_logger/components/settings_screen/theme_dropdown.dart';
import 'package:gym_logger/components/settings_screen/units_change_setting.dart';
import 'package:gym_logger/components/settings_screen/weight_increment_setting.dart';
import 'package:gym_logger/models/preferences_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _prefs = Preferences();

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _prefs.listenable(),
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Button to change units
              UnitsChangeSetting(
                selected: _prefs.getUnits(),
                onChange: (v) => _prefs.setUnits(v),
              ),
              const Divider(),
              // Button to change app theme
              ThemeDropdown(
                selected: _prefs.getTheme(),
                onChange: (v) => _prefs.setTheme(v),
              ),
              const Divider(),
              // Screen on while you are on the home screen
              WeightIncrementSetting(
                weight: _prefs.getIncrementWeight(),
                units: _prefs.getUnits(),
                onChange: (v) => _prefs.setIncrementWeight(v),
              ),
              const Divider(),
              ScreenAliveToggle(
                keepScreenAlive: _prefs.getKeepScreenAlive(),
                onChange: (v) => _prefs.setKeepScreenAlive(v),
              ),
              const Divider(),
              ResetToDefault(
                onTap: () => _prefs.resetPreferences(),
              ),
              const Divider(),
              const AppCredits(),
            ],
          ),
        ),
      ),
    );
  }
}
