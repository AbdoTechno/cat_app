import 'package:cat_app/hive_registrar.g.dart';
import 'package:hive_ce_flutter/adapters.dart';

class HiveServices {
  HiveServices._();

  static final HiveServices instance = HiveServices._();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapters();
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    return await Hive.openBox<T>(boxName);
  }

  Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }
  }

  Future<void> deleteBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await Hive.box(boxName).close();
    }

    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<void> closeAll() async {
    await Hive.close();
  }
}
