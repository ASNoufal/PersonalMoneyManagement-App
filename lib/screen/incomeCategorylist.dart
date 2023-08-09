import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
                leading: Text("Income Category list $index"),
              )),
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 10),
    );
  }
}
