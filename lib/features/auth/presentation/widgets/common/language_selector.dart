// lib/features/auth/presentation/widgets/common/language_selector.dart

import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:flutter/material.dart';

class LanguageOption {
  final String code, flag, name;
  const LanguageOption({
    required this.code,
    required this.flag,
    required this.name,
  });
}

const List<LanguageOption> availableLanguages = [
  LanguageOption(code: 'en', flag: '🇬🇧', name: 'English'),
  LanguageOption(code: 'ru', flag: '🇷🇺', name: 'Русский'),
  LanguageOption(code: 'ua', flag: '🇺🇦', name: 'Українська'),
];

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  LanguageOption _current = availableLanguages[0];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<LanguageOption>(
      initialValue: _current,
      tooltip: 'Select Language',
      onSelected: (lang) => setState(() => _current = lang),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => availableLanguages.map((lang) {
        final isSelected = lang.code == _current.code;
        return PopupMenuItem(
          value: lang,
          child: Text(
            '${lang.flag} ${lang.name}',
            style: AppTextStyles.base.copyWith(
              color: isSelected ? AppColors.primary : AppColors.textPrimary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${_current.flag} ${_current.name}',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: AppColors.textDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
