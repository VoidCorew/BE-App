import 'package:be_app/hive_models/save_food_product.dart';
import 'package:be_app/hive_models/save_food_result.dart';
import 'package:be_app/providers/food_result_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFoodScreen extends StatefulWidget {
  final SaveFoodProduct product;
  const AddFoodScreen({super.key, required this.product});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final TextEditingController _portionNameController = TextEditingController();
  final TextEditingController _portionWeightController =
      TextEditingController();

  double _calories = 0;
  double _carbs = 0;
  double _ke = 0;
  double _be = 0;

  void _calculate() {
    final weightText = _portionWeightController.text;
    final weight = double.tryParse(weightText);

    if (weight != null && weight > 0) {
      setState(() {
        _calories = (widget.product.kcal * weight) / 100;
        _carbs = (widget.product.carbs * weight) / 100;
        _ke = _carbs / 10;
        _be = _carbs / 12;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Введите корректный вес!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle customTextStyle = TextStyle(
      fontFamily: 'Nunito',
      fontSize: 16,
      fontStyle: FontStyle.italic,
    );
    final ButtonStyle customElevatedButtonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.name,
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildTextFieldWithTitle(
            'Имя порции',
            FluentIcons.bowl_chopsticks_24_filled,
            'Порция',
            'Введите название порции',
            _portionNameController,
          ),
          const SizedBox(height: 30),
          _buildTextFieldWithTitle(
            'Вес порции (в граммах)',
            FluentIcons.scales_24_regular,
            'Вес',
            'Введите вес порции',
            _portionWeightController,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: customElevatedButtonStyle,
            onPressed: _calculate,
            child: const Text(
              'Рассчитать',
              style: TextStyle(fontFamily: 'Nunito'),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Съеденные калории: ${_calories.toStringAsFixed(1)}',
            style: customTextStyle,
          ),
          Text(
            'Съеденные углеводы: ${_carbs.toStringAsFixed(1)}',
            style: customTextStyle,
          ),
          Text('KE: ${_ke.toStringAsFixed(2)}', style: customTextStyle),
          Text('BE: ${_be.toStringAsFixed(2)}', style: customTextStyle),
          const SizedBox(height: 40),
          ElevatedButton(
            style: customElevatedButtonStyle,
            onPressed: () {
              final weight = double.tryParse(_portionWeightController.text);

              if (weight == null ||
                  weight <= 0 ||
                  _portionNameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Введите корректные данные!')),
                );
                return;
              }

              // final result = FoodResult(
              //   portionName: _portionNameController.text,
              //   product: widget.product,
              //   eatenKcal: _calories,
              //   eatenCarbs: _carbs,
              //   ke: _ke.toStringAsFixed(2),
              //   be: _be.toStringAsFixed(2),
              //   dateTime: DateTime.now(),
              // );

              final result = SaveFoodResult(
                portionName: _portionNameController.text,
                product: widget.product,
                eatenKcal: _calories,
                eatenCarbs: _carbs,
                ke: _ke.toStringAsFixed(2),
                be: _be.toStringAsFixed(2),
                dateTime: DateTime.now(),
              );

              Provider.of<FoodResultProvider>(
                context,
                listen: false,
              ).addResult(result);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Результат успешно сохранён!')),
              );
            },
            child: const Text(
              'Сохранить результат',
              style: TextStyle(fontFamily: 'Nunito'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldWithTitle(
    String title,
    IconData icon,
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontFamily: 'Nunito', fontSize: 18)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            icon: Icon(icon),
            label: Text(label, style: TextStyle(fontFamily: 'Nunito')),
            hint: Text(hint, style: TextStyle(fontFamily: 'Nunito')),
          ),
        ),
      ],
    );
  }
}
