import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/button/button.dart';
import 'package:task_craft/core/widgets/mesure_widget.dart';
import 'package:task_craft/module/todo/presentation/widgets/date_timeline.dart';
import 'package:task_craft/module/todo/presentation/widgets/task_content.dart';
final DateTimelineController dateController = DateTimelineController();
final _formKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> homePageScaffoldKey = GlobalKey<ScaffoldState>();

class TodoScreen extends HookWidget {
  const TodoScreen({super.key});

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
    Widget wrapScrollTag({required int index, required Widget child}) =>
        AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: child,
        );

    useEffect(() {
      return null;
    });
    final ValueNotifier<Size?> dateTimeLineConstraints = useState(null);
    return Scaffold(
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
        title: const Text("TODO"),
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
                          /*final int initialIndex =
                              DateTime.now().difference(initialDate).inDays;

                          await controller.scrollToIndex(
                            initialIndex,
                            preferPosition: AutoScrollPosition.middle,
                            duration: const Duration(milliseconds: 100),
                          );
                          selectedDate.value = DateTime.now();
                          selectedIndex.value = initialIndex;*/
                          dateController.animateToDate(DateTime.now());
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
                                          backgroundColor:
                                              CColor.backgroundColor,
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
                                            duration: const Duration(
                                                milliseconds: 100),
                                          );
                                          context.pop();
                                        },
                                        selectionShape:
                                            DateRangePickerSelectionShape
                                                .rectangle,
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
            MeasureSize(
              onChange: (Size size) {
                dateTimeLineConstraints.value = size;
              },
              child: DateTimeLine(
                controller: dateController,
              ),
            ),
            if (dateTimeLineConstraints.value != null)
              TaskContent(
                extraTopSize: dateTimeLineConstraints.value!,
                scaafoldContext: context,
              ),
          ],
        ),
      ),
    );
  }
}
