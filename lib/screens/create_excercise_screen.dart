import 'package:flutter/material.dart';
import 'package:gym_logger/components/screen.dart';
import 'package:gym_logger/models/database/excercise_db_model.dart';
import 'package:gym_logger/models/excercise_data_model.dart';
import 'package:gym_logger/models/preferences_model.dart';

class CreateExcerciseScreen extends StatefulWidget {
  const CreateExcerciseScreen({
    super.key,
    this.data,
    this.updateParent,
  });
  final ExcerciseData? data;
  final Function()? updateParent;
  @override
  State<CreateExcerciseScreen> createState() => _CreateExcerciseScreenState();
}

class _CreateExcerciseScreenState extends State<CreateExcerciseScreen> {
  late final _nameController = TextEditingController(
    text: widget.data?.name,
  );
  late final _desController = TextEditingController(
    text: widget.data?.description,
  );
  late String _category = widget.data?.category ?? 'Other';
  late String _weightType = widget.data?.weightType ?? 'reps';
  late String _weightUnit =
      widget.data?.weightUnits ?? Preferences().getUnits();
  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(title: const Text('Add New Excercise')),
      body: Column(
        children: [
          // name text field of the excercise
          MyTextField(
            hint: "Excercise Name",
            maxLines: 1,
            controller: _nameController,
          ),

          // Description text field of the excercise
          MyTextField(
            hint: "Description",
            maxLines: 5,
            controller: _desController,
          ),

          // Category dropdown
          MyDropDown(
            hint: 'Category',
            list: const [
              'chest',
              'back',
              'biceps',
              'triceps',
              'forearms',
              'legs',
              'core',
              'other',
            ],
            value: _category,
            onChanged: (v) => setState(() => _category = v!),
          ),

          // excercise type dropdown ['reps','time']
          MyDropDown(
            hint: 'Type',
            list: const ['reps', 'time'],
            value: _weightType,
            onChanged: (v) => setState(() => _weightType = v!),
          ),

          // excercise weight units
          MyDropDown(
            hint: 'Units',
            list: const ['kg', 'lb'],
            value: _weightUnit,
            onChanged: (v) => setState(() => _weightUnit = v!),
          ),

          // Save and cancel buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // cancel button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              // save excercise button
              FilledButton(
                onPressed: _onSubmit,
                child: Text(widget.data == null ? 'Create' : 'Save'),
              ),
            ],
          )
        ],
      ),
    );
  }

  _onSubmit() {
    var dbModel = ExcerciseDBModel.instance;
    var data = ExcerciseData(
      id: widget.data!.id,
      name: _nameController.text,
      description: _desController.text,
      category: _category,
      weightType: _weightType,
      weightUnits: _weightUnit,
    );
    // check if to update or insert
    if (widget.data!.id != null) {
      dbModel.updateExcerciseData(data);
      Navigator.pop(context);
    } else {
      dbModel.insertExcerciseData(data);
    }
    Navigator.pop(context);
    widget.updateParent!();
  }
}

// Text field used in this screen
class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.hint,
    this.controller,
    this.maxLines,
    this.onChanged,
  });
  final String? hint;
  final TextEditingController? controller;
  final int? maxLines;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(hint!),
        ),
        minLines: 1,
        maxLines: maxLines,
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}

//
class MyDropDown extends StatelessWidget {
  const MyDropDown({
    super.key,
    this.value,
    this.onChanged,
    this.list,
    this.hint,
  });
  final String? value;
  final String? hint;
  final Function(String?)? onChanged;
  final List<String>? list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(hint!),
        ),
        items: <DropdownMenuItem<String>>[
          for (String item in list!)
            DropdownMenuItem(
              value: item,
              child: Text(item.toUpperCase()),
            ),
        ],
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
