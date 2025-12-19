// import 'package:erpmax_client/features/saas_admin/presentation/widgets/saas/module_management_content.dart';
// import 'package:flutter/material.dart';

// class EditModuleDialog extends StatefulWidget {
//   final ModuleModel module;
//   const EditModuleDialog({super.key, required this.module});

//   @override
//   State<EditModuleDialog> createState() => _EditModuleDialogState();
// }

// class _EditModuleDialogState extends State<EditModuleDialog> {
//   final _formKey = GlobalKey<FormState>();
//   late bool _isActive;

//   @override
//   void initState() {
//     super.initState();
//     _isActive = widget.module.isActive;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Container(
//         width: 550,
//         padding: const EdgeInsets.all(32),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildHeader(context),
//               const SizedBox(height: 24),
//               _LabeledInput(
//                 label: "Name (En)",
//                 child: TextFormField(
//                   initialValue: widget.module.name,
//                   decoration: _inputDecoration(),
//                 ),
//               ),
//               _LabeledInput(
//                 label: "Status",
//                 child: DropdownButtonFormField<bool>(
//                   value: _isActive,
//                   decoration: _inputDecoration(),
//                   items: const [
//                     DropdownMenuItem(value: true, child: Text("Active")),
//                     DropdownMenuItem(value: false, child: Text("Inactive")),
//                   ],
//                   onChanged: (v) => setState(() => _isActive = v!),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               _buildActions(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       const Text(
//         "Edit Module",
//         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       IconButton(
//         onPressed: () => Navigator.pop(context),
//         icon: const Icon(Icons.close),
//       ),
//     ],
//   );

//   Widget _buildActions(BuildContext context) => Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     children: [
//       TextButton(
//         onPressed: () => Navigator.pop(context),
//         child: const Text("Cancel"),
//       ),
//       const SizedBox(width: 12),
//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primaryDark,
//           foregroundColor: Colors.white,
//         ),
//         onPressed: () => Navigator.pop(context),
//         child: const Text("Save Changes"),
//       ),
//     ],
//   );

//   InputDecoration _inputDecoration() => InputDecoration(
//     filled: true,
//     fillColor: Colors.white,
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: const BorderSide(color: AppColors.border),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(8),
//       borderSide: const BorderSide(color: AppColors.primaryDark),
//     ),
//   );
// }

// class _LabeledInput extends StatelessWidget {
//   final String label;
//   final Widget child;
//   const _LabeledInput({required this.label, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 120,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 12),
//               child: Text(
//                 label,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           Expanded(child: child),
//         ],
//       ),
//     );
//   }
// }
