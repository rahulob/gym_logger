import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.data, {super.key, this.textSize, this.color});

  final String data;
  final double? textSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: textSize ?? 16,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
