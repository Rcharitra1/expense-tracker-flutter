import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  DateTime pickedDate;
  void addTx() {
    final enteredTitile = titleInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitile.isEmpty || enteredAmount <= 0 || pickedDate == null) {
      return;
    }
    widget.addNewTransaction(
        titleInput.text, double.parse(amountInput.text), (pickedDate));

    Navigator.of(context).pop();
  }

  void _viewDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        pickedDate = date;
      });
    });
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
                Container(
                  height: 70,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: Text(pickedDate == null
                          ? 'No Date chosen'
                          : 'Picked date: ${DateFormat.yMMMd().format(pickedDate)}'),
                    ),
                    TextButton(
                        onPressed: _viewDatePicker,
                        child: Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ]),
                ),
                ElevatedButton(
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: addTx)
              ]),
        ));
  }
}
