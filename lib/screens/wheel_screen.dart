import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/build_provider.dart';
import '../models/models.dart';
import '../services/db_service.dart';
import '../models/category_images.dart';
import 'screens.dart' show SavedBuildsScreen; // reuse existing screen
import 'auto_build_screen.dart';

class WheelScreen extends StatelessWidget {
  const WheelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('วงล้อสเปคคอม')),
      body: Consumer<BuildProvider>(builder: (context, provider, child) {
        return Center(
          child: AspectRatio(
            aspectRatio: 1,
            child: _Wheel(parts: provider.parts),
          ),
        );
      }),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () async {
              final provider = context.read<BuildProvider>();
              final controller = TextEditingController(text: provider.title);
              final result = await showDialog<String>(
                context: context, // Note: Using context here is fine
                builder: (ctx) {
                  return AlertDialog(
                    title: const Text('ตั้งชื่อชุดสเปค'),
                    content: TextField(
                      controller: controller,
                      decoration: const InputDecoration(hintText: 'เช่น Gaming 2025'),
                    ),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('ยกเลิก')),
                      ElevatedButton(onPressed: () => Navigator.pop(ctx, controller.text.trim()), child: const Text('บันทึก')),
                    ],
                  );
                },
              );
              if (result != null && result.isNotEmpty) {
                provider.title = result;
              }
              final existingId = provider.loadedBuildId;
              final id = existingId ?? DateTime.now().millisecondsSinceEpoch.toString();
              final build = provider.toBuild(id);
              if (existingId != null) {
                // build.createdAt is handled in toBuild now
              }
              await LocalDbService().addOrUpdateBuild(build);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('บันทึกแล้ว')));
                await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SavedBuildsScreen()),
                );
              }
            },
            label: const Text('บันทึก'),
            icon: const Icon(Icons.save),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AutoBuildScreen()),
              );
            },
            backgroundColor: Colors.blueAccent,
            label: const Text('Auto Build'),
            icon: const Icon(Icons.auto_awesome),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            onPressed: () {
              context.read<BuildProvider>().clearAll();
            },
            backgroundColor: Colors.redAccent,
            label: const Text('ล้างสเปค'),
            icon: const Icon(Icons.clear_all),
          ),
        ],
      ),
    );
  }
}

class _Wheel extends StatelessWidget {
  final List<Part> parts;
  const _Wheel({required this.parts});

  @override
  Widget build(BuildContext context) {
    // Ensure count is at least 2 for angle calculation to work correctly,
    // preventing division by a small number or 1 which can cause issues
    // with cos/sin if only one item is present.
    final count = math.max(2, parts.length);
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest.shortestSide;
        final radius = size / 2 - 24;
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.surfaceVariant,
              ),
            ),
            for (int i = 0; i < parts.length; i++) _buildSlice(context, i, count, radius),
            _buildCenterSummary(context),
          ],
        );
      },
    );
  }

  Widget _buildSlice(BuildContext context, int i, int count, double radius) {
    final angle = (2 * math.pi / count) * i;
    final part = parts[i];
    final image = part.imageUrl ?? defaultImageFor(part.category);
    final name = part.name;
    final price = part.price;

    final dx = radius * math.cos(angle);
    final dy = radius * math.sin(angle);

    return Transform.translate(
      offset: Offset(dx, dy),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: image != null ? NetworkImage(image) : null,
            child: image == null ? const Icon(Icons.memory) : null,
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 100,
            child: Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),
          Text('${price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildCenterSummary(BuildContext context) {
    final total = parts.fold<double>(0, (s, p) => s + p.price);
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('ราคารวม', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(total.toStringAsFixed(0), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
