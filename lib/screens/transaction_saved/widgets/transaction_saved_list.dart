import 'package:flutter/material.dart';
import 'package:late_pos/models/transaction_saved_model.dart';
import 'package:late_pos/widget/transaction_list.dart';

class TransactionSavedList extends StatelessWidget {
  final List titles;
  final List<TransactionSavedModel> transactionsSaved;
  final Function(TransactionSavedModel) onTap;

  const TransactionSavedList(
      {@required this.titles,
      @required this.transactionsSaved,
      this.onTap,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionList(
      titles: titles,
      transactions: transactionsSaved,
      onTap: (transactionSaved) {
        onTap(transactionSaved);
      },
    );
  }
}
