import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmm/db/categorydb.dart';
import 'package:pmm/db/transactiondb.dart';
import 'package:pmm/model/datamodel.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});
  String date(DateTime date) {
    var format = DateFormat.MMMd();
    var dates = format.format(date);
    var da = dates.split(' ');
    return "${da.last}\n ${da.first}";
  }

  @override
  Widget build(BuildContext context) {
    TransactionDB().refreshtransactionui();
    Category().refreshui();
    return ValueListenableBuilder(
        valueListenable: TransactionDB().Transactionvaluenotifier,
        builder: (context, newvalue, _) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 42,
                    backgroundColor: newvalue[index].type == CategoryType.income
                        ? Colors.red
                        : Colors.green,
                    child: Text(date(newvalue[index].date)),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      TransactionDB().deleteitems(newvalue[index].id!);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
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
