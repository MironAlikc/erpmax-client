import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/chart_of_accounts/widgets/custom_segmented_control.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/chart_of_accounts/widgets/view_control_action_btn.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_action_btn.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_input.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/accounting_header_btn.dart';
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
    final theme = context.theme.appColor;
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
                  color: theme.borderMedium,
                ),
              ),
            ],
            AccActionBtn(
              icon: LucideIcons.printer,
              label: localizations.print,
              onTap: () {},
            ),
            AccActionBtn(
              icon: LucideIcons.folderPlus,
              label: localizations.action_add_group,
              onTap: () {},
            ),
            AccountingHeaderBtn(
              label: localizations.accAddAccount,
              icon: LucideIcons.plus,
              textColor: Colors.white,
              height: 18,
              onTap: () {},
            ),
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
    final theme = context.theme.appColor;

    final flatAccounts = _getFlattenedAccounts();
    final displayAccounts = isCompact && flatAccounts.length > 5
        ? flatAccounts.take(5).toList()
        : flatAccounts;

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TableHeader(isCompact: isCompact),
          Divider(height: 1, color: theme.border),
          for (int i = 0; i < displayAccounts.length; i++) ...[
            _AccountRow(account: displayAccounts[i], isCompact: isCompact),
            if (i < displayAccounts.length - 1)
              Divider(height: 1, color: theme.border),
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
    final theme = context.theme.appColor;

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.borderLight),
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
                child: Center(child: Container(width: 1, color: theme.border)),
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
    final theme = context.theme.appColor;

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: accounts
          .expand((account) => _buildTreeItems(theme, account))
          .toList(),
    );
  }

  List<Widget> _buildTreeItems(AppColorExtension colors, AccountNode account) {
    List<Widget> items = [];
    items.add(
      _TreeItem(
        account: account,
        selectedAccount: selectedAccount,
        expandedNodes: expandedNodes,
        onAccountSelected: onAccountSelected,
        onToggleExpand: onToggleExpand,
      ),
    );

    if (account.isGroup && expandedNodes.contains(account.code)) {
      for (var child in account.children) {
        items.addAll(_buildTreeItems(colors, child));
      }
    }

    return items;
  }
}

class _TreeItem extends StatefulWidget {
  final AccountNode account;
  final AccountNode? selectedAccount;
  final Set<String> expandedNodes;
  final Function(AccountNode) onAccountSelected;
  final Function(String) onToggleExpand;

  const _TreeItem({
    required this.account,
    required this.selectedAccount,
    required this.expandedNodes,
    required this.onAccountSelected,
    required this.onToggleExpand,
  });

  @override
  State<_TreeItem> createState() => _TreeItemState();
}

class _TreeItemState extends State<_TreeItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.appColor;
    final isSelected = widget.selectedAccount?.code == widget.account.code;
    final isExpanded = widget.expandedNodes.contains(widget.account.code);

    return Padding(
      padding: EdgeInsets.only(
        left: 8.0 + (widget.account.level * 16),
        right: 8,
        bottom: 4,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () => widget.onAccountSelected(widget.account),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? colors.gray50
                  : (_isHovered
                        ? colors.gray50.withValues(alpha: 0.5)
                        : Colors.transparent),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: widget.account.isGroup
                      ? () => widget.onToggleExpand(widget.account.code)
                      : null,
                  child: Icon(
                    widget.account.isGroup
                        ? (isExpanded
                              ? LucideIcons.chevronDown
                              : LucideIcons.chevronRight)
                        : LucideIcons.chevronRight,
                    size: 14,
                    color: widget.account.isGroup
                        ? (isSelected
                              ? colors.textTertiary
                              : colors.textSecondary)
                        : Colors.transparent,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  widget.account.isGroup
                      ? (isExpanded
                            ? LucideIcons.folderOpen
                            : LucideIcons.folder)
                      : LucideIcons.folder,
                  size: 18,
                  color: isSelected ? colors.success : colors.gray400,
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colors.gray300.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    widget.account.code,
                    style: AppTextStyles.overline.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    widget.account.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.tableHeader.copyWith(
                      letterSpacing: 0.4,
                      color: isSelected
                          ? colors.textPrimary
                          : colors.textSecondary,
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
      ),
    );
  }
}

class CategoryDetailsPanel extends StatelessWidget {
  final AccountNode account;

  const CategoryDetailsPanel({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

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
                        ? LucideIcons.folderOpen
                        : LucideIcons.fileText,
                    color: theme.success,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      account.name,
                      style: AppTextStyles.h4.copyWith(
                        color: theme.textPrimary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  account.code,
                  style: AppTextStyles.h5.copyWith(color: theme.textSecondary),
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

class _AccountRow extends StatefulWidget {
  final AccountNode account;
  final bool isCompact;

  const _AccountRow({required this.account, this.isCompact = false});

  @override
  State<_AccountRow> createState() => _AccountRowState();
}

class _AccountRowState extends State<_AccountRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        color: _isHovered ? theme.gray50 : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                widget.account.code,
                style: AppTextStyles.sidebarItem.copyWith(
                  color: theme.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  SizedBox(width: widget.account.level * 20.0),
                  Icon(
                    widget.account.isGroup
                        ? LucideIcons.folderOpen
                        : LucideIcons.file,
                    size: 18,
                    color: theme.gray400,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.account.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.tableHeader.copyWith(
                        letterSpacing: 0.4,
                        color: theme.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.account.type,
                style: AppTextStyles.sidebarItem.copyWith(
                  color: theme.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.account.balance.toStringAsFixed(2),
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.sidebarItem.copyWith(
                  color: theme.textTertiary,
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: Icon(
                LucideIcons.moreHorizontal,
                size: 20,
                color: theme.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  final bool isCompact;
  const _TableHeader({this.isCompact = false});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

    return Container(
      decoration: BoxDecoration(
        color: theme.gray50,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(localizations.column_account_code, style: style),
          ),
          Expanded(
            flex: 4,
            child: Text(localizations.column_account_name, style: style),
          ),
          Expanded(
            flex: 2,
            child: Text(localizations.column_account_type, style: style),
          ),
          Expanded(
            flex: 2,
            child: Text(localizations.column_balance, style: style),
          ),
          SizedBox(
            width: 60,
            child: Text(
              localizations.actions,
              style: style,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
