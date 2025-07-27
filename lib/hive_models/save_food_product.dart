import 'package:hive/hive.dart';

part 'save_food_product.g.dart';

@HiveType(typeId: 0)
class SaveFoodProduct extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final double kcal;

  @HiveField(2)
  final double carbs;

  SaveFoodProduct({
    required this.name,
    required this.kcal,
    required this.carbs,
  });

  factory SaveFoodProduct.fromJson(Map<String, dynamic> json) {
    return SaveFoodProduct(
      name: json['name'],
      kcal: json['kcal'].toDouble(),
      carbs: json['carbs'].toDouble(),
    );
  }
}
