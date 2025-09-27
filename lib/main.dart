import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/build_provider.dart';
import 'services/db_service.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDbService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BuildProvider(),
      child: MaterialApp(
        title: 'PC Builder',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 54, 67, 140)),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 54, 67, 140),
            foregroundColor: Colors.white, // ทำให้ Title และ Icons เป็นสีขาว
            elevation: 2,
          ),
        ),
        home: const CategoriesScreen(),
      ),
    );
  }
}