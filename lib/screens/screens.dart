import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/build_provider.dart';
import '../services/db_service.dart';
import '../models/models.dart';
import '../models/category_images.dart';
import 'wheel_screen.dart';
import 'product_detail_screen.dart';
// import retained in other files
import '../data/parts_repository.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cats = PartCategory.values;
    return Scaffold(
      appBar: AppBar(title: const Text('จัดสเปคคอมพิวเตอร์')),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          final cat = cats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: defaultImageFor(cat) != null ? NetworkImage(defaultImageFor(cat)!) : null,
              child: defaultImageFor(cat) == null ? const Icon(Icons.category) : null,
              radius: 20,
            ),
            title: Text(_categoryLabel(cat)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PartsScreen(category: cat)),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SavedBuildsScreen()),
                ),
                icon: const Icon(Icons.list),
                label: const Text('สเปคที่บันทึกไว้'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const WheelScreen()),
                ),
                icon: const Icon(Icons.pie_chart),
                label: const Text('สร้างชุดสเปค'),
              ),
            ),
          ],
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

class PartsScreen extends StatelessWidget {
  final PartCategory category;
  const PartsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BuildProvider>();
    final repo = PartsRepository();
    final allParts = repo.partsFor(category);
    final selected = provider.selectedParts[category];
    final searchController = TextEditingController();
    double minPrice = 0;
    double maxPrice = 100000;

    List<Part> filter(List<Part> source) {
      final q = searchController.text.toLowerCase();
      return source.where((p) {
        final inName = p.name.toLowerCase().contains(q);
        final inPrice = p.price >= minPrice && p.price <= maxPrice;
        return inName && inPrice;
      }).toList(growable: false);
    }

    return StatefulBuilder(
      builder: (context, setState) {
        final filtered = filter(allParts);
        return Scaffold(
          appBar: AppBar(title: Text(_categoryLabel(category))),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'ค้นหาสินค้า...',
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Text('ช่วงราคา:'),
                    Expanded(
                      child: RangeSlider(
                        values: RangeValues(minPrice, maxPrice),
                        min: 0,
                        max: 100000,
                        divisions: 100,
                        labels: RangeLabels(minPrice.toStringAsFixed(0), maxPrice.toStringAsFixed(0)),
                        onChanged: (v) {
                          setState(() {
                            minPrice = v.start;
                            maxPrice = v.end;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final part = filtered[index];
                    final isSelected = selected?.id == part.id;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: part.imageUrl != null ? NetworkImage(part.imageUrl!) : null,
                        child: part.imageUrl == null ? const Icon(Icons.memory) : null,
                      ),
                      title: Row(
                        children: [
                          Expanded(child: Text(part.name)),
                          TextButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => ProductDetailScreen(part: part)),
                            ),
                            child: const Text('รายละเอียด'),
                          ),
                        ],
                      ),
                      subtitle: Text('${part.price.toStringAsFixed(0)} บาท'),
                      trailing: isSelected ? const Icon(Icons.check, color: Colors.green) : null,
                      onTap: () => context.read<BuildProvider>().selectPart(part),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _categoryLabel(PartCategory c) => const CategoriesScreen()._categoryLabel(c);
}

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BuildProvider>();
    final parts = provider.parts;
    return Scaffold(
      appBar: AppBar(title: const Text('สรุปชุดสเปค')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(labelText: 'ชื่อชุดสเปค'),
              controller: TextEditingController(text: provider.title),
              onChanged: (v) => provider.title = v,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: parts.length,
              itemBuilder: (context, index) {
                final p = parts[index];
                return ListTile(
                  title: Text(p.name),
                  subtitle: Text(_categoryLabel(p.category)),
                  trailing: Text('${p.price.toStringAsFixed(0)} บาท'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ราคารวม: ${provider.totalPrice.toStringAsFixed(0)} บาท', style: const TextStyle(fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () async {
                    final id = DateTime.now().millisecondsSinceEpoch.toString();
                    final build = provider.toBuild(id);
                    await LocalDbService().addOrUpdateBuild(build);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('บันทึกแล้ว')));
                    }
                  },
                  child: const Text('บันทึก'),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) => const WheelScreen()));
        },
        child: const Icon(Icons.pie_chart),
      ),
    );
  }

  String _categoryLabel(PartCategory c) => const CategoriesScreen()._categoryLabel(c);
}

class SavedBuildsScreen extends StatefulWidget {
  const SavedBuildsScreen({super.key});

  @override
  State<SavedBuildsScreen> createState() => _SavedBuildsScreenState();
}

class _SavedBuildsScreenState extends State<SavedBuildsScreen> {
  List<PcBuild> _builds = [];
  bool _isLoading = true;
  final LocalDbService _service = LocalDbService();

  @override
  void initState() {
    super.initState();
    _loadBuilds();
  }

  Future<void> _loadBuilds() async {
    _builds = _service.getAllBuilds();
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteBuild(String id) async {
    await _service.deleteBuild(id);
    if (mounted) {
      _loadBuilds();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_builds.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('สเปคที่บันทึกไว้')),
        body: const Center(
          child: Text('ยังไม่มีสเปคที่บันทึกไว้'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('สเปคที่บันทึกไว้')),
      body: ListView.builder(
        itemCount: _builds.length,
        itemBuilder: (context, index) {
          final b = _builds[index];
          return Dismissible(
            key: ValueKey(b.id),
            background: Container(color: Colors.red),
            onDismissed: (_) => _deleteBuild(b.id),
            child: ListTile(
              title: Text(b.title),
              subtitle: Text('ชิ้นส่วน ${b.parts.length} ชิ้น\nสร้างเมื่อ ${_formatDate(b.createdAt)}\nแก้ไขล่าสุด ${_formatDate(b.updatedAt)}'),
              trailing: Text('${b.totalPrice.toStringAsFixed(0)} บาท'),
              onTap: () {
                context.read<BuildProvider>().loadFromBuild(b);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const WheelScreen()));
              },
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2,'0')}-${dt.day.toString().padLeft(2,'0')} ${dt.hour.toString().padLeft(2,'0')}:${dt.minute.toString().padLeft(2,'0')}';
  }
}


