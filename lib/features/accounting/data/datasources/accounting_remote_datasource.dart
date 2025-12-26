import 'package:erpmax_client/features/accounting/data/models/account_model.dart';
import 'package:erpmax_client/features/accounting/data/models/quick_action_model.dart';
import 'package:erpmax_client/features/accounting/data/models/stat_model.dart';
import 'package:erpmax_client/features/accounting/data/models/transaction_model.dart';
import 'package:erpmax_client/features/accounting/domain/entities/transaction_entity.dart';

abstract class AccountingRemoteDataSource {
  Future<List<StatModel>> getDashboardStats();
  Future<List<TransactionModel>> getRecentTransactions();
  Future<List<QuickActionModel>> getQuickActions();
  Future<List<AccountModel>> getAccountsWatchlist();
}

class AccountingRemoteDataSourceImpl implements AccountingRemoteDataSource {
  @override
  Future<List<StatModel>> getDashboardStats() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      const StatModel(
        title: 'Total Revenue',
        value: '\$124,500',
        trend: '+12.5%',
        isPositive: true,
      ),
      const StatModel(
        title: 'Total Expenses',
        value: '\$45,200',
        trend: '-2.4%',
        isPositive: false,
      ),
      const StatModel(
        title: 'Net Profit',
        value: '\$79,300',
        trend: '+8.2%',
        isPositive: true,
      ),
      const StatModel(
        title: 'Cash Flow',
        value: '\$32,000',
        trend: '+5.1%',
        isPositive: true,
      ),
    ];
  }

  @override
  Future<List<TransactionModel>> getRecentTransactions() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      TransactionModel(
        reference: 'JV-2024-001',
        date: DateTime(2024, 3, 20),
        description: 'Office Rent Payment',
        amount: -5000,
        status: TransactionStatus.posted,
      ),
      TransactionModel(
        reference: 'JV-2024-002',
        date: DateTime(2024, 3, 19),
        description: 'Client Invoice #INV-001',
        amount: 12500,
        status: TransactionStatus.posted,
      ),
      TransactionModel(
        reference: 'JV-2024-003',
        date: DateTime(2024, 3, 18),
        description: 'Office Supplies',
        amount: -450,
        status: TransactionStatus.draft,
      ),
      TransactionModel(
        reference: 'JV-2024-004',
        date: DateTime(2024, 3, 18),
        description: 'Consulting Services',
        amount: 3000,
        status: TransactionStatus.posted,
      ),
      TransactionModel(
        reference: 'JV-2024-005',
        date: DateTime(2024, 3, 17),
        description: 'Internet Bill',
        amount: -120,
        status: TransactionStatus.posted,
      ),
    ];
  }

  @override
  Future<List<QuickActionModel>> getQuickActions() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return const [
      QuickActionModel(
        id: 'new_invoice',
        label: 'New Invoice',
        iconName: 'description_outlined',
      ),
      QuickActionModel(
        id: 'record_expense',
        label: 'Record Expense',
        iconName: 'account_balance_wallet_outlined',
      ),
      QuickActionModel(
        id: 'transfer',
        label: 'Transfer',
        iconName: 'swap_horiz',
      ),
      QuickActionModel(
        id: 'import_statement',
        label: 'Import Statement',
        iconName: 'file_download_outlined',
      ),
      QuickActionModel(
        id: 'general_ledger',
        label: 'General Ledger',
        iconName: 'menu_book',
      ),
    ];
  }

  @override
  Future<List<AccountModel>> getAccountsWatchlist() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return const [
      AccountModel(
        accountNumber: '1010',
        accountName: 'Cash in Hand',
        balance: 15000,
        category: 'Assets',
      ),
      AccountModel(
        accountNumber: '1020',
        accountName: 'Bank Account',
        balance: 45000,
        category: 'Assets',
      ),
      AccountModel(
        accountNumber: '2010',
        accountName: 'Accounts Payable',
        balance: -8500,
        category: 'Liabilities',
      ),
    ];
  }
}
