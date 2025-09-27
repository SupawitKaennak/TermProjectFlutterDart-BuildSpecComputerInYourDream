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
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: const CategoriesScreen(),
      ),
    );
  }
}