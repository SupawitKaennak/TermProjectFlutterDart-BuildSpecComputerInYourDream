- [x] Edit lib/providers/build_provider.dart: Add _loadedBuildId = null; in clearAll method
- [x] Edit lib/screens/screens.dart: Change SavedBuildsScreen onTap to push WheelScreen instead of pop
- [x] Edit lib/screens/wheel_screen.dart: Change save button to pushReplacement SavedBuildsScreen

## Fix Main Thread Freeze on Save Button (ANR in SavedBuildsScreen)
- [ ] Edit lib/screens/screens.dart: Convert SavedBuildsScreen to StatefulWidget with async loading to prevent sync DB deserialization on main thread.

## Implement Automatic PC Spec Builder with Budget and Compatibility
- [x] Edit lib/models/models.dart: Add compatibility enums (SocketType, FormFactor, RamType) and extend Part model with socket, chipset, formFactor, recommendedPsuWatts, ramType fields; update PartAdapter.
- [x] Edit lib/data/parts_repository.dart: Enhance parts data with compatibility attributes (parse from descriptions); add getCompatibleParts method for filtering.
- [x] Create lib/services/auto_build_service.dart: Implement AutoBuildService with generateBuild(double budget) method using compatibility rules and budget allocation.
- [x] Edit lib/providers/build_provider.dart: Add AutoBuildService instance and generateAutoBuild/loadAutoBuild methods.
- [x] Create lib/screens/auto_build_screen.dart: New screen for budget input, generate button, display generated parts, save option.
- [x] Edit lib/screens/screens.dart: Add AutoBuildScreen route and navigation.
- [x] Edit lib/screens/wheel_screen.dart: Add "Auto Build" button to navigate to AutoBuildScreen.
