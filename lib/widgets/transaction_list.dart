import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionQ> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  void deleteSelectedTransaction(String id) {
    deleteTransaction(id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text('No Transactions yet',
                        style: Theme.of(context).textTheme.title),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        child: Image.asset('assets/img/Add_transaction.png',
                            height: constraints.maxHeight * 0.6,
                            fit: BoxFit.cover))
                  ],
                );
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: FittedBox(
                                child: Text(
                                    '\$${transactions[index].amount.toStringAsFixed(2)}')),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(DateFormat.yMMMd()
                            .format(DateTime.parse(transactions[index].date))),
                        trailing: MediaQuery.of(context).size.width > 460
                            ? FlatButton.icon(
                                icon: Icon(Icons.delete,
                                    color: Theme.of(context).errorColor),
                                onPressed: () =>
                                    {deleteTransaction(transactions[index].id)},
                                label: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Theme.of(context).errorColor),
                                ),
                              )
                            : IconButton(
                                icon: Icon(Icons.delete,
                                    color: Theme.of(context).errorColor),
                                onPressed: () =>
                                    {deleteTransaction(transactions[index].id)},
                              ),
                      ));
                },
                itemCount: transactions.length));
  }
}
