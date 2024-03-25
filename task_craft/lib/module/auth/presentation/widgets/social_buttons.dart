import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_craft/app/app_router.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/button/enums.dart';
import 'package:task_craft/core/widgets/snackbar.dart';
import 'package:task_craft/module/auth/domain/cubit/request_otp/request_otp_cubit.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.paddingHorizontal(),
      child: BlocBuilder<RequestOtpCubit, RequestOtpState>(
        builder: (context, state) {
          return Column(
            children: [
              Button(
                fill: ButtonFill.outline,
                shape: ButtonShape.rectangular,
                buttonSize: ButtonSize.large,
                isBlock: true,
                onPressed: state is RequestOtpLoading ? null : () {},
                child: const Row(
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
                onPressed: state is RequestOtpLoading ? null : () {},
                child: const Row(
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
                onPressed: state is RequestOtpLoading
                    ? null
                    : () {
                        router.push('/auth/verify-otp');
                      },
                child: const Row(
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
          );
        },
      ),
    );
  }
}
