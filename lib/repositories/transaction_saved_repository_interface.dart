import 'package:late_pos/models/transaction_saved_model.dart';
import 'dart:async';

abstract class ITransactionSavedRepository {
  List<TransactionSavedModel> getAllTransactionsSaved();

  Future<List<TransactionSavedModel>> transactionSaveds();
}