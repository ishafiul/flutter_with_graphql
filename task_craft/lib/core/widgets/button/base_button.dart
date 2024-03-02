import 'package:flutter/material.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/widgets/button/utils.dart';

import 'enums.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    this.fill = ButtonFill.solid,
    this.onPressed,
    this.shape = ButtonShape.base,
    this.buttonSize = ButtonSize.middle,
    this.isBlock = false,
    required this.child,
  });

  final ButtonFill? fill;
  final ButtonShape? shape;
  final ButtonSize? buttonSize;
  final void Function()? onPressed;

  final bool isBlock;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed != null ? 1 : 0.4,
      child: RawMaterialButton(
        shape: buttonShape(
          shape: shape!,
          fill: fill,
        ),
        textStyle: buttonTextStyle(
          fill: fill,
          buttonSize: buttonSize!,
        ),
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        fillColor: fill == ButtonFill.solid ? Colors.white : Colors.transparent,
        constraints: buttonConstants(buttonSize: buttonSize!, isBlock: isBlock),
        padding: buttonPadding(
          buttonSize: buttonSize!,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
