import 'package:flutter/material.dart';
import 'dart:ui';

class ErpMaxSidePanel extends StatelessWidget {
  final Widget child;
  final bool isOpen;
  final VoidCallback onClose;
  final double width;

  const ErpMaxSidePanel({
    super.key,
    required this.child,
    required this.isOpen,
    required this.onClose,
    this.width = 600,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (isOpen)
          GestureDetector(
            onTap: onClose,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), // Размытие
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: Colors.black.withOpacity(0.6), // Затемнение
              ),
            ),
          ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          right: isOpen ? 0 : -width,
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: width,
            child: Material(elevation: 16, child: child),
          ),
        ),
      ],
    );
  }
}
