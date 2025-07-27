class FoodProduct {
  final int id;
  final String name;
  final double kcal;
  final double carbs;

  const FoodProduct({
    required this.id,
    required this.name,
    required this.kcal,
    required this.carbs,
  });

  double get be => carbs / 12;
  double get ke => kcal / 10;

  factory FoodProduct.fromJson(Map<String, dynamic> json) {
    return FoodProduct(
      id: json['id'],
      name: json['name'],
      kcal: json['kcal'].toDouble(),
      carbs: json['carbs'].toDouble(),
    );
  }
}
