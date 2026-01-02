import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/chart_of_accounts/widgets/custom_segmented_control.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/chart_of_accounts/widgets/view_control_action_btn.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_input.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

// =============================================================================================== Data

class AccountNode {
  final String code;
  final String name;
  final String type;
  final double balance;
  final bool isGroup;
  final int level;
  final List<AccountNode> children;

  AccountNode({
    required this.code,
    required this.name,
    required this.type,
    required this.balance,
    required this.isGroup,
    required this.level,
    this.children = const [],
  });

  factory AccountNode.fromJson(Map<String, dynamic> json) {
    return AccountNode(
      code: json['code'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      balance: (json['balance'] as num).toDouble(),
      isGroup: json['isGroup'] as bool,
      level: json['level'] as int,
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => AccountNode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'type': type,
      'balance': balance,
      'isGroup': isGroup,
      'level': level,
      'children': children.map((e) => e.toJson()).toList(),
    };
  }

  List<AccountNode> getAllAccounts() {
    List<AccountNode> result = [this];
    for (var child in children) {
      result.addAll(child.getAllAccounts());
    }
    return result;
  }
}

Map<String, dynamic> getMockChartOfAccountsData() {
  return {
    'accounts': [
      {
        'code': '1',
        'name': 'Application of Funds (Assets)',
        'type': 'Asset',
        'balance': 125000.00,
        'isGroup': true,
        'level': 0,
        'children': [
          {
            'code': '1100',
            'name': 'Current Assets',
            'type': 'Asset',
            'balance': 75000.00,
            'isGroup': true,
            'level': 1,
            'children': [
              {
                'code': '1110',
                'name': 'Cash and Bank',
                'type': 'Asset',
                'balance': 45000.00,
                'isGroup': false,
                'level': 2,
                'children': [],
              },
              {
                'code': '1120',
                'name': 'Accounts Receivable',
                'type': 'Asset',
                'balance': 30000.00,
                'isGroup': false,
                'level': 2,
                'children': [],
              },
            ],
          },
          {
            'code': '1500',
            'name': 'Fixed Assets',
            'type': 'Asset',
            'balance': 50000.00,
            'isGroup': true,
            'level': 1,
            'children': [
              {
                'code': '1510',
                'name': 'Property, Plant & Equipment',
                'type': 'Asset',
                'balance': 50000.00,
                'isGroup': false,
                'level': 2,
                'children': [],
              },
            ],
          },
        ],
      },
      {
        'code': '2',
        'name': 'Source of Funds (Liabilities)',
        'type': 'Liability',
        'balance': 45000.00,
        'isGroup': true,
        'level': 0,
        'children': [
          {
            'code': '2100',
            'name': 'Current Liabilities',
            'type': 'Liability',
            'balance': 45000.00,
            'isGroup': true,
            'level': 1,
            'children': [
              {
                'code': '2110',
                'name': 'Accounts Payable',
                'type': 'Liability',
                'balance': 45000.00,
                'isGroup': false,
                'level': 2,
                'children': [],
              },
            ],
          },
        ],
      },
      {
        'code': '3',
        'name': 'Equity',
        'type': 'Equity',
        'balance': 80000.00,
        'isGroup': true,
        'level': 0,
        'children': [
          {
            'code': '3100',
            'name': 'Share Capital',
            'type': 'Equity',
            'balance': 50000.00,
            'isGroup': false,
            'level': 1,
            'children': [],
          },
          {
            'code': '3200',
            'name': 'Retained Earnings',
            'type': 'Equity',
            'balance': 30000.00,
            'isGroup': false,
            'level': 1,
            'children': [],
          },
        ],
      },
    ],
  };
}

// =============================================================================================== Widgets

enum ViewMode { tree, table }

class ChartOfAccountsBody extends StatefulWidget {
  final List<AccountNode> accounts;

  const ChartOfAccountsBody({super.key, required this.accounts});

  @override
  State<ChartOfAccountsBody> createState() => _ChartOfAccountsBodyState();
}

class _ChartOfAccountsBodyState extends State<ChartOfAccountsBody> {
  ViewMode viewMode = ViewMode.tree;
  AccountNode? selectedAccount;
  Set<String> expandedNodes = {};

  @override
  void initState() {
    super.initState();
    if (widget.accounts.isNotEmpty) {
      selectedAccount = widget.accounts.first;
      expandedNodes = widget.accounts
          .where((account) => account.isGroup)
          .map((account) => account.code)
          .toSet();
    }
  }

  void _expandAll() {
    setState(() {
      expandedNodes = _getAllGroupCodes(widget.accounts);
    });
  }

  void _collapseAll() {
    setState(() {
      expandedNodes = {};
    });
  }

  Set<String> _getAllGroupCodes(List<AccountNode> accounts) {
    Set<String> codes = {};
    for (var account in accounts) {
      if (account.isGroup) {
        codes.add(account.code);
        codes.addAll(_getAllGroupCodes(account.children));
      }
    }
    return codes;
  }

  void _toggleNode(String code) {
    setState(() {
      if (expandedNodes.contains(code)) {
        expandedNodes.remove(code);
      } else {
        expandedNodes.add(code);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChartOfAccountsControls(
          currentMode: viewMode,
          onViewChanged: (newMode) => setState(() => viewMode = newMode),
          onExpandAll: _expandAll,
          onCollapseAll: _collapseAll,
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 600,
          child: viewMode == ViewMode.tree
              ? ChartTreeViewLayout(
                  accounts: widget.accounts,
                  selectedAccount: selectedAccount,
                  expandedNodes: expandedNodes,
                  onAccountSelected: (account) {
                    setState(() => selectedAccount = account);
                  },
                  onToggleExpand: _toggleNode,
                )
              : SingleChildScrollView(
                  child: ChartOfAccountsTable(accounts: widget.accounts),
                ),
        ),
      ],
    );
  }
}

class ChartOfAccountsControls extends StatelessWidget {
  final ViewMode currentMode;
  final ValueChanged<ViewMode> onViewChanged;
  final VoidCallback onExpandAll;
  final VoidCallback onCollapseAll;

  const ChartOfAccountsControls({
    super.key,
    required this.currentMode,
    required this.onViewChanged,
    required this.onExpandAll,
    required this.onCollapseAll,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Wrap(
      spacing: 12,
      runSpacing: 16,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CustomSegmentedControl<ViewMode>(
              selectedValue: currentMode,
              items: [
                SegmentItem(
                  value: ViewMode.tree,
                  label: localizations.view_tree,
                  icon: LucideIcons.gitBranch,
                ),
                SegmentItem(
                  value: ViewMode.table,
                  label: localizations.view_table,
                  icon: LucideIcons.table,
                ),
              ],
              onValueChanged: onViewChanged,
            ),
            if (currentMode == ViewMode.tree) ...[
              const SizedBox(width: 8),
              ViewControlActionBtn(
                icon: LucideIcons.chevronsUpDown,
                label: localizations.action_expand,
                onTap: onExpandAll,
              ),
              ViewControlActionBtn(
                icon: LucideIcons.chevronsDownUp,
                label: localizations.action_collapse,
                onTap: onCollapseAll,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 24,
                  width: 1,
                  color: Colors.grey.shade300,
                ),
              ),
            ],
            _ActionButton(
              icon: Icons.print_outlined,
              label: localizations.print,
              onTap: () {},
            ),
            _ActionButton(
              icon: Icons.create_new_folder_outlined,
              label: localizations.action_add_group,
              onTap: () {},
            ),
            _AddAccountButton(onTap: () {}),
          ],
        ),
        AccInput(
          hint: localizations.searchHint,
          width: 260,
          height: 12,
          isIcon: true,
          controller: TextEditingController(),
        ),
      ],
    );
  }
}

class ChartOfAccountsTable extends StatelessWidget {
  final List<AccountNode> accounts;
  final bool isCompact;

  const ChartOfAccountsTable({
    super.key,
    required this.accounts,
    this.isCompact = false,
  });

  List<AccountNode> _getFlattenedAccounts() {
    List<AccountNode> result = [];
    for (var account in accounts) {
      result.addAll(account.getAllAccounts());
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final flatAccounts = _getFlattenedAccounts();
    final displayAccounts = isCompact && flatAccounts.length > 5
        ? flatAccounts.take(5).toList()
        : flatAccounts;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TableHeader(isCompact: isCompact),
          const Divider(height: 1),
          for (int i = 0; i < displayAccounts.length; i++) ...[
            _AccountRow(account: displayAccounts[i], isCompact: isCompact),
            if (i < displayAccounts.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}

class ChartTreeViewLayout extends StatefulWidget {
  final List<AccountNode> accounts;
  final AccountNode? selectedAccount;
  final Set<String> expandedNodes;
  final Function(AccountNode) onAccountSelected;
  final Function(String) onToggleExpand;

  const ChartTreeViewLayout({
    super.key,
    required this.accounts,
    this.selectedAccount,
    required this.expandedNodes,
    required this.onAccountSelected,
    required this.onToggleExpand,
  });

  @override
  State<ChartTreeViewLayout> createState() => _ChartTreeViewLayoutState();
}

class _ChartTreeViewLayoutState extends State<ChartTreeViewLayout> {
  double _sidebarWidth = 280;
  final double _minWidth = 150;
  final double _maxWidth = 600;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: _sidebarWidth,
            child: SidebarNavigationTree(
              accounts: widget.accounts,
              selectedAccount: widget.selectedAccount,
              expandedNodes: widget.expandedNodes,
              onAccountSelected: widget.onAccountSelected,
              onToggleExpand: widget.onToggleExpand,
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onHorizontalDragUpdate: (details) {
              setState(() {
                _sidebarWidth += details.delta.dx;
                if (_sidebarWidth < _minWidth) _sidebarWidth = _minWidth;
                if (_sidebarWidth > _maxWidth) _sidebarWidth = _maxWidth;
              });
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeLeftRight,
              child: Container(
                width: 6,
                color: Colors.transparent,
                child: Center(
                  child: Container(width: 1, color: Colors.grey.shade200),
                ),
              ),
            ),
          ),
          Expanded(
            child: CategoryDetailsPanel(
              account: widget.selectedAccount ?? widget.accounts.first,
            ),
          ),
        ],
      ),
    );
  }
}

class SidebarNavigationTree extends StatelessWidget {
  final List<AccountNode> accounts;
  final AccountNode? selectedAccount;
  final Set<String> expandedNodes;
  final Function(AccountNode) onAccountSelected;
  final Function(String) onToggleExpand;

  const SidebarNavigationTree({
    super.key,
    required this.accounts,
    this.selectedAccount,
    required this.expandedNodes,
    required this.onAccountSelected,
    required this.onToggleExpand,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: accounts.expand((account) => _buildTreeItems(account)).toList(),
    );
  }

  List<Widget> _buildTreeItems(AccountNode account) {
    List<Widget> items = [];
    items.add(_buildTreeItem(account));

    if (account.isGroup && expandedNodes.contains(account.code)) {
      for (var child in account.children) {
        items.addAll(_buildTreeItems(child));
      }
    }

    return items;
  }

  Widget _buildTreeItem(AccountNode account) {
    final isSelected = selectedAccount?.code == account.code;
    final isExpanded = expandedNodes.contains(account.code);

    return Padding(
      padding: EdgeInsets.only(
        left: 8.0 + (account.level * 16),
        right: 8,
        bottom: 4,
      ),
      child: GestureDetector(
        onTap: () => onAccountSelected(account),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFF0F4F8) : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: account.isGroup
                    ? () => onToggleExpand(account.code)
                    : null,
                child: Icon(
                  account.isGroup
                      ? (isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.chevron_right)
                      : Icons.chevron_right,
                  size: 14,
                  color: account.isGroup
                      ? (isSelected ? Colors.black : Colors.grey)
                      : Colors.transparent,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                account.isGroup
                    ? (isExpanded
                          ? Icons.folder_open_outlined
                          : Icons.folder_outlined)
                    : Icons.description_outlined,
                size: 18,
                color: isSelected ? const Color(0xFF00C48C) : Colors.blueGrey,
              ),
              const SizedBox(width: 8),
              Text(
                account.code,
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  account.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryDetailsPanel extends StatelessWidget {
  final AccountNode account;

  const CategoryDetailsPanel({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    account.isGroup
                        ? Icons.folder_open
                        : Icons.description_outlined,
                    color: const Color(0xFF00C48C),
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      account.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D2137),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  account.code,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double minTableWidth = 800;
              double tableWidth = constraints.maxWidth > minTableWidth
                  ? constraints.maxWidth
                  : minTableWidth;

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: tableWidth - 64,
                    child: ChartOfAccountsTable(
                      accounts: account.children.isNotEmpty
                          ? account.children
                          : [account],
                      isCompact: true,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AccountRow extends StatelessWidget {
  final AccountNode account;
  final bool isCompact;

  const _AccountRow({required this.account, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              account.code,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(width: account.level * 20.0),
                Icon(
                  account.isGroup
                      ? Icons.folder_open_outlined
                      : Icons.insert_drive_file_outlined,
                  size: 18,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    account.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: account.isGroup
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              account.type,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              account.balance.toStringAsFixed(2),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            width: 60,
            child: Icon(Icons.more_horiz, size: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  final bool isCompact;
  const _TableHeader({this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
      fontSize: 13,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          const Expanded(flex: 1, child: Text("Account Code", style: style)),
          const Expanded(flex: 4, child: Text("Account Name", style: style)),
          const Expanded(flex: 2, child: Text("Account Type", style: style)),
          const Expanded(flex: 2, child: Text("Balance", style: style)),
          const SizedBox(
            width: 60,
            child: Text(
              "Actions",
              style: style,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black87,
        side: BorderSide(color: Colors.grey.shade300),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}

class _AddAccountButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddAccountButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0D2137),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: const Icon(Icons.add, size: 18),
      label: const Text("Add Account"),
    );
  }
}
