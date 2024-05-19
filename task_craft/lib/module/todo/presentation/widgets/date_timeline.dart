import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:task_craft/bootstrap.dart';
import 'package:task_craft/core/config/colors.dart';
import 'package:task_craft/core/utils/extention.dart';
import 'package:task_craft/core/widgets/devider/divider.dart';

class DateTimeLine extends StatefulWidget {
  const DateTimeLine({super.key, this.controller, this.visibleDate});

  final DateTimelineController? controller;

  final void Function(DateTime date)? visibleDate;

  @override
  State<DateTimeLine> createState() => _DateTimeLineState();
}

class _DateTimeLineState extends State<DateTimeLine> {
  final ScrollController _controller = ScrollController();
  DateTime? _currentDate;

  // a function that will take a date and return a new date with only day month year
  DateTime _getOnlyDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  @override
  void initState() {
    _currentDate = _getOnlyDate(DateTime.now());
    widget.controller?.setDatePickerState(this);

    // if widget rendered then animate to today date
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.controller?.animateToDate(DateTime.now());
    });
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.hasClients) {
      final double centerOffset = _controller.offset +
          (MediaQuery.of(context).size.width / 2);
      final DateTime visibleDate = widget.controller!.calculateDateFromOffset(centerOffset);
      widget.visibleDate?.call(visibleDate);
    }
  }

  void _updateCurrentDate(DateTime date) {
    setState(() {
      _currentDate = _getOnlyDate(date);
      logger.d(_currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
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

              final curentDateOnly = _getOnlyDate(currentDate);
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
                    color: _currentDate == curentDateOnly
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
                        Scrollable.ensureVisible(
                          GlobalObjectKey(currentDate).currentContext!,
                          duration: const Duration(milliseconds: 500),
                          // duration for scrolling time
                          alignment: .5,
                          // 0 mean, scroll to the top, 0.5 mean, half
                          curve: Curves.easeInOutCubic,
                        );
                        _updateCurrentDate(currentDate);
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
    assert(
      _datePickerState != null,
      'DatePickerController is not attached to any DatePicker View.',
    );

    // jump to the current Date
    _datePickerState!._controller.jumpTo(
        _calculateDateOffset(_datePickerState?._currentDate ?? DateTime.now()));
  }

  /// This function will animate the Timeline to the currently selected Date
  void animateToSelection() {
    assert(_datePickerState != null,
        'DatePickerController is not attached to any DatePicker View.');

    // animate to the current date
    _datePickerState!._controller.animateTo(
        _calculateDateOffset(_datePickerState!._currentDate ?? DateTime.now()),
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut);
  }

  /// This function will animate to any date that is passed as an argument
  /// In case a date is out of range nothing will happen
  Future<void> animateToDate(
    DateTime date, {
    duration = const Duration(milliseconds: 200),
    curve = Curves.linear,
  }) async {
    assert(
      _datePickerState != null,
      'DatePickerController is not attached to any DatePicker View.',
    );
    _datePickerState!._updateCurrentDate(date);
    await _datePickerState!._controller.animateTo(
      _calculateDateOffset(date),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  /// Calculate the number of pixels that needs to be scrolled to go to the
  /// date provided in the argument
  double _calculateDateOffset(DateTime date) {
    final startDate = DateTime(2024);
    final int daysDifference = date.difference(startDate).inDays;

    // Assuming each date item is 72 pixels wide (56 + 16 padding)
    const double dateItemWidth = 56.0;
    const double dateItemPadding = 16.0;
    const double totalDateItemWidth = dateItemWidth + dateItemPadding;

    // Calculate the offset for the date
    double offset = daysDifference * totalDateItemWidth;

    // Calculate the half-width of the screen
    final double screenWidth =
        MediaQuery.of(_datePickerState!.context).size.width;
    final double halfScreenWidth = screenWidth / 2;

    // Calculate the half-width of a date item
    const double halfDateItemWidth = totalDateItemWidth / 2;

    // Adjust the offset to position the date in the middle of the screen
    return offset -= halfScreenWidth - halfDateItemWidth;
  }

  DateTime calculateDateFromOffset(double offset) {
    const double dateItemWidth = 56.0;
    const double dateItemPadding = 16.0;
    const double totalDateItemWidth = dateItemWidth + dateItemPadding;
    final startDate = DateTime(2024);

    final int daysFromStart = (offset / totalDateItemWidth).round();
    return startDate.add(Duration(days: daysFromStart));
  }
}
