import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';

// TODO:
class AntInput extends StatefulWidget {
  const AntInput({
    super.key,
    required this.controller,
    this.placeholder,
    this.validator,
    this.disabled = true,
    this.isRequired = false,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.initialValue,
    this.labelText,
    this.keyboardType,
    this.onChanged,
  });

  final String? Function(String? value)? validator;
  final TextEditingController controller;
  final String? placeholder;
  final String? initialValue;
  final bool disabled;
  final bool isRequired;
  final bool readOnly;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String? labelText;
  final void Function(String value)? onChanged;

  @override
  State<AntInput> createState() => _AntInputState();
}

class _AntInputState extends State<AntInput> {
  final _focusNode = FocusNode();

  final _controller = TextEditingController();

  bool isVisibleClear = false;

  @override
  void didUpdateWidget(covariant AntInput oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? .4 : 1,
      child: Theme(
        data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            counterStyle: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 17,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
              height: 0.08,
              letterSpacing: 0.5,
            ),
            labelStyle: const TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 17,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
              height: 0.08,
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIconColor: const Color(0xff6C7E8B),
            suffixIconColor: const Color(0xff6C7E8B),
            filled: true,
            isDense: true,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CColor.border),
              borderRadius: BorderRadius.zero,
            ),
            enabledBorder: const OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.zero,
            ),
            disabledBorder: const UnderlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.zero,
            ),
            errorBorder: UnderlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderSide: BorderSide(color: CColor.danger),
              borderRadius: BorderRadius.zero,
            ),
            hintStyle: const TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 17,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
              height: 0.08,
              letterSpacing: 0.5,
            ),
            errorStyle: const TextStyle(
              color: Color(0xFFFF3141),
              fontSize: 13,
              fontFamily: 'Arial',
              fontWeight: FontWeight.w400,
            ),
            fillColor: Colors.white,
            suffixStyle: TextStyle(
              fontSize: 16.r,
            ),
          ),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.labelText != null)
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.isRequired ? 8 : 16,
                    right: 16,
                    top: 12,
                    bottom: 4,
                  ),
                  child: Row(
                    children: [
                      if (widget.isRequired)
                        Text(
                          '*',
                          style: TextStyle(
                            color: Color(0xFFFF3141),
                            fontSize: 15,
                            fontFamily: 'SimSun',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      Text(
                        widget.labelText ?? '',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 15,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              TextFormField(
                validator: widget.validator,
                controller: _controller,
                readOnly: widget.readOnly,
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
                initialValue: widget.initialValue,
                onChanged: (value) {
                  setState(() {
                    isVisibleClear =
                        _controller.text.isNotEmpty || _controller.text != "";
                  });
                  widget.onChanged?.call(value);
                },
                decoration: InputDecoration(
                  hintText: widget.placeholder,
                  enabled: !widget.disabled,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.suffixIcon ?? const SizedBox(),
                      if (isVisibleClear)
                        IconButton(
                          onPressed: () {
                            _controller.text = "";
                            setState(() {
                              isVisibleClear = _controller.text.isNotEmpty ||
                                  _controller.text != "";
                            });
                          },
                          icon: const Icon(
                            CustomIcons.closecircle,
                            size: 20,
                            color: Color(0xffABABAB),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
