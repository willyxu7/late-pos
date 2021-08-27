import 'package:flutter/material.dart';
import 'package:late_pos/models/transaction_saved_model.dart';
import 'package:late_pos/widget/transaction_selected.dart';

class TransactionSavedSelected extends StatefulWidget {
  final TransactionSavedModel transactionSavedModel;

  const TransactionSavedSelected({
    this.transactionSavedModel,
    Key key}) : super(key: key);

  @override
  _TransactionSavedSelectedState createState() => _TransactionSavedSelectedState();
}

class _TransactionSavedSelectedState extends State<TransactionSavedSelected> {
  @override
  Widget build(BuildContext context) {
    return TransactionSelected(transactionListModel: widget.transactionSavedModel,);
  }
}
