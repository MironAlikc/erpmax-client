import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/activity_log_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/components/company_info_card.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/components/contact_person_card.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/components/header_buttons.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/backups_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/general_ledger_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/invoices_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/modules_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/payments_view.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/subscription_status_view.dart';

class SubscriberDetailPanel extends StatefulWidget {
  final dynamic subscriber;
  final VoidCallback onClose;

  const SubscriberDetailPanel({
    super.key,
    required this.subscriber,
    required this.onClose,
  });

  @override
  State<SubscriberDetailPanel> createState() => _SubscriberDetailPanelState();
}

class _SubscriberDetailPanelState extends State<SubscriberDetailPanel> {
  String _activeTab = "Subscription";

  final List<ErpMaxTabItem> _detailTabs = [
    const ErpMaxTabItem(
      name: 'Subscription',
      icon: CupertinoIcons.arrow_2_circlepath,
    ),
    const ErpMaxTabItem(name: 'Invoices', icon: CupertinoIcons.doc_text),
    const ErpMaxTabItem(name: 'Payments', icon: CupertinoIcons.money_dollar),
    const ErpMaxTabItem(name: 'Backups', icon: CupertinoIcons.layers_alt),
    const ErpMaxTabItem(name: 'Modules', icon: CupertinoIcons.square_grid_2x2),
    const ErpMaxTabItem(name: 'General Ledger', icon: CupertinoIcons.book),
    const ErpMaxTabItem(
      name: 'Activity Log',
      icon: CupertinoIcons.list_bullet_indent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double panelWidth = screenWidth < 600
        ? screenWidth
        : screenWidth * 0.5;

    return Container(
      width: panelWidth.clamp(500.0, 900.0),
      height: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(-10, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTopNavigationBar(),
          _buildBlackTabRunner(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: HeaderButtons(),
                  ),
                  const SizedBox(height: 24),
                  _buildCardsGrid(),
                  const SizedBox(height: 32),
                  ErpMaxTabFilter(
                    items: _detailTabs,
                    selectedItem: _activeTab,
                    onSelected: (name) => setState(() => _activeTab = name),
                  ),
                  const SizedBox(height: 24),
                  _getTabView(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavigationBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          const Icon(Icons.person_outline, size: 20),
          const SizedBox(width: 8),
          const Text(
            'Subscriber Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close, size: 20),
            onPressed: widget.onClose,
          ),
        ],
      ),
    );
  }

  Widget _buildBlackTabRunner() {
    return Container(
      width: double.infinity,
      height: 40,
      color: const Color(0xFF111827),
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF1F2937),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Row(
              children: [
                const Text(
                  '1. Subscriber Details',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.close,
                  color: Colors.white.withOpacity(0.5),
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 650) {
          return Column(
            children: [
              CompanyInfoCard(subscriber: widget.subscriber),
              const SizedBox(height: 16),
              const ContactPersonCard(),
            ],
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CompanyInfoCard(subscriber: widget.subscriber),
            ),
            const SizedBox(width: 12),
            const Expanded(flex: 3, child: ContactPersonCard()),
          ],
        );
      },
    );
  }

  Widget _getTabView() {
    switch (_activeTab) {
      case "Subscription":
        return const SubscriptionStatusView();
      case "Invoices":
        return const InvoicesView();
      case "Payments":
        return const PaymentsView();
      case "Backups":
        return const BackupsView();
      case "Modules":
        return const ModulesView();
      case "General Ledger":
        return const GeneralLedgerView();
      case "Activity Log":
        return const ActivityLogView();
      default:
        return const SizedBox.shrink();
    }
  }
}
