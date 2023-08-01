import 'package:gym_logger/models/database/excercise_db_model.dart';

class ExcerciseData {
  final int? id;
  final String name;
  final String? description;
  final String category;
  final String weightUnits;
  final String weightType;

  ExcerciseData({
    this.id,
    required this.name,
    this.description,
    required this.category,
    required this.weightUnits,
    required this.weightType,
  });

  Map<String, dynamic> toMap() {
    return {
      ExcerciseDBModel.columnId: id,
      ExcerciseDBModel.columnName: name,
      ExcerciseDBModel.columnDescription: description,
      ExcerciseDBModel.columnCategory: category,
      ExcerciseDBModel.columnWeightUnits: weightUnits,
      ExcerciseDBModel.columnWeightType: weightUnits,
    };
  }
}
