import 'package:late_pos/models/transaction_saved_model.dart';
import 'package:late_pos/repositories/transaction_saved_repository_interface.dart';

class TransactionSavedRepository implements ITransactionSavedRepository {
  @override
  List<TransactionSavedModel> getAllTransactionsSaved() {
    List<TransactionSavedModel> transactionsSaved = [
      TransactionSavedModel(
        code: "TSVM1627377855",
        grandTotal: 5000,
        time: "16:24",
        orders: "Kopi Panas",
        name: "Merry",
        date: "27 Juli 2021",
        note: "Tersimpan",
      ),
      TransactionSavedModel(
          code: "TSVM75893747454",
          grandTotal: 10000,
          time: "16:40",
          orders: "Kopi Susu Es",
          name: "Willy",
          date: "29 Juli 2021",
          note: "Tersimpan"),
    ];

    return transactionsSaved;
  }
}