import 'package:flutter/material.dart';
import 'package:pmm/home/Homepage.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HomePage.selectedindex,
        builder: (context, index, _) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              HomePage.selectedindex.value = value;
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.expand_circle_down), label: 'Category')
            ],
          );
        });
  }
}
