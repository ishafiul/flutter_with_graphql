import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/widgets/bottom_sheet/scrollable_bottom_sheet.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';
import 'package:task_craft/core/widgets/devider/divider.dart';
import 'package:task_craft/core/widgets/devider/divider_base.dart';
import 'package:task_craft/core/widgets/devider/text_divider.dart';
import 'package:task_craft/core/widgets/input.dart';
import 'package:task_craft/core/widgets/spinner/fade_dots.dart';

final _formKey = GlobalKey<FormState>();

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xfffcfbfa),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("data"),
              const Text("data"),
              const Text("data"),
              BaseDivider(axis: Axis.horizontal),
              CDivider.text(
                text: "Hello World",
                position: TextDividerPosition.right,
              ),
              TextInputField(
                controller: controller,
                placeholder: "sdsd",
                disabled: false,
                isRequired: true,
                labelText: "Index",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value != "ishaf") {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (value) {
                  _formKey.currentState!.validate();
                },
              ),
              12.verticalSpace,
              TextInputField(
                controller: controller,
                placeholder: "sdsd",
                disabled: false,
              ),
              12.verticalSpace,
              TextInputField(
                controller: controller,
                placeholder: "sdsd",
                disabled: false,
              ),
              12.verticalSpace,
              IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    const Text('Hello'),
                    BaseDivider(axis: Axis.vertical),
                    const Text('World'),
                  ],
                ),
              ),
              const TextField(),
              20.verticalSpace,
              Button.primary(
                fill: ButtonFill.solid,
                shape: ButtonShape.base,
                buttonSize: ButtonSize.large,
                isBlock: true,
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) =>
                        const ScrollableBottomSheet(child: Text("data")),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const FadingFourSpinner(
                      color: Colors.white,
                      size: 20,
                    ),
                    8.horizontalSpace,
                    const Text("Loading"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
