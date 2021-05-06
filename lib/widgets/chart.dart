import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      // print(totalSum);
      // print(DateFormat.E().format(weekDay));
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).toList().reversed.toList();
  }

  double get maxSpending {
    double totalAmount = 0.0;
    groupedTransactionValues.forEach((element) {
      totalAmount += element['amount'];
    });
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBar(
                      data['day'],
                      data['amount'],
                      maxSpending == 0.0
                          ? 0.0
                          : (data['amount'] as double) / maxSpending));
            }).toList(),
          )),
    );
  }
}
