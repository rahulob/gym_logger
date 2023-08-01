import 'dart:io';
import 'package:gym_logger/models/excercise_data_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ExcerciseDBModel {
  static Database? _database;

  static const String tableName = 'excercise_table';
  static const String columnId = 'id';
  static const String columnName = 'name';
  static const String columnDescription = 'description';
  static const String columnCategory = 'category';
  static const String columnWeightUnits = 'weight_units';
  static const String columnWeightType = 'weight_type';

  static final instance = ExcerciseDBModel();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final Directory databasesPath = await getApplicationDocumentsDirectory();
    final String path = join(databasesPath.toString(), 'gym_logger.db');
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  Future _onCreate(db, version) async {
    await db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnDescription TEXT,
            $columnCategory TEXT,
            $columnWeightUnits TEXT
            $columnWeightType TEXT
          )
        ''');
  }

  Future<void> insertExcerciseData(ExcerciseData data) async {
    final db = await database;
    await db.insert(tableName, data.toMap());
  }

  Future<List<ExcerciseData>> get getExcerciseDataList async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (index) {
      return ExcerciseData(
        id: maps[index][columnId],
        name: maps[index][columnName],
        description: maps[index][columnDescription],
        category: maps[index][columnCategory],
        weightUnits: maps[index][columnWeightUnits],
        weightType: maps[index][columnWeightType],
      );
    });
  }

  Future<void> updateExcerciseData(ExcerciseData data) async {
    final db = await database;
    await db.update(
      tableName,
      data.toMap(),
      where: '$columnId = ?',
      whereArgs: [data.id],
    );
  }

  Future<void> deleteExcerciseData(int id) async {
    final db = await database;
    await db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}

// final defaultExcercises = [
//   ExcerciseData(
//     name: 'Bench Press',
//     description:
//         'Lie flat on a bench and grip the barbell slightly wider than shoulder-width. Lower the barbell to your chest and push it back up.',
//     category: 'chest',
//   ),
//   ExcerciseData(
//     name: 'Push-ups',
//     description:
//         'Assume a plank position with your hands shoulder-width apart. Lower your body until your chest nearly touches the ground and push back up.',
//     category: 'chest',
//   ),
//   ExcerciseData(
//     name: 'Dumbbell Flyes',
//     description:
//         'Lie on a flat bench with dumbbells in each hand. Extend your arms out to the sides and bring them back up, squeezing your chest.',
//     category: 'chest',
//   ),
//   ExcerciseData(
//     name: 'Squats',
//     description:
//         'Stand with feet shoulder-width apart. Bend your knees and lower your body as if sitting down, then stand back up.',
//     category: 'legs',
//   ),
//   ExcerciseData(
//     name: 'Lunges',
//     description:
//         'Step forward with one leg and lower your body until both knees are bent at 90 degrees. Push off the front foot to return to the starting position.',
//     category: 'legs',
//   ),
//   ExcerciseData(
//     name: 'Deadlifts',
//     description:
//         'Stand with feet shoulder-width apart, bend at the hips, and grip a barbell. Lift the barbell while keeping your back straight.',
//     category: 'legs',
//   ),
//   ExcerciseData(
//     name: 'Pull-ups',
//     description:
//         'Hang from a bar with your palms facing away. Pull your body up until your chin clears the bar, then lower back down.',
//     category: 'back',
//   ),
//   ExcerciseData(
//     name: 'Bent-over Rows',
//     description:
//         'Bend forward at the hips with a barbell in hand. Pull the barbell towards your stomach, squeezing your back muscles.',
//     category: 'back',
//   ),
//   ExcerciseData(
//     name: 'Reverse Flyes',
//     description:
//         'Bend forward with dumbbells in hand. Raise the dumbbells out to the sides, squeezing your shoulder blades together.',
//     category: 'back',
//   ),
//   ExcerciseData(
//     name: 'Overhead Press',
//     description:
//         'Stand with feet shoulder-width apart and a barbell at shoulder height. Press the barbell overhead until your arms are straight.',
//     category: 'shoulders',
//   ),
//   ExcerciseData(
//     name: 'Arnold Press',
//     description:
//         'Sit on a bench with dumbbells at shoulder height. Rotate your palms as you press the dumbbells overhead.',
//     category: 'shoulders',
//   ),
//   ExcerciseData(
//     name: 'Lateral Raises',
//     description:
//         'Stand with dumbbells at your sides. Raise the dumbbells out to the sides until they are parallel to the ground.',
//     category: 'shoulders',
//   ),
//   ExcerciseData(
//     name: 'Bicep Curls',
//     description:
//         'Stand with dumbbells at your sides. Curl the dumbbells up towards your shoulders, squeezing your biceps.',
//     category: 'biceps',
//   ),
//   ExcerciseData(
//     name: 'Tricep Dips',
//     description:
//         'Sit on a bench and place your hands on the edge. Lower your body down and then push back up using your triceps.',
//     category: 'triceps',
//   ),
//   ExcerciseData(
//     name: 'Hammer Curls',
//     description:
//         'Stand with dumbbells at your sides, palms facing your body. Curl the dumbbells up towards your shoulders.',
//     category: 'biceps',
//   )
// ];
