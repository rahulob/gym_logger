import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_logger/components/title_text.dart';
import 'package:gym_logger/screens/calendar_screen.dart';
import 'package:gym_logger/screens/settings_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Gym Logger'),
        actions: homeActions(context),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // controller for changing day
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.chevronLeft),
                  ),
                  // TODO: Create dynamic date here
                  const TitleText('Today'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.chevronRight),
                  )
                ],
              ),
              // Excercise list
              // TODO: Create dynamic items list
              // const ExcerciseItem(name: 'Bicep Curls'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var prefs = Hive.box('settings');
          prefs.putAll({'increment': 2.5});
        },
        label: const Text('Add Excercise'),
      ),
    );
  }
}

// Settings button on home screen
List<Widget> homeActions(context) {
  return [
    IconButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalendarScreen()),
      ),
      icon: const Icon(
        FontAwesomeIcons.calendar,
      ),
    ),
    IconButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      ),
      icon: const Icon(
        FontAwesomeIcons.gear,
      ),
    ),
  ];
}
