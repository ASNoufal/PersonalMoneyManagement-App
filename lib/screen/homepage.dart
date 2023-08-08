import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return const ListTile(
            leading: CircleAvatar(radius: 42, child: Text("12\ndec")),
            title: Text('1000'),
            subtitle: Text('Salary'),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 10);
  }
}
