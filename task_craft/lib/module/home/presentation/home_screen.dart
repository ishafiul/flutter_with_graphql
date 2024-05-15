import 'package:flutter/material.dart';
import 'package:task_craft/app/app_router.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/module/home/presentation/widgets/toda_todo_update.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Craft"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              router.go('/menu');
            },
            icon: const Icon(CustomIcons.more),
          ),
        ],
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: TodayTodoUpdate(),
          ),
        ],
      ),
    );
  }
}
