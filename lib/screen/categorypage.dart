import 'package:flutter/material.dart';

class CategoryPageScreen extends StatefulWidget {
  const CategoryPageScreen({super.key});

  @override
  State<CategoryPageScreen> createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue,
            controller: tabController = TabController(length: 2, vsync: this),
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
                children: [Text("hll"), Text('gkk')]))
      ],
    );
  }
}
