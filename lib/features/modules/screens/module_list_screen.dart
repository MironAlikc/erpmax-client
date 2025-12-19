// import 'package:erpmax_client/core/widgets/dialogs/status_badge.dart';
// import 'package:erpmax_client/features/saas_admin/presentation/widgets/saas/module_management_content.dart';
// import 'package:flutter/material.dart';
// // Импорты твоей дизайн-системы
// import 'package:erpmax_client/core/design/app_colors.dart' hide AppColors;
// import 'package:erpmax_client/core/design/app_design.dart';
// import 'package:erpmax_client/core/design/app_text_styles.dart';
// // Внешние виджеты и модели
// import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
// import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';

// class ModuleManagementScreen extends StatelessWidget {
//   const ModuleManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Используем цвет фона из темы (gray50)
//       backgroundColor: AppColors.gray50,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(AppDesign.pagePadding),
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppColors.white,
//             borderRadius: BorderRadius.circular(AppDesign.cardRadius),
//             border: Border.all(color: AppColors.gray200),
//           ),
//           child: ErpMaxDataTable<ModuleModel>(
//             onRowTap: (item) => _openSidePanel(context, item),
//             columns: _buildColumns(),
//             items: _mockData,
//             rowBuilder: (item) => [
//               Text(
//                 item.name,
//                 style: AppTextStyles.base.copyWith(
//                   fontWeight: FontWeight.w700,
//                   color: AppColors.textPrimary,
//                 ),
//               ),
//               _buildPackages(item.packages),
//               Text(item.version, style: AppTextStyles.bodySmall),
//               StatusBadge(isActive: item.isActive),
//               const Icon(
//                 Icons.more_horiz,
//                 color: AppColors.textSecondary,
//                 size: AppDesign.iconSize,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _openSidePanel(BuildContext context, ModuleModel module) {
//     showGeneralDialog(
//       context: context,
//       barrierDismissible: true,
//       barrierLabel: '',
//       barrierColor: AppColors.black.withOpacity(0.3),
//       transitionDuration: AppDesign.sidebarDuration,
//       pageBuilder: (_, __, ___) => Align(
//         alignment: Alignment.centerRight,
//         child: ModuleDetailsSidePanel(module: module),
//       ),
//       transitionBuilder: (ctx, anim, _, child) => SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(1, 0),
//           end: Offset.zero,
//         ).animate(CurvedAnimation(parent: anim, curve: AppDesign.defaultCurve)),
//         child: child,
//       ),
//     );
//   }

//   List<ErpMaxColumn> _buildColumns() => [
//     ErpMaxColumn(
//       title: "Module Name",
//       weight: 0.3,
//       isSortable: true,
//       sortKey: "name",
//     ),
//     ErpMaxColumn(title: "Assigned Packages", weight: 0.4),
//     ErpMaxColumn(title: "Version", weight: 0.15),
//     ErpMaxColumn(title: "Status", weight: 0.1),
//     ErpMaxColumn(title: "Actions", weight: 0.05, textAlign: TextAlign.right),
//   ];

//   Widget _buildPackages(List<String> packages) => Wrap(
//     spacing: 8,
//     runSpacing: 4,
//     children: packages
//         .map(
//           (p) => Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(AppDesign.chipRadius),
//               border: Border.all(color: AppColors.gray200),
//             ),
//             child: Text(
//               p,
//               style: AppTextStyles.bodySmall.copyWith(
//                 fontSize: 11,
//                 color: AppColors.textPrimary,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         )
//         .toList(),
//   );
// }

// // Перемести эти данные в провайдер или репозиторий в реальном проекте
// final _mockData = [
//   const ModuleModel(
//     name: "Accounting",
//     packages: ["Starter", "Professional"],
//     version: "v 2.1.0",
//     isActive: true,
//   ),
//   const ModuleModel(
//     name: "Inventory",
//     packages: ["Professional"],
//     version: "v 1.5.2",
//     isActive: true,
//   ),
// ];
