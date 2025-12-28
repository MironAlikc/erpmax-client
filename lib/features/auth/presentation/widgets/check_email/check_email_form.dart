import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/navigation/app_router.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CheckEmailForm extends StatelessWidget {
  final String email;
  final VoidCallback? onResend;

  const CheckEmailForm({super.key, this.email = 'bob@reui.io', this.onResend});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: SvgPicture.asset('assets/svg/reminder.svg', height: 140)),
        const SizedBox(height: AppDesign.sectionGap),

        Text(
          localizations.checkYourEmail,
          style: AppTextStyles.h1.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDesign.elementGap),

        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            style: AppTextStyles.bodySmall.copyWith(
              color: context.theme.appColor.gray600,
              height: 1.5,
            ),
            children: [
              TextSpan(text: localizations.clickLinkSent),
              TextSpan(
                text: email,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.appColor.textPrimary,
                ),
              ),
              TextSpan(text: localizations.toVerifyAccount),
            ],
          ),
        ),
        const SizedBox(height: AppDesign.sectionGap),

        AppButton(
          onPressed: () => context.go(RouteNames.login),
          text: localizations.backToHome,
          isExpanded: true,
        ),
        const SizedBox(height: AppDesign.elementGap),

        _buildResendRow(context),
      ],
    );
  }

  Widget _buildResendRow(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          localizations.didNotReceiveEmail,
          style: AppTextStyles.bodySmall.copyWith(
            color: context.theme.appColor.gray500,
          ),
        ),
        GestureDetector(
          onTap: onResend,
          child: Text(
            localizations.resend,
            style: AppTextStyles.link.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
