import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  const CenterText(this.data, {super.key});

  final String data;
  @override
  Widget build(BuildContext context) {
    return Text(data, textAlign: TextAlign.center);
  }
}
