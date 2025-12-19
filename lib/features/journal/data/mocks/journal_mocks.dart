import '../models/journal_entry_model.dart';

abstract final class JournalMocks {
  static final List<JournalEntryModel> entries = [
    JournalEntryModel(
      id: 'JE-00124',
      date: DateTime.now(),
      reference: 'INV-2024-001',
      description: 'Monthly Office Rent Payment',
      createdBy: 'Admin User',
      amount: 1200.00,
      status: 'Paid',
    ),
    JournalEntryModel(
      id: 'JE-00125',
      date: DateTime.now(),
      reference: 'PUR-005',
      description: 'Purchase of office equipment',
      createdBy: 'Accountant',
      amount: 450.50,
      status: 'Late',
    ),
  ];
}