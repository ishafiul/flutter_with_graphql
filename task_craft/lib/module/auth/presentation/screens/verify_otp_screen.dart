import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm your number"),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          color: CColor.backgroundColor,
          padding: const EdgeInsets.only(top: 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SafeArea(
                  child: Padding(
                    padding: 24.paddingHorizontal(),
                    child: Button.primary(
                      fill: ButtonFill.solid,
                      shape: ButtonShape.rectangular,
                      buttonSize: ButtonSize.large,
                      isBlock: true,
                      onPressed: () {},
                      child: const Text("Continue"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          16.verticalSpace,
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 250),
              child: RichText(
                text: TextSpan(
                  text: "Please enter the verification code sent to ",
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "shafiulislam20@gmail.com",
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          16.verticalSpace,
          Padding(
            padding: 24.paddingHorizontal(),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Pinput(
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(30, 60, 87, 1),
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: CColor.backgroundColor,
                        border: const Border(
                          bottom: BorderSide(
                            color: Color.fromRGBO(234, 239, 243, 1),
                          ),
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    validator: (s) {
                      return s == '2222' ? null : 'Pin is incorrect';
                    },
                    errorTextStyle: const TextStyle(
                      color: Color(0xFFFF3141),
                      fontSize: 13,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                    ),
                    onCompleted: (pin) {},
                  ),
                ],
              ),
            ),
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Have not received the code?",
              ),
              Button.primary(
                onPressed: () {},
                fill: ButtonFill.none,
                shape: ButtonShape.rectangular,
                buttonSize: ButtonSize.small,
                child: const Text("Resend code"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
