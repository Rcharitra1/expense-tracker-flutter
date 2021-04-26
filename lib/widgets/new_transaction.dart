import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleInput = TextEditingController();
  final amountInput = TextEditingController();
  void addTx() {
    addNewTransaction(titleInput.text, double.parse(amountInput.text));
  }

  final Function addNewTransaction;
  NewTransaction(this.addNewTransaction);
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: titleInput,
                  onFieldSubmitted: (_) => addTx,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Amount'),
                  controller: amountInput,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (_) => addTx,
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
