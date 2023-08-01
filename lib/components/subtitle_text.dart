import 'package:flutter/material.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(this.data, {super.key, this.maxLines});

  final String data;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      softWrap: true,
      maxLines: maxLines ?? 50,
    );
  }
}
