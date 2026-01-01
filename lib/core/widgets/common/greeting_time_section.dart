import 'dart:async';

import 'package:erpmax_client/core/extensions/time_ext.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GreetingTimeSection extends StatefulWidget {
  const GreetingTimeSection({super.key});

  @override
  State<GreetingTimeSection> createState() => _GreetingTimeSectionState();
}

class _GreetingTimeSectionState extends State<GreetingTimeSection> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      if (now.minute != _currentTime.minute) {
        setState(() {
          _currentTime = now;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final period = DayPeriodExt.fromDateTime(_currentTime);

    final timeString = DateFormat('hh:mm a').format(_currentTime);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          period.getGreeting(context),
          style: AppTextStyles.bodySmall.copyWith(
            color: theme.gray600,
            fontSize: 11,
          ),
        ),
        Text(
          timeString,
          style: AppTextStyles.base.copyWith(
            color: theme.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
