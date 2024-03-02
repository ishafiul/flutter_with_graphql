import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/widgets/button/base_button.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';
import 'package:task_craft/core/widgets/spinner/fade_dots.dart';

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
            FadingFourSpinner(color: Colors.black, size: 20,),
            Button.primary(
              fill: ButtonFill.solid,
              shape: ButtonShape.base,
              buttonSize: ButtonSize.large,
              isBlock: true,

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadingFourSpinner(color: Colors.white, size: 20,),
                  8.horizontalSpace,
                  Text("Loading")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
