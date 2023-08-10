import 'package:flutter/material.dart';
import 'package:pmm/db/categorydb.dart';
import 'package:pmm/db/transactiondb.dart';
import 'package:pmm/home/Homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pmm/model/datamodel.dart';
import 'package:pmm/model/transactionModel/transactionmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }
  final obj1 = Category();
  final obj2 = Category();
  final obj3 = TransactionDB();
  final obj4 = TransactionDB();
  print(obj3 == obj4);
  print(obj1 == obj2);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
