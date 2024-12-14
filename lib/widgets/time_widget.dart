import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nashmi_app/helper/separator.dart';

import '../helper/ui_helper.dart';
import '../screens/offers/widgets/time_bubble.dart';

class TimeWidget extends StatefulWidget {
  final DateTime startTime;
  final Function() onEnd;

  const TimeWidget({
    super.key,
    required this.startTime,
    required this.onEnd,
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
    final parts = UiHelper.formatDuration(context, widget.startTime);
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        parts.length,
        (index) {
          final part = parts[index];
          return TimeBubble(time: part);
        },
      ).separator(const SizedBox(width: 10)).toList(),
    );
  }
}
