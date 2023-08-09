import 'package:flutter/material.dart';
import 'package:pmm/db/categorydb.dart';
import 'package:pmm/model/datamodel.dart';

ValueNotifier<CategoryType> currentvalue = ValueNotifier(CategoryType.income);
TextEditingController textcontroller = TextEditingController();

Future<void> categoryfloatingfunction(BuildContext context) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text("Add Category"),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: textcontroller,
                  decoration: const InputDecoration(
                      hintText: "Add", border: OutlineInputBorder())),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  RadioButton(title: "Income", type: CategoryType.income),
                  RadioButton(title: "Expance", type: CategoryType.expance),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    final text = textcontroller.text;
                    if (text.isEmpty) {
                      return;
                    }
                    final category = CategoryModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: text,
                        type: currentvalue.value);
                    Category().insertcategory(category);
                    textcontroller.clear();
                    Navigator.pop(ctx);
                  },
                  child: const Text("ok")),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  const RadioButton({super.key, required this.title, required this.type});

  final String title;
  final CategoryType type;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: currentvalue,
            builder: (context, CategoryType index, _) {
              return Radio<CategoryType>(
                  value: type,
                  groupValue: index,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    currentvalue.value = value;
                  });
            }),
        Text(title),
      ],
    );
  }
}
