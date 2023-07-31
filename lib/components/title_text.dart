import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.data, {super.key});

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
