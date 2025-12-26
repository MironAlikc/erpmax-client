import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/subscriber_badges.dart';

class SubscriptionStatusView extends StatelessWidget {
  const SubscriptionStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(
                      CupertinoIcons.cube_box,
                      color: Color(0xFF10B981),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Subscription Status",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                "Current Plan",
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PlanBadge(text: "Starter"),
                  const SizedBox(width: 12),
                  const Text(
                    "500",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    "SAR",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                  ),
                  const Text(
                    " / Month",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const Spacer(),
                  const ActiveBadge(),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  _smallInfoBox(
                    CupertinoIcons.calendar,
                    "Renewal Date",
                    "NaN days overdue",
                    valueColor: const Color(0xFF10B981),
                  ),
                  const SizedBox(width: 16),
                  _smallInfoBox(
                    CupertinoIcons.money_dollar,
                    "MRR",
                    "5,000 SAR",
                  ),
                  const SizedBox(width: 16),
                  _smallInfoBox(
                    CupertinoIcons.calendar_badge_minus,
                    "Billing Cycle",
                    "Monthly",
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const ProgressBarSection(label: "Users", current: 5, total: 100),
              const SizedBox(height: 24),
              const ProgressBarSection(
                label: "Storage",
                current: 100,
                total: 100,
                unit: "GB",
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _upgradeActionBox(
                icon: CupertinoIcons.arrow_up_circle,
                title: "Upgrade Plan",
                subtitle: "Get more features",
                color: const Color(0xFF10B981),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _upgradeActionBox(
                icon: CupertinoIcons.arrow_down_circle,
                title: "Downgrade Plan",
                subtitle: "Reduce costs",
                color: const Color(0xFFF59E0B),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _smallInfoBox(
    IconData icon,
    String label,
    String value, {
    Color? valueColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 14, color: const Color(0xFF9CA3AF)),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: valueColor ?? const Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _upgradeActionBox({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Color(0xFF6B7280), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class ProgressBarSection extends StatelessWidget {
  final String label;
  final double current;
  final double total;
  final String unit;

  const ProgressBarSection({
    super.key,
    required this.label,
    required this.current,
    required this.total,
    this.unit = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF374151),
              ),
            ),
            Text(
              "${current.toInt()}${unit.isNotEmpty ? ' $unit' : ''}/$total${unit.isNotEmpty ? ' $unit' : ''}",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: current / total,
            minHeight: 8,
            backgroundColor: const Color(0xFFF3F4F6),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF111827)),
          ),
        ),
      ],
    );
  }
}
