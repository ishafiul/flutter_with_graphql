import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/const.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/button/base_button.dart';
import 'package:task_craft/core/widgets/button/primary_button.dart';
import 'package:task_craft/core/widgets/button/success_button.dart';
import 'package:task_craft/core/widgets/button/warning_button.dart';

import 'danger_button.dart';
import 'enums.dart';

/// custom button
class Button extends StatelessWidget {
  /// on press button
  final Function()? onPressed;

  /// [ButtonType]
  late final ButtonType? buttonType;
  final ButtonFill? fill;
  final ButtonShape? shape;

  final ButtonSize? buttonSize;

  final bool? isBlock;

  final Widget child;

  ///basic button
  Button({
    super.key,
    this.onPressed,
    this.fill,
    this.shape,
    this.buttonSize = ButtonSize.middle,
    this.isBlock = false,
    required this.child,
  }) {
    buttonType = ButtonType.base;
  }

  /// text button
  Button.primary({
    super.key,
    this.onPressed,
    this.fill,
    this.shape,
    this.buttonSize = ButtonSize.middle,
    this.isBlock = false,
    required this.child,
  }) {
    buttonType = ButtonType.primary;
  }

  /// outline button
  Button.success({
    super.key,
    this.onPressed,
    this.fill,
    this.shape,
    this.buttonSize = ButtonSize.middle,
    this.isBlock = false,
    required this.child,
  }) {
    buttonType = ButtonType.success;
  }

  /// filled button
  Button.warning({
    super.key,
    this.onPressed,
    this.fill,
    this.shape,
    this.buttonSize = ButtonSize.middle,
    this.isBlock = false,
    required this.child,
  }) {
    buttonType = ButtonType.warning;
  }

  /// secondary button
  Button.danger({
    super.key,
    this.onPressed,
    this.fill,
    this.shape,
    this.buttonSize = ButtonSize.middle,
    this.isBlock = false,
    required this.child,
  }) {
    buttonType = ButtonType.danger;
  }

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.primary:
        return PrimaryButton(
          fill: fill,
          onPressed: onPressed,
          shape: shape,
          isBlock: isBlock!,
          buttonSize: buttonSize,
          child: child,
        );
      case ButtonType.success:
        return SuccessButton(
          fill: fill,
          onPressed: onPressed,
          shape: shape,
          isBlock: isBlock!,
          buttonSize: buttonSize,
          child: child,
        );
      case ButtonType.warning:
        return WarningButton(
          fill: fill,
          onPressed: onPressed,
          shape: shape,
          isBlock: isBlock!,
          buttonSize: buttonSize,
          child: child,
        );
      case ButtonType.danger:
        return DangerButton(
          fill: fill,
          onPressed: onPressed,
          shape: shape,
          isBlock: isBlock!,
          buttonSize: buttonSize,
          child: child,
        );
      default:
        return BaseButton(
          fill: fill,
          onPressed: onPressed,
          shape: shape,
          isBlock: isBlock!,
          child: child,
          buttonSize: buttonSize,
        );
    }
  }
}
