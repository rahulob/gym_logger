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
            $columnWeightUnits TEXT,
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

final defaultExcercises = [
  ExcerciseData(
    name: 'Bench Press',
    description: 'Flat bench barbell press',
    category: 'chest',
    weightUnits: 'kg',
    weightType: 'reps',
  ),
  ExcerciseData(
    name: 'Incline Bench Press',
    description: 'Incline barbell press for upper chest',
    category: 'chest',
    weightUnits: 'kg',
    weightType: 'reps',
  ),
  ExcerciseData(
    name: 'Decline Bench Press',
    description: 'Decline bench barbell press for lower chest',
    category: 'chest',
    weightUnits: 'kg',
    weightType: 'reps',
  ),
  ExcerciseData(
    name: 'Cable crossover',
    category: 'chest',
    weightUnits: 'kg',
    weightType: 'reps',
  ),
  ExcerciseData(
    name: 'Dumbbell Press',
    description: 'Flat bench dumbell press',
    category: 'chest',
    weightUnits: 'kg',
    weightType: 'reps',
  ),
  ExcerciseData(
    name: 'Incline dumbbell Press',
    description: 'Incline bench dumbbell press for upper chest',
    category: 'chest',
    weightUnits: 'kg',
    weightType: 'reps',
  ),
];
