import 'package:flutter/material.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentTitle; // Переименовали title в currentTitle

  const MobileAppBar({super.key, required this.currentTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(currentTitle), centerTitle: false);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
