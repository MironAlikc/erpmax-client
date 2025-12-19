import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';

class AccessLogRecord {
  final String user;
  final String company;
  final String ipAddress;
  final String device;
  final String date;
  final bool isSuccess;

  const AccessLogRecord({
    required this.user,
    required this.company,
    required this.ipAddress,
    required this.device,
    required this.date,
    required this.isSuccess,
  });
}

class AccessLogsContent extends StatelessWidget {
  const AccessLogsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildLogsTable(), const SizedBox(height: 40)],
      ),
    );
  }

  Widget _buildLogsTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              "Access Logs",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
          ErpMaxDataTable<AccessLogRecord>(
            items: _mockAccessLogs,
            columns: [
              ErpMaxColumn(title: "User", weight: 0.2),
              ErpMaxColumn(title: "Company Name", weight: 0.2),
              ErpMaxColumn(title: "IP Address", weight: 0.15),
              ErpMaxColumn(title: "Device", weight: 0.2),
              ErpMaxColumn(title: "Date", weight: 0.15),
              ErpMaxColumn(title: "Status", weight: 0.1),
            ],
            rowBuilder: (item) => [
              Text(
                item.user,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                item.company,
                style: const TextStyle(color: Color(0xFF64748B)),
              ),
              Text(
                item.ipAddress,
                style: const TextStyle(color: Color(0xFF1E293B)),
              ),
              Text(
                item.device,
                style: const TextStyle(color: Color(0xFF64748B)),
              ),
              Text(item.date, style: const TextStyle(color: Color(0xFF64748B))),
              item.isSuccess
                  ? AppStatusChip.success("Success")
                  : AppStatusChip.danger("Failed"),
            ],
          ),
        ],
      ),
    );
  }
}

// Данные на основе вашего скриншота
final List<AccessLogRecord> _mockAccessLogs = [
  const AccessLogRecord(
    user: "Ahmed Mohamed",
    company: "Tech Solutions",
    ipAddress: "192.168.1.1",
    device: "Chrome / Windows",
    date: "2024-03-15 10:30 AM",
    isSuccess: true,
  ),
  const AccessLogRecord(
    user: "Sarah Ali",
    company: "Al-Amal Trading",
    ipAddress: "192.168.1.45",
    device: "Safari / Mac",
    date: "2024-03-15 10:32 AM",
    isSuccess: true,
  ),
  const AccessLogRecord(
    user: "Khaled Omar",
    company: "Future Vision",
    ipAddress: "10.0.0.5",
    device: "Firefox / Linux",
    date: "2024-03-15 10:45 AM",
    isSuccess: false,
  ),
  const AccessLogRecord(
    user: "Admin",
    company: "System",
    ipAddress: "127.0.0.1",
    device: "Edge / Windows",
    date: "2024-03-15 11:00 AM",
    isSuccess: true,
  ),
  const AccessLogRecord(
    user: "Mona Ahmed",
    company: "Tech Solutions",
    ipAddress: "192.168.1.2",
    device: "Chrome / Android",
    date: "2024-03-15 11:15 AM",
    isSuccess: true,
  ),
];
