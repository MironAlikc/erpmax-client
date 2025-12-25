import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'dashboard_desktop_layout.dart';
import 'dashboard_mobile_layout.dart';

class AdaptiveDashboardLayout extends StatelessWidget {
  final Widget child;

  const AdaptiveDashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: DashboardMobileLayout(child: child),
      desktop: DashboardDesktopLayout(child: child),
    );
  }
}
