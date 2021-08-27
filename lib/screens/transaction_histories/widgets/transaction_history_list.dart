import 'package:flutter/material.dart';
import 'package:late_pos/models/transaction_history_model.dart';
import 'package:late_pos/widget/transaction_list.dart';

class TransactionHistoryList extends StatelessWidget {
  final List titles;
  final List<TransactionHistoryModel> transactionHistories;
  final Function(TransactionHistoryModel) onTap;

  const TransactionHistoryList(
      {@required this.titles,
      @required this.transactionHistories,
      this.onTap,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionList(
      titles: titles,
      transactions: transactionHistories,
      onTap: (transactionHistory) {
        onTap(transactionHistory);
      },
    );
  }
}
