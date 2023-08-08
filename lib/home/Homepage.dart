import 'package:flutter/material.dart';
import 'package:pmm/screen/categorypage.dart';
import 'package:pmm/screen/homepage.dart';
import 'package:pmm/widget/bottomnavigaton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static ValueNotifier<int> selectedindex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List page = [HomePageScreen(), CategoryPageScreen()];
    return Scaffold(
        appBar: AppBar(
          title: const Text("MONEY MANAGER"),
        ),
        floatingActionButton:
            const CircleAvatar(radius: 30, child: Icon(Icons.add)),
        bottomNavigationBar: BottomNavigationWidget(),
        body: ValueListenableBuilder(
            valueListenable: selectedindex,
            builder: (context, index, child) {
              return page[index];
            }));
  }
}
