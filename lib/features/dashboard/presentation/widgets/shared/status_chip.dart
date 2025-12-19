import 'package:flutter/material.dart';

enum EntryStatus { posted, draft, pending }

class StatusChip extends StatelessWidget {
  final EntryStatus status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (status) {
      EntryStatus.posted => ('Posted', Colors.green),
      EntryStatus.draft => ('Draft', Colors.orange),
      EntryStatus.pending => ('Pending', Colors.blue),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.darker(),
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}

extension on Color {
  Color darker() => HSLColor.fromColor(this).withLightness(0.3).toColor();
}
