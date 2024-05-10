import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:task_craft/core/config/custom_icons_icons.dart';
import 'package:task_craft/core/widgets/mesure_widget.dart';
import 'package:task_craft/module/todo/presentation/widgets/date_timeline.dart';
import 'package:task_craft/module/todo/presentation/widgets/task_content.dart';

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
    );
  }
}
