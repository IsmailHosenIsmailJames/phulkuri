import 'package:hive/hive.dart';

class StorageManager {
  static void saveData(String key, dynamic value) async {
    final box = await Hive.openBox("themeData");
    await box.put(key, value);
  }

  static Future<dynamic> readData(String key) async {
    final box = await Hive.openBox("themeData");
    final theme = await box.get(key, defaultValue: false);
    if (theme == false) {
      return "system";
    } else {
      return theme;
    }
  }

  static Future<void> deleteData(String key) async {
    final box = await Hive.openBox("themeData");
    box.delete(key);
  }
}
