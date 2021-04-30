import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  void addTx() {
    final enteredTitile = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitile.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(titleInput.text, double.parse(amountInput.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleInput,
                  onSubmitted: (_) => addTx(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountInput,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => addTx(),
                ),
                TextButton(
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: addTx)
              ]),
        ));
  }
}
