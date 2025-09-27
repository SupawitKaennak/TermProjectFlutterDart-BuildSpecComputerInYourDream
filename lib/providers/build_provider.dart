import 'package:flutter/foundation.dart';
import '../models/models.dart';

class BuildProvider extends ChangeNotifier {
  final Map<PartCategory, Part?> _selected = {
    for (final cat in PartCategory.values) cat: null,
  };

  String _title = 'My PC Build';

  String get title => _title;
  set title(String value) {
    _title = value;
    notifyListeners();
  }

  Map<PartCategory, Part?> get selectedParts => Map.unmodifiable(_selected);

  void selectPart(Part part) {
    _selected[part.category] = part;
    notifyListeners();
  }

  void clearPart(PartCategory category) {
    _selected[category] = null;
    notifyListeners();
  }

  void clearAll() {
    for (final key in _selected.keys) {
      _selected[key] = null;
    }
    _title = 'My PC Build';
    _loadedBuildId = null;
    notifyListeners();
  }

  List<Part> get parts => _selected.values.whereType<Part>().toList(growable: false);

  double get totalPrice => parts.fold(0.0, (sum, p) => sum + p.price);

  String? _loadedBuildId;

  PcBuild toBuild(String id) {
    final now = DateTime.now();
    return PcBuild(
      id: id,
      title: _title,
      parts: parts,
      createdAt: now,
      updatedAt: now,
    );
  }

  void loadFromBuild(PcBuild build) {
    for (final key in _selected.keys) {
      _selected[key] = null;
    }
    _title = build.title;
    for (final part in build.parts) {
      _selected[part.category] = part;
    }
    _loadedBuildId = build.id;
    notifyListeners();
  }

  String? get loadedBuildId => _loadedBuildId;

  void clearLoadedId() {
    _loadedBuildId = null;
  }
}


