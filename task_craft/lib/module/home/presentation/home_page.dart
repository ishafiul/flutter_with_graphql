import 'dart:math' as math;

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:task_craft/bootstrap.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/config/get_it.dart';
import 'package:task_craft/core/config/theme.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/bottom_sheet/snap_bottom_sheet.dart';
import 'package:task_craft/core/widgets/mesure_widget.dart';
import 'package:task_craft/module/home/presentation/widgets/date_timeline.dart';
import 'package:task_craft/module/home/presentation/widgets/task_content.dart';

final _formKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> homePageScaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final maxCount = useState(0.0);
    final maxHeight = useState(0.0);
    final EasyInfiniteDateTimelineController _controller =
        EasyInfiniteDateTimelineController();
    final DateTime initialDate = DateTime(2024);
    final _focusDate = useState(DateTime.now());
    final controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.horizontal,
    );

    Widget wrapScrollTag({required int index, required Widget child}) =>
        AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: child,
        );

    useEffect(() {});
    final ValueNotifier<Size?> dateTimeLineConstraints = useState(null);
    return SnapBottomSheet(
      maxChild: Column(
        children: [
          Text('"data"'),
          Text('"data"'),
          Text('"data"'),
        ],
      ),
      minChild: const Text("data"),
      body: Scaffold(
        key: homePageScaffoldKey,
        floatingActionButton: SafeArea(
          child: IconButton.filled(
            onPressed: () {},
            icon: const Icon(
              CustomIcons.add,
              size: 32,
            ),
          ),
        ),
        backgroundColor: const Color(0xfffcfbfa),
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CustomIcons.more),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              MeasureSize(
                onChange: (Size size) {
                  dateTimeLineConstraints.value = size;
                },
                child: const DateTimeLine(),
              ),
              if (dateTimeLineConstraints.value != null)
                TaskContent(
                  extraTopSize: dateTimeLineConstraints.value!,
                  scaafoldContext: context,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
