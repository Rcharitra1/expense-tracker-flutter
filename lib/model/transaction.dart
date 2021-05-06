import 'package:expense_tracker/db/database.dart';
import 'package:flutter/material.dart';
import '../db/database.dart';

class TransactionQ {
  String id;
  String title;
  double amount;
  String date;
  TransactionQ(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_ID: id,
      DatabaseProvider.COLUMN_TITLE: title,
      DatabaseProvider.COLUMN_AMOUNT: amount,
      DatabaseProvider.COLUMN_DATE: date
    };

    return map;
  }

  TransactionQ.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    title = map[DatabaseProvider.COLUMN_TITLE];
    amount = map[DatabaseProvider.COLUMN_AMOUNT];
    date = map[DatabaseProvider.COLUMN_DATE];
  }
}
