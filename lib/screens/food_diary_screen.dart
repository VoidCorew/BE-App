import 'package:be_app/providers/food_result_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class FoodDiaryScreen extends StatefulWidget {
  const FoodDiaryScreen({super.key});

  @override
  State<FoodDiaryScreen> createState() => _FoodDiaryScreenState();
}

class _FoodDiaryScreenState extends State<FoodDiaryScreen> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodResultProvider = context.watch<FoodResultProvider>();
    final resultsForSelectedDate = foodResultProvider.getResultsByDate(today);
    final TextStyle style = TextStyle(fontFamily: 'Nunito');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Дневник питания',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: "ru_RU",
            rowHeight: 43,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today,
            firstDay: DateTime.utc(2019, 10, 18),
            lastDay: DateTime.utc(2030, 4, 20),
            pageAnimationDuration: Duration(milliseconds: 400),
            onDaySelected: _onDaySelected,
          ),
          const SizedBox(height: 20),
          Text(
            'Ваши записи за ${DateFormat('yyyy-MM-dd').format(today)}',
            style: const TextStyle(fontSize: 23, fontFamily: 'Nunito'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: resultsForSelectedDate.isEmpty
                ? Center(
                    child: Text('Нет результатов за этот день', style: style),
                  )
                : ListView.separated(
                    itemCount: foodResultProvider.results.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final result = foodResultProvider.results[index];
                      return ListTile(
                        title: Text(
                          '${result.portionName} - ${result.product.name}',
                          style: style,
                        ),
                        subtitle: Text(
                          'Ккал: ${result.eatenKcal} | Углеводы: ${result.eatenCarbs} | BE: ${result.be} | KE: ${result.ke}',
                          style: style,
                        ),
                        trailing: Text(
                          '${result.dateTime.hour}:${result.dateTime.minute.toString().padLeft(2, '0')}',
                          style: style,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
