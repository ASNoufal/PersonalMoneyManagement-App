import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pmm/model/transactionModel/transactionmodel.dart';

const boxname = 'tranasactionBox';

abstract class Transaction {
  Future<void> addtransaction(TransactionModel model);
  Future<List<TransactionModel>> gettransaction();
}

class TransactionDB implements Transaction {
  TransactionDB._internal();

  static final instance = TransactionDB._internal();
  factory TransactionDB() {
    return instance;
  }
  ValueNotifier<List<TransactionModel>> Transactionvaluenotifier =
      ValueNotifier([]);
  @override
  Future<void> addtransaction(TransactionModel model) async {
    final transactionBox = await Hive.openBox<TransactionModel>(boxname);

    await transactionBox.put(model.id, model);
  }

  Future<void> refreshtransactionui() async {
    final alltransaction = await gettransaction();
    Transactionvaluenotifier.value.clear();
    Transactionvaluenotifier.value.addAll(alltransaction);
    Transactionvaluenotifier.notifyListeners();
  }

  @override
  Future<List<TransactionModel>> gettransaction() async {
    final transactionBox = await Hive.openBox<TransactionModel>(boxname);
    return transactionBox.values.toList();
  }
}
