import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nashmi_app/helper/separator.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

import '../helper/ui_helper.dart';
import '../screens/offers/widgets/time_bubble.dart';

class TimeWidget extends StatefulWidget {
  final DateTime startTime;
  final Function() onEnd;
  final Widget Function(String part)? builder;

  const TimeWidget({
    super.key,
    required this.startTime,
    required this.onEnd,
    this.builder,
  });

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (DateTime.now().isAfter(widget.startTime)) {
          widget.onEnd();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onSurface = context.colorPalette.white;
    final parts = UiHelper.formatDuration(context, widget.startTime);
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        parts.length,
        (index) {
          final part = parts[index];
          return widget.builder != null ? widget.builder!(part) : TimeBubble(time: part);
        },
      )
          .separator(widget.builder != null
              ? Text(
                  " : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: onSurface,
                  ),
                  textDirection: TextDirection.ltr,
                )
              : const SizedBox(width: 10))
          .toList(),
    );
  }
}
