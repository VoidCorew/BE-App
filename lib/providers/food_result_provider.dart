import 'package:be_app/hive_models/save_food_result.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FoodResultProvider extends ChangeNotifier {
  // final List<FoodResult> _results = [];
  // List<FoodResult> get results => _results;

  final Box<SaveFoodResult> _box = Hive.box<SaveFoodResult>('food_results');
  List<SaveFoodResult> get results => _box.values.toList();

  void addResult(SaveFoodResult result) {
    // _results.add(result);
    _box.add(result);
    notifyListeners();
  }

  List<SaveFoodResult> getResultsByDate(DateTime date) {
    return _box.values.where((result) {
      return result.dateTime.year == date.year &&
          result.dateTime.month == date.month &&
          result.dateTime.day == date.day;
    }).toList();
  }
}
