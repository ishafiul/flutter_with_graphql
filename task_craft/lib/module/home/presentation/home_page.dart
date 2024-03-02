import 'package:flutter/material.dart';
import 'package:task_craft/core/widgets/button/base_button.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Text("data"),
            Button.danger(
              fill: ButtonFill.outline,
              shape: ButtonShape.base,
              buttonSize: ButtonSize.small,
              isBlock: false,
              child: const Text("dsf"),
            ),
          ],
        ),
      ),
    );
  }
}
