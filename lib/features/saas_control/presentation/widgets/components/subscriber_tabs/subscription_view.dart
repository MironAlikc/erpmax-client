// import 'package:erpmax_client/core/theme/app_color_extension.dart';
// import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
// import 'package:erpmax_client/features/saas_control/data/models/report_models.dart';
// import 'package:flutter/material.dart';
// import 'package:erpmax_client/core/theme/app_theme.dart';
// import 'package:erpmax_client/core/theme/text_style_source.dart';
// import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';

// class SubscriptionView extends StatelessWidget {
//   final ReportSubscriber subscriber;
//   const SubscriptionView({super.key, required this.subscriber});

//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme.appColor;

//     return Column(
//       children: [
//         IntrinsicHeight(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Expanded(flex: 2, child: _buildMainInfoCard(theme)),
//               const SizedBox(width: 16),
//               Expanded(flex: 1, child: _buildContactCard(theme)),
//             ],
//           ),
//         ),
//         const SizedBox(height: 24),
//         _buildStatusCard(theme),
//       ],
//     );
//   }

//   Widget _buildMainInfoCard(AppColorExtension theme) {
//     return AppCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(subscriber.company, style: AppTextStyles.h3),
//               AppStatusMapper(status: subscriber.status),
//             ],
//           ),
//           const SizedBox(height: 20),
//           _buildGridDetail(Icons.layers_outlined, "Plan", subscriber.plan),
//           _buildGridDetail(
//             Icons.calendar_today_outlined,
//             "Start Date",
//             subscriber.startDate,
//           ),
//           _buildGridDetail(
//             Icons.event_busy_outlined,
//             "End Date",
//             subscriber.endDate,
//           ),
//           _buildGridDetail(Icons.payments_outlined, "Amount", subscriber.price),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactCard(AppColorExtension theme) {
//     return AppCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "CONTACT PERSON",
//             style: AppTextStyles.labelStyle.copyWith(
//               color: theme.textSecondary,
//             ),
//           ),
//           const SizedBox(height: 16),
//           _buildContactRow(Icons.person_outline, "Mohammed Ali"),
//           _buildContactRow(Icons.email_outlined, "contact@example.com"),
//           _buildContactRow(Icons.phone_outlined, "+966 50 000 0000"),
//         ],
//       ),
//     );
//   }

//   Widget _buildStatusCard(AppColorExtension theme) {
//     return AppCard(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               const Icon(Icons.token_outlined, color: Colors.teal),
//               const SizedBox(width: 8),
//               Text("Subscription Status", style: AppTextStyles.bodyMediumBold),
//             ],
//           ),
//           const SizedBox(height: 24),
//           _buildProgressIndicator("Users", "5/100", 0.05),
//           const SizedBox(height: 16),
//           _buildProgressIndicator("Storage", "10/100 GB", 0.1),
//         ],
//       ),
//     );
//   }

//   // --- Хелперы для верстки ---

//   Widget _buildGridDetail(IconData icon, String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         children: [
//           Icon(icon, size: 16, color: const Color(0xFF667085)),
//           const SizedBox(width: 8),
//           Text("$label: ", style: const TextStyle(color: Color(0xFF667085))),
//           Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactRow(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: const Color(0xFF667085)),
//           const SizedBox(width: 12),
//           Expanded(child: Text(text, overflow: TextOverflow.ellipsis)),
//         ],
//       ),
//     );
//   }

//   Widget _buildProgressIndicator(String label, String value, double percent) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(label, style: AppTextStyles.bodySmall),
//             Text(value, style: AppTextStyles.bodySmallBold),
//           ],
//         ),
//         const SizedBox(height: 8),
//         LinearProgressIndicator(
//           value: percent,
//           backgroundColor: const Color(0xFFF2F4F7),
//           valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF101828)),
//           borderRadius: BorderRadius.circular(4),
//           minHeight: 6,
//         ),
//       ],
//     );
//   }
// }
