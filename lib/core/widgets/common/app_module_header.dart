// import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
// import 'package:erpmax_client/core/theme/app_theme.dart';
// import 'package:erpmax_client/core/theme/text_style_source.dart';
// import 'package:erpmax_client/core/utils/responsive.dart';
// import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';

// class AppModuleHeader extends StatelessWidget {
//   final dynamic currentTab;
//   final List<Widget>? extraActions;

//   const AppModuleHeader({
//     super.key,
//     required this.currentTab,
//     this.extraActions,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = Responsive.isMobile(context);

//     return Container(
//       padding: EdgeInsets.fromLTRB(
//         32.0,
//         isMobile ? 16.0 : 24.0,
//         32.0,
//         isMobile ? 12.0 : 16.0,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: ModuleHeaderInfo(
//                   title: currentTab.name,
//                   description: isMobile ? null : currentTab.description,
//                 ),
//               ),
//               const SizedBox(width: 12.0),
//               buildActionsRow(context, isMobile),
//             ],
//           ),
//           if (isMobile)
//             Padding(
//               padding: const EdgeInsets.only(top: 16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: AppLocalizations.of(context)!.search,
//                   prefixIcon: const Icon(LucideIcons.search, size: 18),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   Widget buildActionsRow(BuildContext context, bool isMobile) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (extraActions != null) ...[
//           ...extraActions!,
//           if (currentTab.actionType != 'none')
//             SizedBox(width: isMobile ? 8.0 : 12.0),
//         ],
//         if (currentTab.actionType != 'none')
//           ModuleHeaderActions(currentTab: currentTab),
//       ],
//     );
//   }
// }

// class ModuleHeaderInfo extends StatelessWidget {
//   final String title;
//   final String? description;

//   const ModuleHeaderInfo({super.key, required this.title, this.description});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: AppTextStyles.h2.copyWith(
//             fontWeight: FontWeight.w800,
//             color: const Color(0xFF0F172A),
//             height: 1.2,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ModuleHeaderActions extends StatelessWidget {
//   final dynamic currentTab;

//   const ModuleHeaderActions({super.key, required this.currentTab});

//   @override
//   Widget build(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     final theme = context.theme.appColor;
//     final bool isMobile = Responsive.isMobile(context);

//     if (currentTab.actionType == 'report') {
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ModuleActionButton(
//             label: l10n.print,
//             icon: LucideIcons.printer,
//             onPressed: () {},
//           ),
//           SizedBox(width: isMobile ? 8.0 : 12.0),
//           ModuleActionButton(
//             label: l10n.export,
//             icon: LucideIcons.download,
//             isPrimary: true,
//             color: theme.success,
//             onPressed: () {},
//           ),
//         ],
//       );
//     }

//     if (currentTab.actionType == 'add' ||
//         currentTab.actionType == 'dashboard') {
//       return ModuleActionButton(
//         label: ModuleActionLabelResolver.getLabel(context, currentTab.id),
//         icon: ModuleActionLabelResolver.getIcon(currentTab.id),
//         isPrimary: true,
//         onPressed: () {},
//       );
//     }

//     return const SizedBox.shrink();
//   }
// }

// class ModuleActionButton extends StatelessWidget {
//   final String label;
//   final IconData icon;
//   final VoidCallback onPressed;
//   final bool isPrimary;
//   final Color? color;

//   const ModuleActionButton({
//     super.key,
//     required this.label,
//     required this.icon,
//     required this.onPressed,
//     this.isPrimary = false,
//     this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;
//     final bool isMobile = Responsive.isMobile(context);

//     final Color bgColor = isPrimary
//         ? (color ?? const Color(0xFF0F172A))
//         : theme.white;
//     final Color contentColor = isPrimary ? Colors.white : theme.textPrimary;

//     if (isMobile) {
//       return Container(
//         decoration: BoxDecoration(
//           color: bgColor,
//           shape: BoxShape.circle,
//           border: isPrimary ? null : Border.all(color: theme.gray200),
//         ),
//         child: IconButton(
//           icon: Icon(icon, size: 20, color: contentColor),
//           onPressed: onPressed,
//         ),
//       );
//     }

//     return SizedBox(
//       height: 40,
//       child: ElevatedButton.icon(
//         onPressed: onPressed,
//         icon: Icon(icon, size: 18, color: contentColor),
//         label: Text(
//           label,
//           style: TextStyle(color: contentColor, fontWeight: FontWeight.w600),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: bgColor,
//           elevation: 0,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           side: isPrimary ? BorderSide.none : BorderSide(color: theme.gray200),
//         ),
//       ),
//     );
//   }
// }

// abstract class ModuleActionLabelResolver {
//   static String getLabel(BuildContext context, String id) {
//     final l10n = AppLocalizations.of(context)!;
//     if (id.contains('module')) return l10n.newModule;
//     if (id.contains('package')) return l10n.createPackage;
//     if (id.contains('subscriber')) return l10n.addSubscriber;
//     return l10n.action;
//   }

//   static IconData getIcon(String id) {
//     if (id.contains('subscriber')) return LucideIcons.userPlus;
//     return LucideIcons.plus;
//   }
// }
