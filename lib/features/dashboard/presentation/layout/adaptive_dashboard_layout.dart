// class AdaptiveDashboardLayout extends StatelessWidget {
//   final Widget child;

//   const AdaptiveDashboardLayout({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final screenWidth = constraints.maxWidth;
//         final bool isMobile = screenWidth < 600;
//         final double panelWidth = isMobile
//             ? screenWidth
//             : (screenWidth * 0.5).clamp(800.0, 1100.0);

//         return BlocBuilder<SidePanelCubit, SidePanelState>(
//           builder: (context, state) {
//             print(
//               'Стейт панели изменился: isOpen = ${state.isOpen}',
//             ); // Добавь этот принт для теста
//             return Stack(
//               children: [
//                 // 1. Основной контент
//                 Responsive(
//                   mobile: DashboardMobileLayout(child: child),
//                   desktop: DashboardDesktopLayout(child: child),
//                 ),

//                 // 2. Диммер
//                 if (state.isOpen)
//                   Positioned.fill(
//                     child: GestureDetector(
//                       onTap: () => context
//                           .read<SidePanelCubit>()
//                           .hide(), // Замени close на hide
//                       child: Container(
//                         color: Colors.black.withValues(alpha: 0.3),
//                       ),
//                     ),
//                   ),

//                 // 3. Панель
//                 AnimatedPositioned(
//                   duration: const Duration(milliseconds: 300),
//                   curve: Curves.easeOutCubic,
//                   right: state.isOpen ? 0 : -panelWidth,
//                   top: 0,
//                   bottom: 0,
//                   width: panelWidth,
//                   child: Material(
//                     elevation: 24,
//                     color: Colors.white,
//                     child: state.content ?? const SizedBox.shrink(),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class AdaptiveDashboardLayout extends StatelessWidget {
//   final Widget child;

//   const AdaptiveDashboardLayout({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Responsive(
//       mobile: DashboardMobileLayout(child: child),
//       desktop: DashboardDesktopLayout(child: child),
//     );
//   }
// }
