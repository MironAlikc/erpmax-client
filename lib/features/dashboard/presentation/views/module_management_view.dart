// import 'package:erpmax_client/core/widgets/universal_table.dart';
// import 'package:flutter/material.dart';

// class ModuleManagementView extends StatelessWidget {
//   const ModuleManagementView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(24),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: const Color(0xFFE2E8F0)),
//         ),
//         child: Column(
//           children: [
//             _buildHeader(),
//             UniversalTable(
//               columnWidths: const {
//                 0: FlexColumnWidth(2),
//                 1: FlexColumnWidth(3),
//                 2: FixedColumnWidth(100),
//                 3: FixedColumnWidth(100),
//               },
//               headers: const ["Module", "Packages", "Version", "Status"],
//               rows: [
//                 _rowData("Accounting", ["Pro", "Enterprise"], "v2.1", true),
//                 _rowData("HR", ["Starter"], "v1.0", false),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           "Module Management",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         ElevatedButton(onPressed: () {}, child: const Text("Add")),
//       ],
//     );
//   }

//   List<Widget> _rowData(String name, List<String> tags, String v, bool active) {
//     return [
//       Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//       Wrap(
//         spacing: 4,
//         children: tags.map((t) => Chip(label: Text(t))).toList(),
//       ),
//       Text(v),
//       _StatusBadge(isActive: active),
//     ];
//   }
// }

// // Маленький внутренний виджет для этой вьюхи
// class _StatusBadge extends StatelessWidget {
//   final bool isActive;
//   const _StatusBadge({required this.isActive});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: isActive
//             ? Colors.green.withOpacity(0.1)
//             : Colors.red.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Text(
//         isActive ? "Active" : "Inactive",
//         style: TextStyle(
//           color: isActive ? Colors.green : Colors.red,
//           fontSize: 11,
//         ),
//       ),
//     );
//   }
// }
