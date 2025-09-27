- [x] Edit lib/providers/build_provider.dart: Add _loadedBuildId = null; in clearAll method
- [x] Edit lib/screens/screens.dart: Change SavedBuildsScreen onTap to push WheelScreen instead of pop
- [x] Edit lib/screens/wheel_screen.dart: Change save button to pushReplacement SavedBuildsScreen

## Fix Main Thread Freeze on Save Button (ANR in SavedBuildsScreen)
- [ ] Edit lib/screens/screens.dart: Convert SavedBuildsScreen to StatefulWidget with async loading to prevent sync DB deserialization on main thread.
