import 'package:flutter/material.dart';
import 'package:task_craft/app/app_router.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CustomIcons.more),
          ),
        ],
      ),
      body: ListView(
        children: [
          Button.primary(
            fill: ButtonFill.solid,
            child: Text("TODO"),
            onPressed: () {
              router.go('/todo');
            },
          )
        ],
      ),
    );
  }
}
