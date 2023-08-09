import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pmm/db/categorydb.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Category().incomecategory,
        builder: (context, newvalue, _) {
          return Card(
            child: ListView.separated(
                itemBuilder: ((context, index) => ListTile(
                    leading: Text(newvalue[index].name),
                    trailing: IconButton(
                        onPressed: () {
                          Category().deleteitems(newvalue[index].id);
                        },
                        icon: const Icon(Icons.delete)))),
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: newvalue.length),
          );
        });
  }
}
