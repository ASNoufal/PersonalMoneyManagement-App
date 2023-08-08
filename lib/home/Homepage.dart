import 'package:flutter/material.dart';
import 'package:pmm/screen/categorypage.dart';
import 'package:pmm/screen/homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MONEY MANAGER"),
      ),
      floatingActionButton:
          const CircleAvatar(radius: 30, child: Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.expand_circle_down), label: 'Category')
        ],
      ),
      body: selectedindex == 0
          ? const HomePageScreen()
          : const CategoryPageScreen(),
    );
  }
}
