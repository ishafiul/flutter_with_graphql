import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/utils/extention.dart';

class BBottomSheet {
  final BuildContext context;
  final Widget child;
  double? height;
  double? maxHeight;
  bool? isScrollControlled;
  bool? isBarIcon;

  BBottomSheet({
    required this.context,
    required this.child,
    this.height,
    this.maxHeight,
    this.isScrollControlled = true,
    this.isBarIcon = true,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        if (isScrollControlled!) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.pop();
            },
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: height ?? 0.6,
                minChildSize: height ?? 0.3,
                maxChildSize: maxHeight ?? 0.9,
                expand: false,
                builder: (context, scrollController) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      if (isBarIcon == true)
                        Container(
                          padding: 8.paddingVertical(),
                          child: const Icon(
                            CustomIcons.minus,
                            color: Color(0xffABABAB),
                          ),
                        ),
                      child,
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: 8.paddingVertical(),
                      child: const Icon(
                        CustomIcons.minus,
                        color: Color(0xffABABAB),
                      ),
                    ),
                    child
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
