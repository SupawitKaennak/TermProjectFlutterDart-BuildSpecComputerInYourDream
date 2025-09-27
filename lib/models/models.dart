import 'package:hive/hive.dart';

@HiveType(typeId: 1)
enum PartCategory {
  @HiveField(0)
  cpu,
  @HiveField(1)
  mainboard,
  @HiveField(2)
  gpu,
  @HiveField(3)
  memory,
  @HiveField(4)
  storage,
  @HiveField(5)
  m2,
  @HiveField(6)
  casePc,
  @HiveField(7)
  psu,
  @HiveField(8)
  cpuCooler,
  @HiveField(9)
  monitor,
  @HiveField(10)
  keyboard,
  @HiveField(11)
  mouse,
}

class PartCategoryAdapter extends TypeAdapter<PartCategory> {
  @override
  final int typeId = 1;

  @override
  PartCategory read(BinaryReader reader) {
    final index = reader.readByte();
    return PartCategory.values[index];
  }

  @override
  void write(BinaryWriter writer, PartCategory obj) {
    writer.writeByte(obj.index);
  }
}

@HiveType(typeId: 2)
class Part extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  PartCategory category;

  @HiveField(4)
  String? imageUrl;

  @HiveField(5)
  String? description;

  Part({required this.id, required this.name, required this.price, required this.category, this.imageUrl, this.description});
}

class PartAdapter extends TypeAdapter<Part> {
  @override
  final int typeId = 2;

  @override
  Part read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return Part(
      id: fields[0] as String,
      name: fields[1] as String,
      price: (fields[2] as num).toDouble(),
      category: fields[3] as PartCategory,
      imageUrl: fields[4] as String?,
      description: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Part obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.description);
  }
}

@HiveType(typeId: 3)
class PcBuild extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  List<Part> parts;

  @HiveField(3)
  DateTime createdAt;

  @HiveField(4)
  DateTime updatedAt;

  PcBuild({required this.id, required this.title, required this.parts, required this.createdAt, required this.updatedAt});

  double get totalPrice => parts.fold(0.0, (sum, p) => sum + p.price);
}

class PcBuildAdapter extends TypeAdapter<PcBuild> {
  @override
  final int typeId = 3;

  @override
  PcBuild read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{};
    for (var i = 0; i < numOfFields; i++) {
      fields[reader.readByte()] = reader.read();
    }
    return PcBuild(
      id: fields[0] as String,
      title: fields[1] as String,
      parts: (fields[2] as List).cast<Part>(),
      createdAt: (fields[3] as DateTime?) ?? DateTime.now(),
      updatedAt: (fields[4] as DateTime?) ?? DateTime.now(),
    );
  }

  @override
  void write(BinaryWriter writer, PcBuild obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.parts)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.updatedAt);
  }
}


