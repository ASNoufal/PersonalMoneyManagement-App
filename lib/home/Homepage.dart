import 'package:flutter/material.dart';
import 'package:pmm/add%20transaction/screen_add_transaction.dart';
import 'package:pmm/db/categorydb.dart';
import 'package:pmm/floatingButton/categoryfuncyion.dart';
import 'package:pmm/model/datamodel.dart';
import 'package:pmm/screen/categorypage.dart';
import 'package:pmm/screen/homepage.dart';
import 'package:pmm/widget/bottomnavigaton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static ValueNotifier<int> selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List page = [const HomePageScreen(), const CategoryPageScreen()];
    return Scaffold(
        appBar: AppBar(
          title: const Text("MONEY MANAGER"),
        ),
        floatingActionButton: CircleAvatar(
            radius: 30,
            child: IconButton(
                onPressed: () {
                  if (selectedindex.value == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ScreenAddTransaction();
                    }));
                    print("income");
                  } else {
                    categoryfloatingfunction(context);
                    // final sample = CategoryModel(
                    //     id: DateTime.now().microsecondsSinceEpoch.toString(),
                    //     name: "naufal",
                    //     type: CategoryType.income);
                    // Category().insertcategory(sample);
                    // print("expance");
                  }
                },
                icon: const Icon(Icons.add))),
        bottomNavigationBar: const BottomNavigationWidget(),
        body: ValueListenableBuilder(
            valueListenable: selectedindex,
            builder: (context, index, child) {
              return page[index];
            }));
  }
}
