import 'dart:convert';

import 'package:be_app/hive_models/save_food_product.dart';
import 'package:be_app/screens/add_food_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  List<SaveFoodProduct> _products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final String jsonString = await rootBundle.loadString(
      'assets/json/products.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    final List<SaveFoodProduct> loadedProducts = jsonData
        .map((item) => SaveFoodProduct.fromJson(item))
        .toList();
    setState(() {
      _products = loadedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(fontFamily: 'Nunito');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Еда', style: TextStyle(fontFamily: 'Nunito')),
      ),
      body: ListView.separated(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => AddFoodScreen(product: product),
                ),
              );
            },
            title: Text(product.name, style: style),
            subtitle: Text(
              'Ккал: ${product.kcal} | Углеводы: ${product.carbs}',
              style: style,
            ),
            leading: const Icon(Icons.food_bank_rounded),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
