import 'package:late_pos/models/transaction_history_model.dart';
import 'package:late_pos/repositories/transaction_history_repository_interface.dart';

class TransactionHistoryRepository implements ITransactionHistoryRepository {
  @deprecated
  @override
  List<TransactionHistoryModel> getAllTransactionHistories() {
    List<TransactionHistoryModel> transactionHistories = [
      TransactionHistoryModel(
        code: "FOKM1627377855",
        grandTotal: 5000,
        time: "16:24",
        orders: "Kopi Panas",
        name: "Tomo",
        date: "27 Juli 2021",
        note: "Catatan",
      ),
      TransactionHistoryModel(
          code: "FOKM75893747454",
          grandTotal: 10000,
          time: "16:40",
          orders: "Kopi Susu Es",
          name: "Willy",
          date: "29 Juli 2021",
          note: "Catatan"),
    ];

    return transactionHistories;
  }

  @override
  Future<List<TransactionHistoryModel>> getTransactionHistories() async {
    List<TransactionHistoryModel> transactionHistories = [
      TransactionHistoryModel(
        code: "FOKM1627377855",
        grandTotal: 5000,
        time: "16:24",
        orders: "Kopi Panas",
        name: "Tomo",
        date: "27 Juli 2021",
        note: "Catatan",
      ),
      TransactionHistoryModel(
          code: "FOKM75893747454",
          grandTotal: 10000,
          time: "16:40",
          orders: "Kopi Susu Es",
          name: "Willy",
          date: "29 Juli 2021",
          note: "Catatan"),
    ];

    return Future.delayed(Duration(milliseconds: 300), () => transactionHistories);
  }
}
