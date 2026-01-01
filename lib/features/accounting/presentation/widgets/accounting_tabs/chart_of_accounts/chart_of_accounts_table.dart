import 'package:flutter/material.dart';

class ChartOfAccountsBody extends StatefulWidget {
  const ChartOfAccountsBody({super.key});

  @override
  State<ChartOfAccountsBody> createState() => _ChartOfAccountsBodyState();
}

class _ChartOfAccountsBodyState extends State<ChartOfAccountsBody> {
  bool isTreeView = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChartOfAccountsControls(
          isTreeView: isTreeView,
          onViewChanged: (val) => setState(() => isTreeView = val),
        ),
        const SizedBox(height: 20),

        SizedBox(
          height: 600,
          child: isTreeView
              ? const ChartTreeViewLayout()
              : SingleChildScrollView(child: const ChartOfAccountsTable()),
        ),
      ],
    );
  }
}

class ChartOfAccountsControls extends StatelessWidget {
  final bool isTreeView;
  final Function(bool) onViewChanged;

  const ChartOfAccountsControls({
    super.key,
    required this.isTreeView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
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
            _CustomToggle(isTreeView: isTreeView, onChanged: onViewChanged),
            if (isTreeView) ...[
              const SizedBox(width: 8),
              _SmallActionButton(
                icon: Icons.unfold_more,
                label: "Expand",
                onTap: () {},
              ),
              _SmallActionButton(
                icon: Icons.unfold_less,
                label: "Collapse",
                onTap: () {},
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
              label: "Print",
              onTap: () {},
            ),
            _ActionButton(
              icon: Icons.create_new_folder_outlined,
              label: "Add Group",
              onTap: () {},
            ),
            _AddAccountButton(onTap: () {}),
          ],
        ),
        const _SearchField(),
      ],
    );
  }
}

class ChartOfAccountsTable extends StatelessWidget {
  final bool isCompact;

  const ChartOfAccountsTable({super.key, this.isCompact = false});

  @override
  Widget build(BuildContext context) {
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
          for (int i = 0; i < (isCompact ? 5 : 10); i++) ...[
            _AccountRow(
              code: "111$i",
              name: "Cash and Cash Equivalents Item Number $i",
              type: "Asset",
              balance: "0.00",
              level: isCompact ? 0 : 1,
              isGroup: i % 2 == 0,
              isCompact: isCompact,
            ),
            if (i < (isCompact ? 4 : 9)) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}

class ChartTreeViewLayout extends StatefulWidget {
  const ChartTreeViewLayout({super.key});

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
          SizedBox(width: _sidebarWidth, child: const SidebarNavigationTree()),

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

          const Expanded(child: CategoryDetailsPanel()),
        ],
      ),
    );
  }
}

class SidebarNavigationTree extends StatelessWidget {
  const SidebarNavigationTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        _buildTreeItem(
          "Application of Funds (Assets)",
          "1",
          true,
          0,
          isSelected: true,
        ),
        _buildTreeItem("Current Assets", "1100", true, 1),
        _buildTreeItem("Cash and Bank", "1110", false, 2),
        _buildTreeItem("Accounts Receivable", "1120", false, 2),
        _buildTreeItem("Fixed Assets", "1500", true, 1),
        _buildTreeItem("Property, Plant & Equipment", "1510", false, 2),
        _buildTreeItem("Source of Funds (Liabilities)", "2", true, 0),
        _buildTreeItem("Current Liabilities", "2100", true, 1),
        _buildTreeItem("Accounts Payable", "2110", false, 2),
        _buildTreeItem("Equity", "3", true, 0),
        _buildTreeItem("Share Capital", "3100", false, 1),
        _buildTreeItem("Retained Earnings", "3200", false, 1),
      ],
    );
  }

  Widget _buildTreeItem(
    String title,
    String code,
    bool isFolder,
    int level, {
    bool isSelected = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0 + (level * 16), right: 8, bottom: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0F4F8) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.chevron_right,
              size: 14,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 4),
            Icon(
              isFolder
                  ? Icons.folder_open_outlined
                  : Icons.description_outlined,
              size: 18,
              color: isSelected ? const Color(0xFF00C48C) : Colors.blueGrey,
            ),
            const SizedBox(width: 8),
            Text(
              code,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDetailsPanel extends StatelessWidget {
  const CategoryDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER - не скроллится
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.folder_open, color: Color(0xFF00C48C), size: 28),
                  SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      "Application of Funds (Assets)",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0D2137),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
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
                    child: const ChartOfAccountsTable(isCompact: true),
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
  final String code, name, type, balance;
  final int level;
  final bool isGroup, isCompact;

  const _AccountRow({
    required this.code,
    required this.name,
    required this.type,
    required this.balance,
    required this.level,
    required this.isGroup,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              code,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(width: level * 20.0),
                Icon(
                  isGroup
                      ? Icons.folder_open_outlined
                      : Icons.insert_drive_file_outlined,
                  size: 18,
                  color: Colors.blueGrey,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isGroup ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(
              type,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Expanded(
            flex: 2,
            child: Text(balance, overflow: TextOverflow.ellipsis),
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
  const _TableHeader({super.key, this.isCompact = false});

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

class _SmallActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _SmallActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 16, color: Colors.grey),
      label: Text(
        label,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
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

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search by name, code...",
          hintStyle: const TextStyle(fontSize: 13),
          prefixIcon: const Icon(Icons.search, size: 18),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

class _CustomToggle extends StatelessWidget {
  final bool isTreeView;
  final Function(bool) onChanged;

  const _CustomToggle({required this.isTreeView, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _toggleButton(
            Icons.account_tree_outlined,
            "Tree View",
            isTreeView,
            () => onChanged(true),
          ),
          _toggleButton(
            Icons.table_chart_outlined,
            "Table View",
            !isTreeView,
            () => onChanged(false),
          ),
        ],
      ),
    );
  }

  Widget _toggleButton(
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: isActive ? Colors.black : Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: isActive ? Colors.black : Colors.grey,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
