import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

enum DayPeriod { morning, afternoon, evening, night }

extension DayPeriodExt on DayPeriod {
  String getGreeting(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    switch (this) {
      case DayPeriod.morning:
        return localizations.greeting_morning;
      case DayPeriod.afternoon:
        return localizations.greeting_afternoon;
      case DayPeriod.evening:
        return localizations.greeting_evening;
      case DayPeriod.night:
        return localizations.greeting_night;
    }
  }

  static DayPeriod fromDateTime(DateTime dateTime) {
    final hour = dateTime.hour;
    if (hour >= 5 && hour < 12) return DayPeriod.morning;
    if (hour >= 12 && hour < 17) return DayPeriod.afternoon;
    if (hour >= 17 && hour < 21) return DayPeriod.evening;
    return DayPeriod.night;
  }
}
