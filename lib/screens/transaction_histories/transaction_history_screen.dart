import 'package:flutter/material.dart';
import 'package:late_pos/models/transaction_history_model.dart';
import 'package:late_pos/repositories/impl/transacion_history_repository.dart';
import 'package:late_pos/screens/transaction_histories/widgets/transaction_history_list.dart';
import 'package:late_pos/screens/transaction_histories/widgets/transaction_history_selected.dart';
import 'package:late_pos/widget/my_drawer.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({Key key}) : super(key: key);

  @override
  _TransactionHistoryScreenState createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  int _selectedDestination = 1;
  TransactionHistoryRepository _transactionHistoryRepository = TransactionHistoryRepository();
  List titles = ["Tunai", "Jam", "Nama", "Notes"];
  List<TransactionHistoryModel> _transactionHistories;

  TransactionHistoryModel _selectedTransactionHistory;

  @override
  void initState() {
    super.initState();
    _transactionHistories = _transactionHistoryRepository
      .getAllTransactionHistories();

    _selectedTransactionHistory = _transactionHistories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat Transaksi"),
      ),
      drawer: MyDrawer(
        selectedDestination: _selectedDestination,
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: TransactionHistoryList(
                  titles: titles,
                  transactionHistories: _transactionHistories,
                  onTap: (transactionHistory) {
                    _selectedTransactionHistory = transactionHistory;
                    setState(() {});
                  },
                )),
            Expanded(
              flex: 3,
              child: TransactionHistorySelected(
                  transactionHistory: _selectedTransactionHistory),
            )
          ],
        ),
      ),
    );
  }
}
