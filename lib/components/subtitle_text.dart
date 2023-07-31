import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(this.data, {super.key});

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      softWrap: true,
      style: const TextStyle(
        fontSize: 12,
        // fontWeight: FontWeight.w600,
      ),
    );
  }
}
