class JournalEntryModel {
  final String id;
  final DateTime date;
  final String reference;
  final String description;
  final String createdBy;
  final double amount;
  final String status;

  const JournalEntryModel({
    required this.id,
    required this.date,
    required this.reference,
    required this.description,
    required this.createdBy,
    required this.amount,
    required this.status,
  });
}