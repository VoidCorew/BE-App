import 'package:be_app/models/home_card.dart';
import 'package:be_app/providers/theme_provider.dart';
import 'package:be_app/screens/food_diary_screen.dart';
import 'package:be_app/screens/food_screen.dart';
import 'package:be_app/screens/products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<HomeCard> _cards = [
    HomeCard(
      imagePath: 'assets/images/add_food.png',
      title: 'Добавить еду',
      screen: FoodScreen(),
    ),
    HomeCard(
      imagePath: 'assets/images/food_diary.png',
      title: 'Дневник питания',
      screen: FoodDiaryScreen(),
    ),
    HomeCard(
      imagePath: 'assets/images/products.png',
      title: 'Продукты',
      screen: ProductsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная', style: TextStyle(fontFamily: 'Nunito')),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       themeProvider.toggleTheme();
        //     },
        //     icon: Icon(
        //       themeProvider.isDark ? Icons.wb_sunny : Icons.nightlight_round,
        //     ),
        //   ),
        // ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _cards.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final card = _cards[index];
          return Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => card.screen),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(card.imagePath),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(card.title, style: TextStyle(fontFamily: 'Nunito')),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(FluentIcons.food_24_filled),
      // ),
    );
  }
}
