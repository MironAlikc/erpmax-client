import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class ActivityLogView extends StatelessWidget {
  const ActivityLogView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> logs = [
      {"user": "Admin", "action": "Updated settings", "time": "2 hours ago"},
      {"user": "Ahmed", "action": "added a new user", "time": "5 hours ago"},
      {"user": "System", "action": "Backup completed", "time": "1 day ago"},
      {"user": "Sarah", "action": "Exported report", "time": "2 days ago"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Activity Log", style: AppTextStyles.h2.copyWith(fontSize: 18)),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEAECF0)),
          ),
          child: Column(
            children: logs.asMap().entries.map((entry) {
              int idx = entry.key;
              Map<String, String> log = entry.value;
              bool isLast = idx == logs.length - 1;

              return Column(
                children: [
                  _buildLogTile(log),
                  if (!isLast)
                    const Divider(
                      height: 1,
                      color: Color(0xFFEAECF0),
                      indent: 56,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLogTile(Map<String, String> log) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFEAECF0)),
            ),
            child: const Icon(
              CupertinoIcons.waveform_path_ecg,
              size: 14,
              color: Color(0xFF667085),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1D2939),
                      fontFamily: 'Inter',
                    ),
                    children: [
                      TextSpan(
                        text: log["user"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: " ${log["action"]}"),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  log["time"]!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
