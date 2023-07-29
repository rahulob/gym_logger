import 'package:flutter/material.dart';
import 'package:gym_logger/excercise_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gym Logger')),
      body: Center(
        child: Column(
          children: [
            ExcerciseItem(),
            ExcerciseItem(),
            ExcerciseItem(),
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
