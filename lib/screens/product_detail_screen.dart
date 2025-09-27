import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/build_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Part part;
  const ProductDetailScreen({super.key, required this.part});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(part.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 72,
              backgroundImage: part.imageUrl != null ? NetworkImage(part.imageUrl!) : null,
              child: part.imageUrl == null ? const Icon(Icons.memory, size: 48) : null,
            ),
          ),
          const SizedBox(height: 16),
          Text(part.name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text('${part.price.toStringAsFixed(0)} บาท', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(_categoryLabel(part.category), style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          const Text('รายละเอียดสินค้า', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(part.description ?? 'ไม่พบรายละเอียด'),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: ElevatedButton.icon(
          onPressed: () {
            context.read<BuildProvider>().selectPart(part);
            Navigator.pop(context);
          },
          icon: const Icon(Icons.check_circle_outline),
          label: const Text('เลือกชิ้นส่วนนี้'),
        ),
      ),
    );
  }

  String _categoryLabel(PartCategory c) {
    switch (c) {
      case PartCategory.cpu:
        return 'CPU';
      case PartCategory.mainboard:
        return 'Mainboard';
      case PartCategory.gpu:
        return 'VGA Card';
      case PartCategory.memory:
        return 'Memory';
      case PartCategory.storage:
        return 'Harddisk';
      case PartCategory.m2:
        return 'M.2';
      case PartCategory.casePc:
        return 'Case';
      case PartCategory.psu:
        return 'Power Supply';
      case PartCategory.cpuCooler:
        return 'CPU Cooler';
      case PartCategory.monitor:
        return 'Monitor';
      case PartCategory.keyboard:
        return 'Keyboard';
      case PartCategory.mouse:
        return 'Mouse';
    }
  }
}


