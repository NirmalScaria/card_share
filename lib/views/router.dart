import 'package:card_share/exports.dart';
import 'package:flutter/material.dart';

class MyRouter extends StatefulWidget {
  const MyRouter({super.key});

  @override
  State<MyRouter> createState() => _MyRouterState();
}

class _MyRouterState extends State<MyRouter> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
