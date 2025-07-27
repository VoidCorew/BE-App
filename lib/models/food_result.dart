import 'package:be_app/models/food_product.dart';

class FoodResult {
  final String portionName;
  final FoodProduct product;
  final double eatenKcal;
  final double eatenCarbs;
  final String ke;
  final String be;
  final DateTime dateTime;

  const FoodResult({
    required this.portionName,
    required this.product,
    required this.eatenKcal,
    required this.eatenCarbs,
    required this.ke,
    required this.be,
    required this.dateTime,
  });
}
