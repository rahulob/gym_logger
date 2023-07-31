import 'package:flutter/material.dart';
import 'package:gym_logger/components/excercise_item.dart';
import 'package:gym_logger/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym Logger'),
        actions: homeActions(context),
      ),
      body: const Center(
        child: Column(
          children: [
            ExcerciseItem(name: 'Bicep Curls'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
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
        MaterialPageRoute(builder: (context) => const SettingsScreen()),
      ),
      icon: const Icon(Icons.settings),
    )
  ];
}
