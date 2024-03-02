import 'package:flutter/material.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/widgets/button/enums.dart';

import 'utils.dart';

class SuccessButton extends StatelessWidget {
  const SuccessButton({
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
    print(fill);
    return Opacity(
      opacity: onPressed != null ? 1 : 0.4,
      child: RawMaterialButton(
        shape: buttonShape(
          shape: shape!,
          fill: fill,
          buttonType: ButtonType.success,
        ),
        textStyle: buttonTextStyle(
          fill: fill,
          buttonSize: buttonSize!,
          buttonType: ButtonType.success,
        ),
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        splashColor: CColor.success.shade50.withOpacity(0.4),
        fillColor:
            fill == ButtonFill.solid ? CColor.success : Colors.transparent,
        constraints: buttonConstants(buttonSize: buttonSize!, isBlock: isBlock),
        padding: buttonPadding(buttonSize: buttonSize!),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
