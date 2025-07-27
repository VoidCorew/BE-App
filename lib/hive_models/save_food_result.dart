import 'package:be_app/hive_models/save_food_product.dart';
import 'package:hive/hive.dart';

part 'save_food_result.g.dart';

@HiveType(typeId: 1)
class SaveFoodResult extends HiveObject {
  @HiveField(0)
  final String portionName;

  @HiveField(1)
  final SaveFoodProduct product;

  @HiveField(2)
  final double eatenKcal;

  @HiveField(3)
  final double eatenCarbs;

  @HiveField(4)
  final String ke;

  @HiveField(5)
  final String be;

  @HiveField(6)
  final DateTime dateTime;

  SaveFoodResult({
    required this.portionName,
    required this.product,
    required this.eatenKcal,
    required this.eatenCarbs,
    required this.ke,
    required this.be,
    required this.dateTime,
  });
}
