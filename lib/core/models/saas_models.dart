import 'package:flutter/material.dart';

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

class BackupRecord {
  final String name;
  final String date;
  final String type;
  final String size;
  final bool isSuccess;

  const BackupRecord({
    required this.name,
    required this.date,
    required this.type,
    required this.size,
    required this.isSuccess,
  });
}
