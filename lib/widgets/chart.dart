import 'package:expense_tracker_project/models/transaction.dart';
import 'package:expense_tracker_project/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      num totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    });
  }

  num get maxSpend {
    return groupedTransactionValues.fold(
        0, (previousValue, element) => previousValue + element['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues
            .map((data) => ChartBar(data['day'], data['amount'],
                maxSpend == 0 ? 0.0 : (data['amount'] as num) / maxSpend))
            .toList(),
      ),
    );
  }
}
