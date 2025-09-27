import 'package:hive_flutter/hive_flutter.dart';
import '../models/models.dart';

class LocalDbService {
  static const String buildsBoxName = 'pc_builds_box';

  static Future<void> initialize() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PartCategoryAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(PartAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(PcBuildAdapter());
    }
    await Hive.openBox<PcBuild>(buildsBoxName);
  }

  Box<PcBuild> get _box => Hive.box<PcBuild>(buildsBoxName);

  List<PcBuild> getAllBuilds() => _box.values.toList(growable: false);

  Future<void> addOrUpdateBuild(PcBuild build) async {
    // If exists, preserve createdAt, bump updatedAt
    final existing = _box.get(build.id);
    if (existing != null) {
      build
        ..createdAt = existing.createdAt
        ..updatedAt = DateTime.now();
      await existing.delete();
    } else {
      build
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now();
    }
    await _box.put(build.id, build);
  }

  Future<void> deleteBuild(String id) async {
    await _box.delete(id);
  }
}


