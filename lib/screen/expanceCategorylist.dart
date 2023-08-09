import 'package:flutter/material.dart';

class ExpanceCategoryList extends StatelessWidget {
  const ExpanceCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
                leading: Text("Expance Category list $index"),
              )),
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 10),
    );
  }
}
