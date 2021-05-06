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
        height: 400,
        child: transactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text('No Transactions yet',
                      style: Theme.of(context).textTheme.title),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: Image.asset('assets/img/Add_transaction.png',
                          height: 320, fit: BoxFit.cover))
                ],
              )
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
                        trailing: IconButton(
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





// Card(
//                       child: Row(children: <Widget>[
//                     Container(
//                       margin:
//                           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.purple, width: 2),
//                           color: Theme.of(context).primaryColorDark),
//                       padding: EdgeInsets.all(10),
//                       child: Text(
//                         '\$${transactions[index].amount.toStringAsFixed(2)}',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Theme.of(context).primaryColorLight),
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           transactions[index].title,
//                           style: Theme.of(context).textTheme.title,
//                         ),
//                         Text(
//                           DateFormat.yMMMd().format(transactions[index].date),
//                           style: TextStyle(fontSize: 16, color: Colors.grey),
//                         )
//                       ],
//                     )
//                   ])
//                   );