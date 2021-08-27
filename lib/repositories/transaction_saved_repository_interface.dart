import 'package:late_pos/models/transaction_saved_model.dart';

abstract class ITransactionSavedRepository {
  List<TransactionSavedModel> getAllTransactionsSaved();
}