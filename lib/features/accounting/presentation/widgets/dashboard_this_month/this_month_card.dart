import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ThisMonthCard extends StatelessWidget {
  final String title;
  final String amount;
  final String percentage;
  final bool isPositive;
  final IconData icon;
  final Color color;

  const ThisMonthCard({
    super.key,
    required this.title,
    required this.amount,
    required this.percentage,
    required this.isPositive,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: theme.border, width: 2.0)),
      ),
      padding: EdgeInsets.only(right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: theme.sidebarActiveIcon),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$amount ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.textPrimary,
                      ),
                    ),
                    TextSpan(
                      text: '$percentage%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: theme.sidebarActiveIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
