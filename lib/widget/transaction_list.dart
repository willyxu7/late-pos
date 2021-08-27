import 'package:flutter/material.dart';
import 'package:late_pos/models/transaction_list_model.dart';

class TransactionList extends StatelessWidget {
  final List titles;
  final List<TransactionListModel> transactions;
  final Function(TransactionListModel) onTap;

  const TransactionList(
      {this.titles, this.transactions, this.onTap, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (content, index) {
              return Card(
                margin: EdgeInsets.all(5),
                elevation: 5,
                child: InkWell(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(color: Colors.grey),
                              child: Text(
                                transactions[index].date,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: Text(titles[0])),
                          Expanded(child: Text(titles[1])),
                          Expanded(child: Text(titles[2])),
                          Expanded(child: Text(titles[3])),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            transactions[index].grandTotal.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            transactions[index].time,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            transactions[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Expanded(
                              child: Text(
                            transactions[index].note,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    onTap(transactions[index]);
                  },
                ),
              );
            }));
  }
}
