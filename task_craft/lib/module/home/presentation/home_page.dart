import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';
import 'package:task_craft/core/widgets/devider/divider.dart';
import 'package:task_craft/core/widgets/devider/divider_base.dart';
import 'package:task_craft/core/widgets/devider/text_divider.dart';
import 'package:task_craft/core/widgets/spinner/fade_dots.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("data"),
            Text("data"),
            Text("data"),
            BaseDivider(axis: Axis.horizontal),
            CDivider.text(
              text: "Hello World",
              position: TextDividerPosition.right,
            ),
            IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Text('Hello'),
                  BaseDivider(axis: Axis.vertical),
                  Text('World'),
                ],
              ),
            ),
            20.verticalSpace,
            Button.primary(
              fill: ButtonFill.solid,
              shape: ButtonShape.base,
              buttonSize: ButtonSize.large,
              isBlock: true,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadingFourSpinner(
                    color: Colors.white,
                    size: 20,
                  ),
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
