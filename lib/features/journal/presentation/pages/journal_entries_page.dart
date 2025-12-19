// // lib/features/journal/presentation/pages/journal_entries_page.dart

// import 'package:erpmax_client/core/design/app_design.dart';
// import 'package:erpmax_client/core/widgets/common/app_status_chip.dart';
// import 'package:erpmax_client/core/widgets/common/custom_button.dart';
// import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
// import 'package:flutter/material.dart';
// import '../../data/mocks/journal_mocks.dart';

// class JournalEntriesPage extends StatelessWidget {
//   const JournalEntriesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const _AccountingTabs(),
//         Expanded(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(AppDesign.pagePadding),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const _PageHeader(),
//                 const SizedBox(height: 24),
//                 const _SearchAndFilterBar(),
//                 const SizedBox(height: 16),
//                 _buildTable(context),
//                 const SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildTable(BuildContext context) {
//     final columns = [
//       ErpMaxColumn(title: 'Entry #', weight: 1.0),
//       ErpMaxColumn(title: 'Date', weight: 1.0),
//       ErpMaxColumn(title: 'Reference', weight: 1.2),
//       ErpMaxColumn(title: 'Description', weight: 2.5),
//       ErpMaxColumn(title: 'Amount', weight: 1.2, textAlign: TextAlign.right),
//       ErpMaxColumn(title: 'Status', weight: 1.0),
//       ErpMaxColumn(title: 'Actions', weight: 0.5, textAlign: TextAlign.center),
//     ];

//     return ErpMaxTable(
//       columns: columns,
//       minWidth: 1000,
//       rows: JournalMocks.entries.map((entry) {
//         return ErpMaxRow(
//           columns: columns,
//           cells: [
//             Text(
//               entry.id,
//               style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             Text('${entry.date.day}/${entry.date.month}/${entry.date.year}'),
//             Text(entry.reference),
//             Text(
//               entry.description,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(
//               '\$${entry.amount.toStringAsFixed(2)}',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             AppStatusChip(label: entry.status),
//             IconButton(
//               icon: const Icon(Icons.more_horiz, size: 18),
//               onPressed: () {},
//             ),
//           ],
//         );
//       }).toList(),
//     );
//   }
// }

// // --- Вспомогательные компоненты ---

// class _PageHeader extends StatelessWidget {
//   const _PageHeader();

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Journal Entries',
//                     style: textTheme.headlineMedium?.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Review and manage financial journal records',
//                     style: textTheme.bodySmall,
//                   ),
//                 ],
//               ),
//             ),
//             AppButton(
//               text: 'Export',
//               onPressed: () {},
//               type: AppButtonType.secondary,
//               icon: Icons.upload_outlined,
//             ),
//             const SizedBox(width: 12),
//             AppButton(
//               text: 'New Entry',
//               onPressed: () {},
//               type: AppButtonType.primaryDark,
//               icon: Icons.add,
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         const _ActionButtonGroup(),
//       ],
//     );
//   }
// }

// class _ActionButtonGroup extends StatelessWidget {
//   const _ActionButtonGroup();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       decoration: BoxDecoration(
//         color: theme.colorScheme.surface,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: theme.dividerColor),
//       ),
//       child: IntrinsicHeight(
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             _headerAction(
//               context,
//               'Cash Journal',
//               Icons.account_balance_wallet,
//               AppButtonType.success,
//             ),
//             VerticalDivider(
//               width: 1,
//               indent: 8,
//               endIndent: 8,
//               color: theme.dividerColor,
//             ),
//             _headerAction(
//               context,
//               'Receipts',
//               Icons.file_download_outlined,
//               AppButtonType.success,
//             ),
//             VerticalDivider(
//               width: 1,
//               indent: 8,
//               endIndent: 8,
//               color: theme.dividerColor,
//             ),
//             _headerAction(
//               context,
//               'Payments',
//               Icons.file_upload_outlined,
//               AppButtonType.danger,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _headerAction(
//     BuildContext context,
//     String text,
//     IconData icon,
//     AppButtonType type,
//   ) {
//     return AppButton(
//       text: text,
//       icon: Icons.keyboard_arrow_down,
//       onPressed: () {},
//       type: type,
//       isIconRight: true,
//     );
//   }
// }

// class _SearchAndFilterBar extends StatelessWidget {
//   const _SearchAndFilterBar();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: SizedBox(
//             height: 44,
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search by name, code, or serial...',
//                 prefixIcon: const Icon(Icons.search, size: 20),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 filled: true,
//                 fillColor: Theme.of(context).colorScheme.surface,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 12),
//         AppButton(
//           text: 'Filter',
//           icon: Icons.filter_list,
//           onPressed: () {},
//           type: AppButtonType.secondary,
//         ),
//         const SizedBox(width: 12),
//         AppButton(
//           text: 'Date Range',
//           icon: Icons.calendar_today,
//           onPressed: () {},
//           type: AppButtonType.secondary,
//         ),
//       ],
//     );
//   }
// }

// class _AccountingTabs extends StatelessWidget {
//   const _AccountingTabs();

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: theme.colorScheme.surface,
//         border: Border(bottom: BorderSide(color: theme.dividerColor)),
//       ),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//         child: Row(
//           children: [
//             _TabItem(title: 'Dashboard', isActive: false),
//             _TabItem(title: 'Journal Entries', isActive: true),
//             _TabItem(title: 'Funds & Banks', isActive: false),
//             _TabItem(title: 'Customers', isActive: false),
//             _TabItem(title: 'Suppliers', isActive: false),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TabItem extends StatelessWidget {
//   final String title;
//   final bool isActive;
//   const _TabItem({required this.title, required this.isActive});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final color = isActive
//         ? theme.primaryColor
//         : theme.textTheme.bodyMedium?.color;

//     return Container(
//       margin: const EdgeInsets.only(right: 20),
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         border: Border(
//           bottom: BorderSide(
//             color: isActive ? theme.primaryColor : Colors.transparent,
//             width: 2,
//           ),
//         ),
//       ),
//       child: Text(
//         title,
//         style: TextStyle(
//           color: color,
//           fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
//         ),
//       ),
//     );
//   }
// }
