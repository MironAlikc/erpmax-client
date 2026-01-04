import 'package:flutter/widgets.dart';

class ColorIconBtn extends StatelessWidget {
  final Color colorIcon;
  final Color color;
  final IconData icon;
  final double radius;
  final double iconSize;
  final double size;

  const ColorIconBtn({
    super.key,
    required this.colorIcon,
    required this.color,
    required this.icon,
    this.radius = 4,
    this.iconSize = 20,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Icon(icon, color: colorIcon, size: iconSize),
      ),
    );
  }
}
