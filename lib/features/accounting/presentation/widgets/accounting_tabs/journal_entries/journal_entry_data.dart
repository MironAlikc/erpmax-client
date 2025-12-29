import 'package:flutter/material.dart';

class JournalEntry {
  final String debit;
  final String credit;
  final String ref;
  final String description;
  final String type; // Например: 'Expense Entry', 'Sales Entry'
  final String entryNo;
  final String date;
  final Color typeColor;

  JournalEntry({
    required this.debit,
    required this.credit,
    required this.ref,
    required this.description,
    required this.type,
    required this.entryNo,
    required this.date,
    required this.typeColor,
  });
}
