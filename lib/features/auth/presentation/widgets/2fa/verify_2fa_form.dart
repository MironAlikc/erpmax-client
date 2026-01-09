import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Verify2faForm extends StatefulWidget {
  const Verify2faForm({super.key});

  @override
  State<Verify2faForm> createState() => _Verify2faFormState();
}

class _Verify2faFormState extends State<Verify2faForm> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  bool _isLoading = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onVerify() async {
    final code = _controllers.map((e) => e.text).join();
    if (code.length < 6) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SvgPicture.asset(
            'assets/svg/smartphone.svg',
            height: 80,
            colorFilter: ColorFilter.mode(theme.primary, BlendMode.srcIn),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          localizations.verifyPhone,
          style: AppTextStyles.h1.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          localizations.enterCodeSent,
          style: AppTextStyles.bodySmall.copyWith(
            color: theme.gray500,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: Dimens.p32),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(6, (index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 5 ? 0 : 8),
              child: _OtpField(
                controller: _controllers[index],
                autoFocus: index == 0,
              ),
            );
          }),
        ),

        const SizedBox(height: Dimens.p32),
        _buildResendTimer(),
        const SizedBox(height: Dimens.p32),

        AppButton(
          onPressed: _isLoading ? null : _onVerify,
          text: localizations.continueBtn,
          isLoading: _isLoading,
          isExpanded: true,
        ),
      ],
    );
  }

  Widget _buildResendTimer() {
    final localizations = AppLocalizations.of(context);

    return Center(
      child: Column(
        children: [
          Text(
            localizations.didNotReceiveCode('37'),
            style: AppTextStyles.bodySmall.copyWith(
              color: context.theme.appColor.gray500,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          TextButton(
            onPressed: () {},
            child: Text(
              localizations.resend,
              style: AppTextStyles.link.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpField extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const _OtpField({required this.controller, this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return SizedBox(
      width: 48,
      height: 48,
      child: TextFormField(
        controller: controller,
        autofocus: autoFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: AppTextStyles.h2.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.zero,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.gray200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.primary, width: 1.5),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
