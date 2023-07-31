import 'package:flutter/material.dart';
import 'package:gym_logger/components/subtitle_text.dart';
import 'package:gym_logger/components/title_text.dart';

class WeightIncrementSetting extends StatefulWidget {
  const WeightIncrementSetting({
    super.key,
    required this.weight,
    required this.units,
    required this.onChange,
  });
  final double weight;
  final String units;
  final Function(double) onChange;
  @override
  State<WeightIncrementSetting> createState() => _WeightIncrementSettingState();
}

class _WeightIncrementSettingState extends State<WeightIncrementSetting> {
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openDialog(context, error, widget.onChange),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText('Weight Increment'),
              SubtitleText('Default weight to increase/decrease'),
            ],
          ),
          TitleText('${widget.weight} ${widget.units}'),
        ],
      ),
    );
  }
}

openDialog(context, bool validate, Function(double) onChange) {
  String value = '';
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const TitleText('Default weight to increase or decrease'),
      content: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        autofocus: true,
        validator: (value) {
          if (double.tryParse(value ?? '') == null) {
            return 'validate_validate Message';
          }
          return null;
        },
        decoration: InputDecoration(
          errorText: validate ? 'Invalid input' : null,
        ),
        onChanged: (v) => value = v,
        onFieldSubmitted: (_) => submit(context, value, onChange),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const SubtitleText('Cancel'),
        ),
        TextButton(
          onPressed: () => submit(context, value, onChange),
          child: const SubtitleText('Done'),
        ),
      ],
    ),
  );
}

void submit(context, value, onChange) {
  if (double.tryParse(value) != null) {
    onChange(double.parse(value));
    Navigator.pop(context);
  }
}
