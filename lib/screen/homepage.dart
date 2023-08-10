import 'package:flutter/material.dart';
import 'package:pmm/db/transactiondb.dart';
import 'package:pmm/model/datamodel.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB().refreshtransactionui();
    return ValueListenableBuilder(
        valueListenable: TransactionDB().Transactionvaluenotifier,
        builder: (context, newvalue, _) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    radius: 42,
                    child: Text("12\ndec"),
                    backgroundColor: newvalue[index].type == CategoryType.income
                        ? Colors.red
                        : Colors.green,
                  ),
                  title: Text(newvalue[index].purpose),
                  subtitle: Text(newvalue[index].amount.toString()),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: newvalue.length);
        });
  }
}
