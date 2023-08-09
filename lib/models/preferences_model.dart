import 'package:hive_flutter/hive_flutter.dart';

class Preferences {
  late Box _prefs;
  Preferences() {
    _prefs = Hive.box('settings');
  }

  listenable() {
    return _prefs.listenable();
  }

  String getUnits() {
    return _prefs.get('units') ?? 'kg';
  }

  String getTheme() {
    return _prefs.get('theme') ?? 'system';
  }

  double getIncrementWeight() {
    return _prefs.get('increment') ?? 2.5;
  }

  bool getKeepScreenAlive() {
    return _prefs.get('keepScreenAlive') ?? false;
  }

  bool getConfirmDelete() {
    return _prefs.get('confirmDelete') ?? true;
  }

  void setUnits(String? unit) {
    _prefs.put('units', unit ?? 'kg');
  }

  void setTheme(String? theme) {
    _prefs.put('theme', theme ?? 'system');
  }

  void setIncrementWeight(double weight) {
    _prefs.put('increment', weight);
  }

  void setKeepScreenAlive(bool value) {
    _prefs.put('keepScreenAlive', value);
  }

  void setConfirmDelete(bool value) {
    _prefs.put('confirmDelete', value);
  }

  void resetPreferences() {
    _prefs.putAll({
      'theme': 'system',
      'increment': 2.5,
      'units': 'kg',
      'keepScreenAlive': false,
      'confirmDelete': true,
    });
  }
}
