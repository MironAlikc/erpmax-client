import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
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
          Icon(icon, size: 16, color: theme.textSecondary),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  color: theme.textSecondary,
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$amount ',
                      style: AppTextStyles.bodyLargeBold.copyWith(
                        color: theme.textPrimary,
                      ),
                    ),
                    TextSpan(
                      text: '$percentage%',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: theme.sidebarActiveIcon,
                        fontSize: 10,
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
