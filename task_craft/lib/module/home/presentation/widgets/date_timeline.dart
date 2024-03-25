import 'dart:async';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:task_craft/bootstrap.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/devider/divider.dart';

class DateTimeLine extends HookWidget {
  const DateTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.horizontal,
    );
    final DateTime initialDate = DateTime(2024);
    final isMounted = useIsMounted();
    final selectedIndex = useState(0);
    final selectedDate = useState(DateTime.now());
    Future<void> jump() async {
      WidgetsFlutterBinding.ensureInitialized();
      final mounted = isMounted();
      if (!mounted) return;
      final int initialIndex = DateTime.now().difference(initialDate).inDays;
      selectedIndex.value = initialIndex;
      await controller.scrollToIndex(
        initialIndex,
        preferPosition: AutoScrollPosition.middle,
        duration: const Duration(milliseconds: 100),
      );
    }

    Widget wrapScrollTag({required int index, required Widget child}) =>
        AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: child,
        );
    useEffect(
      () {
        jump();
        return null;
      },
      [],
    );
    return Column(
      children: [
        Padding(
          padding: 24.paddingHorizontal(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('MMMM yyyy').format(selectedDate.value),
                style: context.textTheme.titleLarge,
              ),
              Row(
                children: [
                  Button.primary(
                    child: const Text('Today'),
                    onPressed: () async {
                      final int initialIndex =
                          DateTime.now().difference(initialDate).inDays;

                      await controller.scrollToIndex(
                        initialIndex,
                        preferPosition: AutoScrollPosition.middle,
                        duration: const Duration(milliseconds: 100),
                      );
                      selectedDate.value = DateTime.now();
                      selectedIndex.value = initialIndex;
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            insetPadding: const EdgeInsets.all(24),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SfDateRangePicker(
                                    backgroundColor: CColor.backgroundColor,
                                    showNavigationArrow: true,
                                    headerHeight: 56,
                                    headerStyle:
                                        const DateRangePickerHeaderStyle(
                                      backgroundColor: CColor.backgroundColor,
                                    ),
                                    onSelectionChanged: (
                                      DateRangePickerSelectionChangedArgs
                                          dateRangePickerSelectionChangedArgs,
                                    ) async {
                                      selectedDate.value = DateTime.parse(
                                        dateRangePickerSelectionChangedArgs
                                            .value
                                            .toString(),
                                      );
                                      final int index = selectedDate.value
                                          .difference(initialDate)
                                          .inDays;

                                      await controller.scrollToIndex(
                                        index,
                                        preferPosition:
                                            AutoScrollPosition.middle,
                                        duration:
                                            const Duration(milliseconds: 100),
                                      );
                                      context.pop();
                                    },
                                    selectionShape:
                                        DateRangePickerSelectionShape.rectangle,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(CustomIcons.calendar),
                  ),
                ],
              ),
            ],
          ),
        ),
        8.verticalSpace,
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final DateTime currentDate =
                  initialDate.add(Duration(days: index));

              final isToday = DateTime(
                    currentDate.year,
                    currentDate.month,
                    currentDate.day,
                  ) ==
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                  );
              // Format the date as desired
              final String dayNumber = DateFormat('d').format(currentDate);
              final String dayName = DateFormat('E').format(currentDate);
              // Return a ListTile or any other widget with the formatted date
              return wrapScrollTag(
                index: index,
                child: Container(
                  key: GlobalObjectKey(currentDate),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  height: 56,
                  width: 56.0,
                  decoration: BoxDecoration(
                    color: selectedIndex.value == index
                        ? CColor.primary
                        : Colors.white,
                    border: isToday
                        ? Border.all(color: CColor.primary)
                        : Border.all(
                            color: CColor.border,
                          ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        selectedIndex.value = index;
                        selectedDate.value = currentDate;
                        Scrollable.ensureVisible(
                          GlobalObjectKey(currentDate).currentContext!,
                          duration: const Duration(milliseconds: 500),
                          // duration for scrolling time
                          alignment: .5,
                          // 0 mean, scroll to the top, 0.5 mean, half
                          curve: Curves.easeInOutCubic,
                        );
                      },
                      child: badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.square,
                          badgeColor: CColor.primary.shade200,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                4,
                              ),
                              topRight: Radius.circular(
                                4,
                              ),
                              bottomLeft: Radius.circular(
                                4,
                              )),
                          elevation: 0,
                        ),
                        position:
                            badges.BadgePosition.bottomEnd(bottom: -1, end: -8),
                        badgeContent: const Text(
                          '00',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dayNumber,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: selectedIndex.value == index
                                      ? Colors.white
                                      : CColor.text,
                                ),
                              ),
                              Text(
                                dayName,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: selectedIndex.value == index
                                      ? Colors.white
                                      : CColor.light,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        8.verticalSpace,
        CDivider.base(
          axis: Axis.horizontal,
        ),
        8.verticalSpace,
      ],
    );
  }
}
