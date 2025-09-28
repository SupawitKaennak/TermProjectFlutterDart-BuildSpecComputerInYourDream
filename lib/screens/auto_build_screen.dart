import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/build_provider.dart';
import '../models/models.dart';
import 'wheel_screen.dart';

class AutoBuildScreen extends StatefulWidget {
  const AutoBuildScreen({super.key});

  @override
  State<AutoBuildScreen> createState() => _AutoBuildScreenState();
}

class _AutoBuildScreenState extends State<AutoBuildScreen> {
  final TextEditingController _budgetController = TextEditingController();
  PcBuild? _generatedBuild;
  bool _isGenerating = false;

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  Future<void> _generateBuild() async {
    final budgetText = _budgetController.text.trim();
    if (budgetText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('กรุณาใส่จำนวนงบประมาณ')));
      return;
    }

    final budget = double.tryParse(budgetText);
    if (budget == null || budget < 10000) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('งบประมาณต้องมากกว่า 10,000 บาท')));
      return;
    }

    setState(() {
      _isGenerating = true;
      _generatedBuild = null;
    });

    final provider = context.read<BuildProvider>();
    final build = await provider.generateAutoBuild(budget);
    setState(() {
      _generatedBuild = build;
      _isGenerating = false;
    });

    if (build == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ไม่สามารถสร้างสเปคได้ กรุณาลองงบประมาณอื่น')));
      }
    }
  }

  void _saveBuild() {
    if (_generatedBuild == null) return;

    final provider = context.read<BuildProvider>();
    provider.loadAutoBuild(_generatedBuild!);
    provider.title = _generatedBuild!.title;

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('บันทึกสเปคอัตโนมัติแล้ว')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const WheelScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('สร้างสเปคอัตโนมัติ')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'งบประมาณ (บาท)',
                hintText: 'เช่น 30000',
                prefixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _isGenerating ? null : _generateBuild,
              icon: _isGenerating ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ) : const Icon(Icons.build),
              label: Text(_isGenerating ? 'กำลังสร้าง...' : 'สร้างสเปค'),
            ),
            const SizedBox(height: 24),
            if (_generatedBuild != null) ...[
              Text(
                'สเปคที่สร้าง: ${_generatedBuild!.title}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _generatedBuild!.parts.length,
                  itemBuilder: (context, index) {
                    final part = _generatedBuild!.parts[index];
                    return Card(
                      child: ListTile(
                        leading: part.imageUrl != null
                            ? Image.network(part.imageUrl!, width: 50, height: 50, fit: BoxFit.cover)
                            : const Icon(Icons.category, size: 50),
                        title: Text(part.name),
                        subtitle: Text('${part.description ?? ''}\n${part.category.name.toUpperCase()}'),
                        trailing: Text('${part.price.toStringAsFixed(0)} บาท'),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _saveBuild,
                icon: const Icon(Icons.save),
                label: const Text('บันทึกและดูสเปค'),
              ),
            ] else if (!_isGenerating) ...[
              const Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.computer, size: 100, color: Colors.grey),
                      SizedBox(height: 16),
                      Text('ใส่งบประมาณเพื่อสร้างสเปคอัตโนมัติ\nระบบจะเลือกชิ้นส่วนที่เข้ากันและอยู่ในงบ'),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
