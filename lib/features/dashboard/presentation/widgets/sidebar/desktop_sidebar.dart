import 'package:flutter/material.dart';

class DesktopSidebar extends StatelessWidget {
  const DesktopSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: Colors.grey.shade900,
      child: const Center(
        child: Text('Sidebar', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
