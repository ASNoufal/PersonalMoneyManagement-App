import 'package:flutter/material.dart';
import 'package:pmm/db/categorydb.dart';
import 'package:pmm/model/datamodel.dart';
import 'package:pmm/screen/expanceCategorylist.dart';
import 'package:pmm/screen/incomeCategorylist.dart';

class CategoryPageScreen extends StatefulWidget {
  const CategoryPageScreen({super.key});

  @override
  State<CategoryPageScreen> createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    Category().getcategory().then((value) => print(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            controller: tabController,
            tabs: const [
              Tab(
                iconMargin: EdgeInsets.only(bottom: 10),
                text: 'Income',
              ),
              Tab(
                text: "Expance",
                iconMargin: EdgeInsets.all(50),
              )
            ]),
        Expanded(
            child: TabBarView(
                controller: tabController,
                children: const [IncomeCategoryList(), ExpanceCategoryList()]))
      ],
    );
  }
}
