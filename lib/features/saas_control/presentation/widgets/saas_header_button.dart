// import 'package:flutter/material.dart';

// class SaaSHeaderButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onTap;
//   final bool isPrimary;

//   const SaaSHeaderButton({
//     super.key,
//     required this.label,
//     required this.icon,
//     required this.onTap,
//     this.isPrimary = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final Color backgroundColor = isPrimary
//         ? const Color(0xFF10B981)
//         : Colors.white;
//     final Color contentColor = isPrimary
//         ? Colors.white
//         : const Color(0xFF374151);
//     final Color borderColor = isPrimary
//         ? Colors.transparent
//         : const Color(0xFFE5E7EB);

//     return Container(
//       margin: const EdgeInsets.only(left: 12),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: borderColor),
//         boxShadow: [
//           if (isPrimary)
//             BoxShadow(
//               color: const Color(0xFF10B981).withOpacity(0.2),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//         ],
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onTap,
//           borderRadius: BorderRadius.circular(8),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(icon, size: 18, color: contentColor),
//                 const SizedBox(width: 8),
//                 Text(
//                   label,
//                   style: TextStyle(
//                     color: contentColor,
//                     fontWeight: FontWeight.w600,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
