// // lib/features/subscription/presentation/widgets/subscription_table.dart
// import 'package:erpmax_client/core/design/app_colors.dart';
// import 'package:erpmax_client/features/dashboard/presentation/views/subscription_management_view.dart';
// import 'package:flutter/material.dart';
// import 'package:erpmax_client/core/design/app_constants.dart';
// import 'package:erpmax_client/features/dashboard/presentation/data/subscription_model.dart';

// class SubscriptionTable extends StatelessWidget {
//   final List<SubscriptionModel> subscriptions;
//   const SubscriptionTable({super.key, required this.subscriptions});

//   @override
//   Widget build(BuildContext context) {
//     const double minScrollColumnWidth = AppBreakpoints.minScrollColumnWidth;
//     const double tableActionWidth = AppBreakpoints.tableActionWidth;
//     // Минимальная ширина, необходимая для размещения всех колонок
//     final double minTableWidth = (8 * minScrollColumnWidth) + tableActionWidth;

//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.onPrimary,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.08),
//             blurRadius: 4,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.antiAlias,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final bool useScroll = constraints.maxWidth < minTableWidth;

//           return SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             physics: useScroll
//                 ? const AlwaysScrollableScrollPhysics()
//                 : const NeverScrollableScrollPhysics(),
//             child: SizedBox(
//               width: useScroll ? minTableWidth : constraints.maxWidth,
//               child: Column(
//                 children: [
//                   // Используем вынесенный компонент заголовка
//                   TableHeader(
//                     isScrollable: useScroll,
//                     minScrollColumnWidth: minScrollColumnWidth,
//                     tableActionWidth: tableActionWidth,
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: subscriptions.length,
//                       // Используем вынесенный компонент строки
//                       itemBuilder: (context, index) => TableRowWidget(
//                         data: subscriptions[index],
//                         isScrollable: useScroll,
//                         minScrollColumnWidth: minScrollColumnWidth,
//                         tableActionWidth: tableActionWidth,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class TableRowWidget extends StatelessWidget {
//   final SubscriptionModel data;
//   final bool isScrollable;
//   final double minScrollColumnWidth;
//   final double tableActionWidth;

//   const TableRowWidget({
//     super.key,
//     required this.data,
//     required this.isScrollable,
//     required this.minScrollColumnWidth,
//     required this.tableActionWidth,
//   });

//   // Вспомогательный метод для обычной ячейки (текст)
//   Widget _buildCell(
//     BuildContext context,
//     String text,
//     int flex, [
//     Alignment align = Alignment.centerLeft,
//   ]) {
//     final style = Theme.of(context).textTheme.bodyMedium!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 13,
//       color: AppColors.textPrimary,
//     );
//     final child = Align(
//       alignment: align,
//       child: Text(text, style: style, overflow: TextOverflow.ellipsis),
//     );

//     return isScrollable
//         ? SizedBox(width: minScrollColumnWidth, child: child)
//         : Expanded(flex: flex, child: child);
//   }

//   // Вспомогательный метод для ячейки со значком статуса
//   Widget _buildStatusCell(String label, int flex) {
//     final child = Align(
//       alignment: Alignment.centerLeft,
//       child: StatusBadge(label: label),
//     );
//     return isScrollable
//         ? SizedBox(width: minScrollColumnWidth, child: child)
//         : Expanded(flex: flex, child: child);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     const double tableRowHeight = AppBreakpoints.tableRowHeight;

//     return Container(
//       height: tableRowHeight,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: theme.dividerColor)),
//       ),
//       child: Row(
//         children: [
//           _buildCell(context, data.subNumber, 3),
//           _buildCell(context, data.client, 4),
//           _buildCell(context, data.package, 3),
//           _buildCell(context, data.startDate, 3),
//           _buildCell(context, data.endDate, 3),
//           // _buildStatusCell(data.tags, 2),
//           // _buildCell(context, data.amount, 2, Alignment.centerRight),
//           _buildStatusCell(data.paymentStatus, 3),

//           SizedBox(
//             width: tableActionWidth,
//             child: Center(
//               child: IconButton(
//                 icon: Icon(
//                   Icons.more_vert,
//                   size: 20,
//                   color: theme.iconTheme.color,
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TableHeader extends StatelessWidget {
//   final bool isScrollable;
//   final double minScrollColumnWidth;
//   final double tableActionWidth;

//   const TableHeader({
//     super.key,
//     required this.isScrollable,
//     required this.minScrollColumnWidth,
//     required this.tableActionWidth,
//   });

//   Widget _buildHeaderCell(
//     ThemeData theme,
//     String title,
//     int flex, {
//     bool alignRight = false,
//   }) {
//     // Определяем, является ли колонка сортируемой
//     final isSortable = title == "Client" || title == "Amount";

//     final cellWidget = Row(
//       mainAxisAlignment: alignRight
//           ? MainAxisAlignment.end
//           : MainAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: theme.textTheme.labelLarge!.copyWith(
//             fontWeight: FontWeight.w600,
//             color: AppColors.textDisabled,
//           ),
//         ),
//         const SizedBox(width: 4),
//         if (isSortable)
//           Icon(Icons.unfold_more, size: 14, color: AppColors.textDisabled),
//         // Иконка фильтра всегда отображается
//         Icon(Icons.filter_list, size: 14, color: AppColors.textDisabled),
//       ],
//     );

//     // Управление шириной в зависимости от режима скролла
//     return isScrollable
//         ? SizedBox(width: minScrollColumnWidth, child: cellWidget)
//         : Expanded(flex: flex, child: cellWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     const double tableHeaderHeight = AppBreakpoints.tableHeaderHeight;

//     return Container(
//       height: tableHeaderHeight,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         border: Border(bottom: BorderSide(color: theme.dividerColor)),
//       ),
//       child: Row(
//         children: [
//           // Примечание: flex-значения установлены для демонстрации
//           _buildHeaderCell(theme, "SUB Number", 3),
//           _buildHeaderCell(theme, "Client", 4),
//           _buildHeaderCell(theme, "Package", 3),
//           _buildHeaderCell(theme, "Start Date", 3),
//           _buildHeaderCell(theme, "End Date", 3),
//           _buildHeaderCell(theme, "Tags", 2),
//           _buildHeaderCell(theme, "Amount", 2, alignRight: true),
//           _buildHeaderCell(theme, "Payment Status", 3),
//           // Пространство для кнопки действий
//           SizedBox(width: tableActionWidth),
//         ],
//       ),
//     );
//   }
// }
