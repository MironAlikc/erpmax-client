import 'package:flutter/material.dart';

class TopNavigationBar extends StatelessWidget {
  final bool isMobile;

  const TopNavigationBar({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1)),
      ),
      child: Row(
        children: [
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF1E293B)),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),

          const Spacer(),
          if (!isMobile)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _QuickActionButton(
                  icon: Icons.groups_outlined,
                  label: "Customers",
                  onTap: () {},
                ),
                _QuickActionButton(
                  icon: Icons.shopping_cart_outlined,
                  label: "Sales",
                  onTap: () {},
                ),
                _QuickActionButton(
                  icon: Icons.local_mall_outlined,
                  label: "Purchases",
                  onTap: () {},
                ),
                _QuickActionButton(
                  icon: Icons.account_balance_wallet_outlined,
                  label: "funds",
                  onTap: () {},
                ),
                _QuickActionButton(
                  icon: Icons.description_outlined,
                  label: "Journal Entries",
                  onTap: () {},
                ),
              ],
            ),
          const Spacer(),
          _UserSection(isMobile: isMobile),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xFF1E293B), size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserSection extends StatelessWidget {
  final bool isMobile;
  const _UserSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isMobile) ...[
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Good Morning",
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
              ),
              Text(
                "07:22 AM",
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          const Text(
            "AR",
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 24),
          Stack(
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                color: Color(0xFF64748B),
                size: 26,
              ),
              Positioned(
                right: 2,
                top: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFF56D0A0),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Container(height: 40, width: 1, color: const Color(0xFFF1F5F9)),
          const SizedBox(width: 24),
        ],
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Ahmed Mohamed",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: Color(0xFF1E293B),
              ),
            ),
            Text(
              "System Admin",
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFF1F5F9), width: 2),
          ),
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=42'),
          ),
        ),
      ],
    );
  }
}
