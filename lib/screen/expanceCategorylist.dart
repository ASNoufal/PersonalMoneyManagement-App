import 'package:flutter/material.dart';
import 'package:pmm/db/categorydb.dart';

class ExpanceCategoryList extends StatelessWidget {
  const ExpanceCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Category().expenxecategory,
        builder: (context, newvalue, _) {
          return ListView.separated(
              itemBuilder: ((context, index) => Card(
                    child: ListTile(
                      leading: Text(newvalue[index].name),
                      trailing: IconButton(
                        onPressed: () {
                          Category().deleteitems(newvalue[index].id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  )),
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: newvalue.length);
        });
  }
}
