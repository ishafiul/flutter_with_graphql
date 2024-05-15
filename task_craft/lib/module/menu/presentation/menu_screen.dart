import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/devider/divider.dart';
import 'package:task_craft/core/widgets/devider/text_divider.dart';
import 'package:task_craft/core/widgets/spinner/fade_dots.dart';
import 'package:task_craft/module/home/presentation/widgets/toda_todo_update.dart';
import 'package:task_craft/module/menu/domain/bloc/logout_cubit.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CustomIcons.more),
          ),
        ],
      ),
      body: ListView(
        children: [
          20.verticalSpace,
          CDivider.text(
            text: "Profile",
            position: TextDividerPosition.left,
          ),
          8.verticalSpace,
          Padding(
            padding: 20.paddingHorizontal(),
            child: ListTile(
              onTap: () {},
              leading: const Icon(CustomIcons.user),
              title: const Text("Edit Profile"),
              subtitle: const Text("Edit your profile"),
            ),
          ),
          4.verticalSpace,
          BlocBuilder<LogoutCubit, LogoutState>(
            builder: (context, state) {
              return Opacity(
                opacity: state is LogoutLoading ? 0.4 : 1,
                child: Padding(
                  padding: 20.paddingHorizontal(),
                  child: ListTile(
                    onTap: state is LogoutLoading
                        ? null
                        : () {
                            context.read<LogoutCubit>().logout();
                          },
                    leading: const Icon(CustomIcons.logout),
                    title: state is LogoutLoading
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               FadingFourSpinner(
                                color: CColor.text,
                                size: 20,
                              ),
                              8.horizontalSpace,
                              const Text("Logout Loading"),
                            ],
                          )
                        : const Text("Logout"),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
