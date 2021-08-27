import 'package:late_pos/models/transaction_history_model.dart';

abstract class ITransactionHistoryRepository {
  List<TransactionHistoryModel> getAllTransactionHistories();

  Future<List<TransactionHistoryModel>> getTransactionHistories();
}