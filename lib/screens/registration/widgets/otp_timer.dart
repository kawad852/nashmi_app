import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nashmi_app/utils/base_extensions.dart';

class OtpTimer extends StatefulWidget {
  final VoidCallback onResend;

  const OtpTimer({
    super.key,
    required this.onResend,
  });

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late Timer _timer;
  int _start = 120;

  bool get _ended => _start == 0;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String _getFormattedTime() {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        style: TextStyle(
          fontSize: 14,
          color: context.colorScheme.onSurfaceVariant,
        ),
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: context.appLocalization.didntReceiveCode,
              style: TextStyle(
                color: context.colorPalette.black,
                fontSize: 14,
              ),
            ),
            if (!_ended) ...[
              TextSpan(
                text: " ${context.appLocalization.after} ",
                style: TextStyle(
                  color: context.colorPalette.black,
                  fontSize: 14,
                ),
              ),
              TextSpan(
                text: _getFormattedTime(),
                style: TextStyle(
                  color: context.colorPalette.red018,
                  fontSize: 14,
                ),
              ),
            ] else
              TextSpan(
                text: " ${context.appLocalization.resend} ",
                style: TextStyle(
                  color: context.colorScheme.primary,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _start = 120;
                      startTimer();
                    });
                    widget.onResend();
                  },
              ),
          ],
        ),
      ),
    );
  }
}
