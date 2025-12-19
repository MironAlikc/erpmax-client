// // lib/features/dashboard/presentation/widgets/desktop_header.dart

// import 'package:flutter/material.dart';

// class DesktopHeader extends StatelessWidget {
//   const DesktopHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       height: 60,
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//       decoration: BoxDecoration(
//         color: theme.colorScheme.onPrimary,
//         border: Border(bottom: BorderSide(color: theme.dividerColor, width: 1)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.notifications_none,
//               color: theme.textTheme.bodySmall!.color,
//               size: 24,
//             ),
//             onPressed: () {},
//           ),
//           const SizedBox(width: 20),
//           const _UserAvatarBlock(),
//         ],
//       ),
//     );
//   }
// }

// class _UserAvatarBlock extends StatelessWidget {
//   const _UserAvatarBlock();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;

//     return Row(
//       children: [
//         Text('Ahmed Mohamed', style: textTheme.bodyMedium),
//         const SizedBox(width: 8),
//         Container(
//           width: 36,
//           height: 36,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(color: theme.dividerColor, width: 1),
//           ),
//           child: CircleAvatar(
//             radius: 18,
//             backgroundColor: theme.colorScheme.primary,
//             child: Text(
//               'A',
//               style: TextStyle(
//                 color: theme.colorScheme.onPrimary,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         Icon(
//           Icons.keyboard_arrow_down,
//           color: textTheme.bodySmall!.color,
//           size: 18,
//         ),
//       ],
//     );
//   }
// }
