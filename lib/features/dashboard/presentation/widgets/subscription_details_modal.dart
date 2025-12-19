import 'package:erpmax_client/features/dashboard/presentation/views/subscription_management_view.dart';
import 'package:flutter/material.dart';

class SubscriptionDetailsModal extends StatelessWidget {
  final SubscriptionData subscription;

  const SubscriptionDetailsModal({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 940,
        height: 1010,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAlias,
          child: DefaultTabController(
            length: 4,
            initialIndex: 1, // Pay Book по умолчанию
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: _buildAppBar(context),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopHeader(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: SubscriptionInfoCards(),
                  ),
                  const SizedBox(height: 24),
                  _buildCustomTabBar(),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildTabContent(const ModulesTab()),
                        _buildTabContent(const PayBookTab()),
                        const Center(child: Text('General Ledger Content')),
                        _buildTabContent(const ActivityLogTable()),
                      ],
                    ),
                  ),
                  _buildFooter(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(Widget child) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 32),
      child: child,
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _bread('SaaS Admin'),
              _sep(),
              _bread('Subscription Management'),
              _sep(),
              _bread('Subscription Details', last: true),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Subscription Details',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _bread(String t, {bool last = false}) => Text(
    t,
    style: TextStyle(
      fontSize: 12,
      color: last ? Colors.black54 : Colors.grey.shade400,
    ),
  );

  Widget _sep() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Icon(Icons.chevron_right, size: 14, color: Colors.grey.shade300),
  );

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Subscription Details',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(width: 6),
            Icon(Icons.close, size: 12, color: Colors.grey.shade400),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: Colors.black45),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 16),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: Colors.grey.shade100),
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F6F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TabBar(
          padding: const EdgeInsets.all(4),
          indicator: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey.shade500,
          labelStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(text: 'Modules'),
            Tab(text: 'Pay Book'),
            Tab(text: 'General Ledger'),
            Tab(text: 'Activity Log'),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Amendment',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1416C),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Cancel Subscription',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

/* -------------------- КАРТОЧКИ (CUSTOMER / PACKAGE / DURATION) -------------------- */
class SubscriptionInfoCards extends StatelessWidget {
  const SubscriptionInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _infoCard(
          icon: Icons.person_outline,
          title: 'Customer Information',
          rows: [
            ['Customer:', 'Al Amal Trading Company'],
            ['e-mail:', 'info@example.com'],
            ['phone number:', '+123456789'],
          ],
        ),
        const SizedBox(width: 20),
        _infoCard(
          icon: Icons.card_membership_outlined,
          title: 'Package Information',
          rows: [
            ['Package:', 'Enterprise'],
            ['Value:', '₪ 6,000'],
          ],
          extra: _statusBadge(
            'Paid',
            const Color(0xFFE8F5E9),
            const Color(0xFF50CD89),
            'Payment status:',
          ),
        ),
        const SizedBox(width: 20),
        _infoCard(
          icon: Icons.calendar_today_outlined,
          title: 'Duration Information',
          rows: [
            ['Start Date:', '15/1/2024'],
            ['Expiry date:', '14/1/2025'],
          ],
          extra: _statusBadge(
            'Finished',
            const Color(0xFFFFF8DD),
            const Color(0xFFF1BC00),
            'The Condition:',
          ),
        ),
      ],
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required List<List<String>> rows,
    Widget? extra,
  }) {
    return Expanded(
      child: Container(
        height: 140,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Colors.grey.shade400),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ...rows.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Text(
                      '${r[0]} ',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      r[1],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (extra != null) extra,
          ],
        ),
      ),
    );
  }

  Widget _statusBadge(String label, Color bg, Color text, String prefix) {
    return Row(
      children: [
        Text(
          '$prefix ',
          style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: text,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ],
    );
  }
}

/* -------------------- PAY BOOK (В ОДНОМ КОНТЕЙНЕРЕ) -------------------- */
class PayBookTab extends StatelessWidget {
  const PayBookTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Pay Book',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const Divider(height: 1),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return DataTable(
      headingRowHeight: 48,
      headingRowColor: MaterialStateProperty.all(const Color(0xFFF9FAFB)),
      columnSpacing: 30,
      columns: const [
        DataColumn(label: Icon(Icons.grid_view, size: 18, color: Colors.grey)),
        DataColumn(label: Text('Transaction Number')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Amount')),
        DataColumn(label: Text('Payment Method')),
        DataColumn(label: Text('Condition')),
        DataColumn(label: Text('Reference Number')),
      ],
      rows: [
        _row(
          'PAY-001',
          '15/1/2024',
          '₪ 6000',
          'Credit Card',
          'Complete',
          'TRX-123456',
        ),
        _row(
          'PAY-002',
          '15/1/2023',
          '₪ 6000',
          'Credit Card',
          'Complete',
          'TRX-123123',
        ),
      ],
    );
  }

  DataRow _row(String n, String d, String a, String m, String c, String r) {
    return DataRow(
      cells: [
        const DataCell(
          Icon(Icons.drag_indicator, size: 18, color: Color(0xFFD1D5DB)),
        ),
        DataCell(Text(n, style: const TextStyle(fontSize: 13))),
        DataCell(Text(d, style: const TextStyle(fontSize: 13))),
        DataCell(Text(a, style: const TextStyle(fontSize: 13))),
        DataCell(Text(m, style: const TextStyle(fontSize: 13))),
        DataCell(_status(c)),
        DataCell(Text(r, style: const TextStyle(fontSize: 13))),
      ],
    );
  }

  Widget _status(String s) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        s,
        style: const TextStyle(
          color: Color(0xFF50CD89),
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}

/* -------------------- ACTIVITY LOG (В ОДНОМ КОНТЕЙНЕРЕ С ЗАГОЛОВКОМ) -------------------- */
class ActivityLogTable extends StatelessWidget {
  const ActivityLogTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Activity Log',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const Divider(height: 1),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return DataTable(
      headingRowHeight: 48,
      headingRowColor: MaterialStateProperty.all(const Color(0xFFF9FAFB)),
      columns: const [
        DataColumn(label: Icon(Icons.grid_view, size: 18, color: Colors.grey)),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Procedure')),
        DataColumn(label: Text('User')),
        DataColumn(label: Text('Details')),
      ],
      rows: [
        _row(
          '15/1/2024',
          'Create a Subscription',
          'Ahmed Mohamed',
          'Subscription created successfully',
        ),
        _row(
          '15/1/2023',
          'Activate Subscription',
          'Sarah Ahmed',
          'Subscription notes modified',
        ),
        _row(
          '15/1/2023',
          'Modify Subscription',
          'Ahmed Mohamed',
          'Activated after confirmation',
        ),
      ],
    );
  }

  DataRow _row(String d, String p, String u, String det) {
    return DataRow(
      cells: [
        const DataCell(
          Icon(Icons.drag_indicator, size: 18, color: Color(0xFFD1D5DB)),
        ),
        DataCell(Text(d, style: const TextStyle(fontSize: 13))),
        DataCell(Text(p, style: const TextStyle(fontSize: 13))),
        DataCell(Text(u, style: const TextStyle(fontSize: 13))),
        DataCell(Text(det, style: const TextStyle(fontSize: 13))),
      ],
    );
  }
}

/* -------------------- MODULES -------------------- */
class ModulesTab extends StatelessWidget {
  const ModulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Modules',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  'Sales',
                  'Purchases',
                  'Inventory',
                  'Accounting',
                  'Reports',
                  'Manufacturing',
                ].map((m) => _module(m)).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Comments',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(height: 12),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Any additional comments',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xFFE0E0E0)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _module(String name) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF50CD89), size: 18),
          const SizedBox(width: 8),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF2E7D32),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
