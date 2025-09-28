import '../models/models.dart';
import '../data/parts_repository.dart';

class AutoBuildService {
  final PartsRepository _repository = PartsRepository();

  PcBuild? generateBuild(double budget) {
    if (budget < 10000) {
      return null; // Minimum budget for basic build
    }

    // Budget allocation (percentages) - adjusted for high-end GPU support
    final cpuBudget = budget * 0.20;
    final mbBudget = budget * 0.15;
    final gpuBudget = budget * 0.40;
    final ramBudget = budget * 0.08;
    final storageBudget = budget * 0.05;
    final psuBudget = budget * 0.05;
    final caseBudget = budget * 0.05;
    final coolerBudget = budget * 0.02;

    // Step 1: Select CPU (prioritize mid-range for balance)
    final cpus = _repository.partsFor(PartCategory.cpu);
    final selectedCpu = _selectPartInBudget(cpus, cpuBudget);
    if (selectedCpu == null) return null;

    // Step 2: Select compatible motherboard
    final mbs = _repository.getCompatibleParts(PartCategory.mainboard, {'socket': selectedCpu.socket});
    final selectedMb = _selectPartInBudget(mbs, mbBudget);
    if (selectedMb == null) return null;

    // Step 3: Select RAM compatible with motherboard
    final rams = _repository.getCompatibleParts(PartCategory.memory, {'ramType': selectedMb.ramType});
    final selectedRam = _selectPartInBudget(rams, ramBudget);
    if (selectedRam == null) return null;

    // Step 4: Select GPU
    final gpus = _repository.partsFor(PartCategory.gpu);
    final selectedGpu = _selectPartInBudget(gpus, gpuBudget);

    // Step 5: Select storage (prioritize M2 if budget allows)
    final storages = _repository.partsFor(PartCategory.m2);
    final selectedStorage = _selectPartInBudget(storages, storageBudget) ?? _selectPartInBudget(_repository.partsFor(PartCategory.storage), storageBudget);
    if (selectedStorage == null) return null;

    // Step 6: Calculate required PSU watts (rough estimate: CPU + GPU TDP + 50W overhead for tolerance)
    final cpuWatts = selectedCpu.recommendedPsuWatts ?? 100;
    final gpuWatts = selectedGpu?.recommendedPsuWatts ?? 0;
    final minPsuWatts = cpuWatts + gpuWatts + 50;
    final psus = _repository.getCompatibleParts(PartCategory.psu, {'minPsuWatts': minPsuWatts});
    final selectedPsu = _selectPartInBudget(psus, psuBudget);
    if (selectedPsu == null) return null;

    // Step 7: Select case (ignore strict compatibility for simplicity, most cases support mATX)
    final cases = _repository.partsFor(PartCategory.casePc);
    final selectedCase = _selectPartInBudget(cases, caseBudget);
    if (selectedCase == null) return null;

    // Step 8: Select CPU cooler (if budget allows, else skip)
    final coolers = _repository.partsFor(PartCategory.cpuCooler);
    final selectedCooler = _selectPartInBudget(coolers, coolerBudget);

    // Compile parts list
    final parts = [selectedCpu, selectedMb, selectedRam, selectedStorage, selectedPsu, selectedCase];
    if (selectedGpu != null) parts.add(selectedGpu);
    if (selectedCooler != null) parts.add(selectedCooler);

    // No strict total price check - allow slight overage for complete builds
    final totalPrice = parts.fold(0.0, (sum, p) => sum + p.price);

    return PcBuild(
      id: 'auto-${DateTime.now().millisecondsSinceEpoch}',
      title: 'Auto Build (${budget.toStringAsFixed(0)} THB)',
      parts: parts,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  Part? _selectPartInBudget(List<Part> parts, double budget) {
    if (parts.isEmpty) return null;
    // Sort all parts by price descending, then pick the first (highest) that fits budget
    final sortedParts = List<Part>.from(parts);
    sortedParts.sort((a, b) => b.price.compareTo(a.price)); // Highest price first
    for (final part in sortedParts) {
      if (part.price <= budget) {
        return part;
      }
    }
    // If no parts fit budget, return the cheapest available
    final sortedCheap = List<Part>.from(parts);
    sortedCheap.sort((a, b) => a.price.compareTo(b.price));
    return sortedCheap.first;
  }
}
