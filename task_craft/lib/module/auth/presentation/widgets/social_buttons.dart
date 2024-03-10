import 'package:flutter/material.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';
import 'package:task_craft/core/widgets/snackbar.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.paddingHorizontal(),
      child: Column(
        children: [
          Button(
            fill: ButtonFill.outline,
            shape: ButtonShape.rectangular,
            buttonSize: ButtonSize.large,
            isBlock: true,
            onPressed: () {
              showSnackBar(
                message:
                    "messagddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddde",
                type: SnackBarType.info,
                withIcon: true,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CustomIcons.facebook_filled,
                  color: Color(0xff316FF6),
                ),
                Text("Continue with Facebook"),
                Icon(
                  CustomIcons.facebook_filled,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          Button(
            fill: ButtonFill.outline,
            shape: ButtonShape.rectangular,
            buttonSize: ButtonSize.large,
            isBlock: true,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CustomIcons.google_square,
                ),
                Text("Continue with Google"),
                Icon(
                  CustomIcons.facerecognition,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          Button(
            fill: ButtonFill.outline,
            shape: ButtonShape.rectangular,
            buttonSize: ButtonSize.large,
            isBlock: true,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  CustomIcons.apple_filled,
                  color: Color(0xffA2AAAD),
                ),
                Text("Continue with Apple"),
                Icon(
                  CustomIcons.facerecognition,
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
        ].withSpaceBetween(height: 16),
      ),
    );
  }
}
