// import 'package:flutter/material.dart';
// import '../views/module_management_view.dart';
// import '../widgets/navigation/dashboard_tab_bar.dart'; // Вынеси чип-табы сюда

// class SaasDashboardPage extends StatefulWidget {
//   const SaasDashboardPage({super.key});

//   @override
//   State<SaasDashboardPage> createState() => _SaasDashboardPageState();
// }

// class _SaasDashboardPageState extends State<SaasDashboardPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 7, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // 1. Сюда вставляешь TopNavBar из core или widgets
//           const SizedBox(height: 70, child: Center(child: Text("Top Nav Bar"))),

//           // 2. Сюда TabBar (виджет из dashboard/widgets/navigation)
//           DashboardTabBar(controller: _tabController),

//           // 3. Контент
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: const [
//                 Center(child: Text("Dashboard")),
//                 Center(child: Text("Reports")),
//                 Center(child: Text("Subscribers")),
//                 Center(child: Text("Packages")),
//                 ModuleManagementView(), // Наша вьюха с таблицей
//                 Center(child: Text("Backup")),
//                 Center(child: Text("Logs")),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
