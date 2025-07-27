import 'package:be_app/hive_models/save_food_product.dart';
import 'package:be_app/hive_models/save_food_result.dart';
import 'package:be_app/providers/food_result_provider.dart';
import 'package:be_app/providers/theme_provider.dart';
import 'package:be_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeProvider = ThemeProvider();
  await themeProvider.loadTheme();

  await initializeDateFormatting('ru_RU', null);
  await Hive.initFlutter();

  Hive.registerAdapter(SaveFoodResultAdapter());
  Hive.registerAdapter(SaveFoodProductAdapter());

  await Hive.openBox<SaveFoodResult>('food_results');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FoodResultProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const BEApp(),
    ),
  );
}

class BEApp extends StatelessWidget {
  const BEApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // themeMode: themeProvider.currentMode,
      home: const HomeScreen(),
    );
  }
}
