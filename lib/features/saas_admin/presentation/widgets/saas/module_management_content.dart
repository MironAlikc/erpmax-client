import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

class ModuleModel {
  final String name;
  final List<String> packages;
  final String version;
  final bool isActive;
  final double price;
  final String? description;

  const ModuleModel({
    required this.name,
    required this.packages,
    required this.version,
    required this.isActive,
    this.price = 0,
    this.description,
  });
}

class ModuleManagementContent extends StatelessWidget {
  const ModuleManagementContent({super.key});

  static List<ModuleModel> getModules(AppLocalizations localizations) {
    return [
      ModuleModel(
        name: localizations.menuAccounting,
        packages: [
          localizations.planStarter,
          localizations.pkgProfessional,
          localizations.pkgEnterprise,
        ],
        version: "v 2.1.0",
        isActive: true,
      ),
      ModuleModel(
        name: localizations.menuInventory,
        packages: [localizations.pkgProfessional, localizations.pkgEnterprise],
        version: "v 1.5.2",
        isActive: true,
      ),
      ModuleModel(
        name: localizations.menuSales,
        packages: [
          localizations.planStarter,
          localizations.pkgProfessional,
          localizations.pkgEnterprise,
        ],
        version: "v 2.0.1",
        isActive: true,
      ),
      ModuleModel(
        name: localizations.moduleHrPayroll,
        packages: [localizations.pkgEnterprise],
        version: "v 1.0.0",
        isActive: false,
        price: 150,
      ),
      ModuleModel(
        name: localizations.moduleCrm,
        packages: [localizations.pkgProfessional, localizations.pkgEnterprise],
        version: "v 1.2.0",
        isActive: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: theme.inactiveBg,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.moduleManagement,
              style: AppTextStyles.h2.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 24),
            _buildTableContainer(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.activeGreen,
        child: Icon(Icons.add, color: theme.white, size: 28),
      ),
    );
  }

  Widget _buildTableContainer(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);
    final modules = getModules(localizations);

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: theme.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ErpMaxDataTable<ModuleModel>(
        onRowTap: (item) => _showModuleDetails(context, item),
        columns: [
          ErpMaxColumn(title: localizations.moduleName, weight: 0.25),
          ErpMaxColumn(title: localizations.assignedPackages, weight: 0.35),
          ErpMaxColumn(title: localizations.version, weight: 0.15),
          ErpMaxColumn(title: localizations.status, weight: 0.15),
          ErpMaxColumn(
            title: localizations.actions,
            weight: 0.1,
            textAlign: TextAlign.right,
          ),
        ],
        items: modules,
        rowBuilder: (item) => [
          Text(
            item.name,
            style: AppTextStyles.bodyMediumBold.copyWith(
              color: theme.textPrimary,
            ),
          ),
          _buildPackageBadges(item.packages),
          Text(
            item.version,
            style: AppTextStyles.bodySmall.copyWith(color: theme.textSecondary),
          ),
          StatusBadge(isActive: item.isActive),
          Icon(Icons.more_horiz, color: theme.textDisabled),
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
      barrierColor: context.theme.appColor.black.withValues(alpha: 0.4),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => Align(
        alignment: Alignment.centerRight,
        child: ModuleDetailsSidePanel(module: module),
      ),
      transitionBuilder: (_, anim, __, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(anim),
        child: child,
      ),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final bool isActive;
  const StatusBadge({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);
    final color = isActive ? theme.activeGreen : theme.textSecondary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Text(
        isActive ? localizations.active : localizations.inactive,
        style: AppTextStyles.bodySmall.copyWith(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PackageBadge extends StatelessWidget {
  final String label;
  const PackageBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: theme.border),
      ),
      child: Text(
        label,
        style: AppTextStyles.tableHeader.copyWith(
          fontSize: 10,
          color: theme.textSecondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

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
    final theme = context.theme.appColor;
    final size = MediaQuery.of(context).size;

    return Material(
      elevation: 16,
      child: Container(
        width: size.width * 0.45,
        height: size.height,
        color: theme.white,
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    _buildActionButtons(),
                    const SizedBox(height: 32),
                    _buildModuleInfoCard(),
                    const SizedBox(height: 32),
                    _buildTabs(context),
                    const Divider(height: 1),
                    const SizedBox(height: 24),
                    _tabIndex == 0
                        ? _buildPackagesGrid()
                        : Center(
                            child: Text(
                              AppLocalizations.of(context).historyLogs,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 24, 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.theme.appColor.borderLight),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context).moduleProfile,
            style: AppTextStyles.h2.copyWith(
              color: context.theme.appColor.textPrimary,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit_outlined, size: 18),
          label: Text(localizations.editModule),
          style: OutlinedButton.styleFrom(foregroundColor: theme.textPrimary),
        ),
        const SizedBox(width: 12),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.print_outlined, size: 18),
          label: Text(localizations.print),
          style: OutlinedButton.styleFrom(foregroundColor: theme.textPrimary),
        ),
      ],
    );
  }

  Widget _buildModuleInfoCard() {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.module.name,
                style: AppTextStyles.h1.copyWith(color: theme.textPrimary),
              ),
              StatusBadge(isActive: widget.module.isActive),
            ],
          ),
          const SizedBox(height: 16),
          _infoRow(
            Icons.vpn_key_outlined,
            localizations.versionFormat(widget.module.version),
          ),
          _infoRow(
            Icons.monetization_on_outlined,
            localizations.basePriceFormat(widget.module.price),
          ),
          const Divider(height: 32),
          Text(
            widget.module.description ??
                localizations.moduleDescriptionStandard,
            style: AppTextStyles.bodyMedium.copyWith(
              color: theme.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    final theme = context.theme.appColor;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: theme.textSecondary),
          const SizedBox(width: 8),
          Text(
            text,
            style: AppTextStyles.bodySmallBold.copyWith(
              color: theme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Row(
      children: [
        _tabItem(localizations.assignedPackages, 0),
        _tabItem(localizations.updateHistory, 1),
      ],
    );
  }

  Widget _tabItem(String label, int index) {
    final theme = context.theme.appColor;

    bool active = _tabIndex == index;
    return InkWell(
      onTap: () => setState(() => _tabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: active ? theme.textPrimary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style:
              (active ? AppTextStyles.bodyMediumBold : AppTextStyles.bodyMedium)
                  .copyWith(
                    color: active ? theme.textPrimary : theme.textSecondary,
                  ),
        ),
      ),
    );
  }

  Widget _buildPackagesGrid() {
    final theme = context.theme.appColor;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3,
      ),
      itemCount: widget.module.packages.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: theme.border),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.layers_outlined, size: 18, color: theme.textSecondary),
              const SizedBox(width: 12),
              Text(
                widget.module.packages[index],
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: theme.textPrimary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
