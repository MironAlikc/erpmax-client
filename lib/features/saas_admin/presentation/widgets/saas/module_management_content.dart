import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';

// --- Модель ---
class ModuleModel {
  final String name;
  final List<String> packages;
  final String version;
  final bool isActive;
  final double price;
  final String description;

  const ModuleModel(
    this.name,
    this.packages,
    this.version,
    this.isActive, {
    this.price = 0,
    this.description = "Standard ERP module with full functionality.",
  });
}

class ModuleManagementContent extends StatelessWidget {
  const ModuleManagementContent({super.key});

  static const List<ModuleModel> _modules = [
    ModuleModel(
      "Accounting",
      ["Starter", "Professional", "Enterprise"],
      "v 2.1.0",
      true,
    ),
    ModuleModel("Inventory", ["Professional", "Enterprise"], "v 1.5.2", true),
    ModuleModel(
      "Sales",
      ["Starter", "Professional", "Enterprise"],
      "v 2.0.1",
      true,
    ),
    ModuleModel("Purchases", ["Professional", "Enterprise"], "v 1.8.0", true),
    ModuleModel("HR & Payroll", ["Enterprise"], "v 1.0.0", false, price: 150),
    ModuleModel("CRM", ["Professional", "Enterprise"], "v 1.2.0", true),
    ModuleModel("AI Analytics", ["Enterprise"], "v 0.9.5", true),
    ModuleModel("SaaS Control", ["Enterprise"], "v 1.1.0", true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50, // Фон как на фото
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDesign.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildTableContainer(context)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.activeGreen,
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _buildTableContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
        border: Border.all(color: AppColors.gray200),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ErpMaxDataTable<ModuleModel>(
        onRowTap: (item) => _showModuleDetails(context, item),
        columns: [
          ErpMaxColumn(title: "Module Name", weight: 0.25, isSortable: true),
          ErpMaxColumn(title: "Assigned Packages", weight: 0.35),
          ErpMaxColumn(title: "Version", weight: 0.15),
          ErpMaxColumn(title: "Status", weight: 0.15),
          ErpMaxColumn(
            title: "Actions",
            weight: 0.1,
            textAlign: TextAlign.right,
          ),
        ],
        items: _modules,
        rowBuilder: (item) => [
          Text(
            item.name,
            style: AppTextStyles.labelStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildPackageBadges(item.packages),
          Text(item.version, style: AppTextStyles.bodySmall),
          StatusBadge(isActive: item.isActive),
          const Icon(Icons.more_horiz, color: AppColors.gray400),
        ],
      ),
    );
  }

  Widget _buildPackageBadges(List<String> packages) {
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: packages.map((p) => PackageBadge(label: p)).toList(),
    );
  }

  void _showModuleDetails(BuildContext context, ModuleModel module) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withOpacity(0.4),
      transitionDuration: AppDesign.sidebarDuration,
      pageBuilder: (_, __, ___) => Align(
        alignment: Alignment.centerRight,
        child: ModuleDetailsSidePanel(module: module),
      ),
      transitionBuilder: (_, anim, __, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: anim, curve: AppDesign.defaultCurve)),
        child: child,
      ),
    );
  }
}

// --- Status Badge ---
class StatusBadge extends StatelessWidget {
  final bool isActive;
  const StatusBadge({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? AppColors.success : AppColors.gray100,
        borderRadius: BorderRadius.circular(AppDesign.chipRadius),
      ),
      child: Text(
        isActive ? "Active" : "Inactive",
        style: AppTextStyles.bodySmall.copyWith(
          color: isActive ? AppColors.white : AppColors.textSecondary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// --- Package Badge ---
class PackageBadge extends StatelessWidget {
  final String label;
  const PackageBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDesign.chipRadius),
        border: Border.all(color: AppColors.gray300),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// --- SIDE PANEL ---
class ModuleDetailsSidePanel extends StatefulWidget {
  final ModuleModel module;
  const ModuleDetailsSidePanel({super.key, required this.module});

  @override
  State<ModuleDetailsSidePanel> createState() => _ModuleDetailsSidePanelState();
}

class _ModuleDetailsSidePanelState extends State<ModuleDetailsSidePanel> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5, // 50% экрана
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: AppColors.gray200)),
        ),
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppDesign.formInnerPadding),
                child: Column(
                  children: [
                    _buildTopButtons(context),
                    const SizedBox(height: 32),
                    _buildInfoCards(),
                    const SizedBox(height: 40),
                    _buildTabs(),
                    const SizedBox(height: 24),
                    _tabIndex == 0
                        ? _buildPackagesGrid()
                        : _buildHistoryTable(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(40, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Module Details", style: AppTextStyles.h2),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: const BoxDecoration(
              color: AppColors.sidebarBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "1. Module Details",
                  style: AppTextStyles.sidebarActive.copyWith(fontSize: 12),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.close, color: Colors.white54, size: 14),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.gray300),
        ],
      ),
    );
  }

  Widget _buildTopButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _actionBtn(
          Icons.edit_outlined,
          "Edit Module",
          () => _showEditDialog(context),
        ),
        const SizedBox(width: 12),
        _actionBtn(Icons.print_outlined, "Print Profile", () {}),
      ],
    );
  }

  Widget _actionBtn(IconData icon, String label, VoidCallback onTap) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.gray300),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
        ),
      ),
    );
  }

  Widget _buildInfoCards() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Левая карточка
        Expanded(
          flex: 3,
          child: _card(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.module.name, style: AppTextStyles.h1),
                    StatusBadge(isActive: widget.module.isActive),
                  ],
                ),
                const SizedBox(height: 16),
                _iconLabel(
                  Icons.code,
                  widget.module.version,
                  Icons.payments_outlined,
                  "${widget.module.price} SAR",
                ),
                const SizedBox(height: 8),
                _iconLabel(
                  Icons.info_outline,
                  "Namaa Systems",
                  Icons.history,
                  "Last Update: 2023-12-15",
                ),
                const Divider(height: 32),
                Text(
                  widget.module.description,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Правая карточка (Статистика)
        Expanded(
          flex: 2,
          child: _card(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("MODULE STATS", style: AppTextStyles.tableHeader),
                const SizedBox(height: 20),
                _statRow("Active Installs", "245"),
                _statRow("Usage Rate", "85%"),
                _statRow("Error Rate", "0.01%", color: AppColors.success),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _card(Widget child) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.gray50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gray200),
      ),
      child: child,
    );
  }

  Widget _iconLabel(IconData i1, String t1, IconData i2, String t2) {
    return Row(
      children: [
        Icon(i1, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          t1,
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(width: 16),
        Icon(i2, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(
          t2,
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _statRow(String label, String val, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.bodySmall),
          Text(
            val,
            style: AppTextStyles.labelStyle.copyWith(
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _tabBtn("Assigned Packages", 0),
        const SizedBox(width: 24),
        _tabBtn("history", 1),
      ],
    );
  }

  Widget _tabBtn(String label, int index) {
    bool active = _tabIndex == index;
    return InkWell(
      onTap: () => setState(() => _tabIndex = index),
      child: Column(
        children: [
          Text(
            label,
            style: AppTextStyles.labelStyle.copyWith(
              color: active
                  ? AppColors.sidebarBackground
                  : AppColors.textSecondary,
            ),
          ),
          if (active)
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 2,
              width: 40,
              color: AppColors.sidebarBackground,
            ),
        ],
      ),
    );
  }

  Widget _buildPackagesGrid() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: widget.module.packages
          .map(
            (p) => Container(
              width: 240,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.gray200),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.layers_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(p, style: AppTextStyles.labelStyle),
                  const Spacer(),
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors.success,
                    size: 18,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildHistoryTable() {
    return const Center(child: Text("History logs content here..."));
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (c) => EditModuleDialog(module: widget.module),
    );
  }
}

// --- EDIT DIALOG ---
class EditModuleDialog extends StatelessWidget {
  final ModuleModel module;
  const EditModuleDialog({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Edit Module", style: AppTextStyles.h2),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _input("Module Name (En)", module.name),
            _input("Module Name (Ar)", " Module Nam "),
            _input("Version", module.version),
            _input("Price", module.price.toString()),
            _input("Status", "Inactive", isDropdown: true),
            _input("Description", module.description, maxLines: 3),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.sidebarBackground,
                  ),
                  child: const Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _input(
    String label,
    String val, {
    bool isDropdown = false,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 140,
            child: Text(label, style: AppTextStyles.labelStyle),
          ),
          Expanded(
            child: TextField(
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: val,
                suffixIcon: isDropdown ? const Icon(Icons.unfold_more) : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
