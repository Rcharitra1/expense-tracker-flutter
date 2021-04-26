import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../model/transaction.dart';
import 'package:uuid/uuid.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 100.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Hoodies', amount: 12.99, date: DateTime.now())
  ];
  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: Uuid().v4().substring(0, 8));
    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_transactions)
      ],
    );
  }
}
