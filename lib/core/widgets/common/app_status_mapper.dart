import 'package:flutter/material.dart';
import 'app_status_chip.dart';

class AppStatusMapper extends StatelessWidget {
  final String status;

  const AppStatusMapper({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final normalizedStatus = status.toLowerCase().trim();

    return switch (normalizedStatus) {
      'posted' ||
      'active' ||
      'paid' ||
      'success' ||
      'completed' => AppStatusChip.success(status),

      'draft' ||
      'late' ||
      'pending' ||
      'warning' => AppStatusChip.warning(status),

      'expired' ||
      'cancelled' ||
      'danger' ||
      'failed' => AppStatusChip.danger(status),

      _ => AppStatusChip.neutral(status),
    };
  }
}
