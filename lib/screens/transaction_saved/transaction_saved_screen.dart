import 'package:flutter/material.dart';
import 'package:late_pos/models/transaction_saved_model.dart';
import 'package:late_pos/repositories/impl/transaction_saved_repository.dart';
import 'package:late_pos/screens/transaction_saved/widgets/transaction_saved_list.dart';
import 'package:late_pos/screens/transaction_saved/widgets/transaction_saved_selected.dart';

class TransactionSavedScreen extends StatefulWidget {
  const TransactionSavedScreen({Key key}) : super(key: key);

  @override
  _TransactionSavedScreenState createState() => _TransactionSavedScreenState();
}

class _TransactionSavedScreenState extends State<TransactionSavedScreen> {
  TransactionSavedRepository _transactionSavedRepository = TransactionSavedRepository();
  List titles = ["Tunai", "Jam", "Nama", "Notes"];
  List<TransactionSavedModel> _transactionsSaved;

  TransactionSavedModel _selectedTransactionSaved;

  @override
  void initState() {
    super.initState();
    _transactionsSaved = _transactionSavedRepository.getAllTransactionsSaved();

    _selectedTransactionSaved = _transactionsSaved[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transaksi Tersimpan"),
        leading: BackButton(),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: TransactionSavedList(
                titles: titles,
                transactionsSaved: _transactionsSaved,
                onTap: (transactionSaved) {
                  _selectedTransactionSaved = transactionSaved;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: TransactionSavedSelected(transactionSavedModel: _selectedTransactionSaved,),
            )
          ],
        ),
      ),
    );
  }
}
