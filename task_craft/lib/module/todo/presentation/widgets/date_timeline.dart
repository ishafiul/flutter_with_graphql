import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/devider/divider.dart';

class DateTimeLine extends StatefulWidget {
  const DateTimeLine({super.key, this.controller});

  final DateTimelineController? controller;

  @override
  State<DateTimeLine> createState() => _DateTimeLineState();
}

class _DateTimeLineState extends State<DateTimeLine> {
  final ScrollController _controller = ScrollController();
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    widget.controller?.setDatePickerState(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.horizontal,
    );

    /*final DateTime initialDate = DateTime(2024);
    final isMounted = useIsMounted();
    final selectedIndex = useState(0);
    final selectedDate = useState(DateTime.now());*/
    /*Future<void> jump() async {
      WidgetsFlutterBinding.ensureInitialized();
      final mounted = isMounted();
      if (!mounted) return;
      final int initialIndex = DateTime.now().difference(initialDate).inDays;
      selectedIndex.value = initialIndex;
      await controller.scrollToIndex(
        initialIndex,
        preferPosition: AutoScrollPosition.middle,
        duration: const Duration(milliseconds: 1),
      );
    }*/

    Widget wrapScrollTag({required int index, required Widget child}) =>
        AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: child,
        );

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final DateTime currentDate =
                  DateTime(2024).add(Duration(days: index));

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
                    color: Colors.white,
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
                        Scrollable.ensureVisible(
                          GlobalObjectKey(currentDate).currentContext!,
                          duration: const Duration(milliseconds: 500),
                          // duration for scrolling time
                          alignment: .5,
                          // 0 mean, scroll to the top, 0.5 mean, half
                          curve: Curves.easeInOutCubic,
                        );
                        setState(() {
                          _currentDate = currentDate;
                        });
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
                            ),
                          ),
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
                                  color: CColor.text,
                                ),
                              ),
                              Text(
                                dayName,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: CColor.light,
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

class DateTimelineController {
  _DateTimeLineState? _datePickerState;

  void setDatePickerState(_DateTimeLineState state) {
    _datePickerState = state;
  }

  void jumpToSelection() {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // jump to the current Date
    _datePickerState!._controller
        .jumpTo(_calculateDateOffset(_datePickerState!._currentDate));
  }

  /*/// This function will animate the Timeline to the currently selected Date
  void animateToSelection(
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
    'DatePickerController is not attached to any DatePicker View.');

    // animate to the current date
    _datePickerState!._controller.animateTo(
        _calculateDateOffset(_datePickerState!._currentDate),
        duration: duration,
        curve: curve);
  }*/

  /// This function will animate to any date that is passed as an argument
  /// In case a date is out of range nothing will happen
  void animateToDate(DateTime date,
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    /* assert(_datePickerState != null,
    'DatePickerController is not attached to any DatePicker View.');
*/
    _datePickerState!._controller.animateTo(_calculateDateOffset(date),
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  /// This function will animate to any date that is passed as an argument
  /// this will also set that date as the current selected date
  /* void setDateAndAnimate(DateTime date,
      {duration = const Duration(milliseconds: 500), curve = Curves.linear}) {
    assert(_datePickerState != null,
    'DatePickerController is not attached to any DatePicker View.');

    _datePickerState!._controller.animateTo(_calculateDateOffset(date),
        duration: duration, curve: curve);

    if (date.compareTo(_datePickerState!.widget.startDate) >= 0 &&
        date.compareTo(_datePickerState!.widget.startDate
            .add(Duration(days: _datePickerState!.widget.daysCount))) <=
            0) {
      // date is in the range
      _datePickerState!._currentDate = date;
    }
  }*/

  /// Calculate the number of pixels that needs to be scrolled to go to the
  /// date provided in the argument
  double _calculateDateOffset(DateTime date) {
    final startDate = DateTime(2024);

    final int offset = date.difference(startDate).inDays;
    return (offset * 56) + (offset * 16);
  }
}
