import 'package:expense_tracker/db/database.dart';
import 'package:flutter/material.dart';
import '../db/database.dart';

class TransactionQ {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
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
}
