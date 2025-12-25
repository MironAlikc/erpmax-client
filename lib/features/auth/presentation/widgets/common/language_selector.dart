import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
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
    final theme = context.theme.appColor;

    return PopupMenuButton<LanguageOption>(
      initialValue: _current,
      tooltip: AppLocalizations.of(context).selectLanguage,
      onSelected: (lang) => setState(() => _current = lang),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => availableLanguages.map((lang) {
        final isSelected = lang.code == _current.code;
        return PopupMenuItem(
          value: lang,
          child: Text(
            '${lang.flag} ${lang.name}',
            style: AppTextStyles.base.copyWith(
              color: isSelected ? theme.primary : theme.textPrimary,
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
                color: theme.textSecondary,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 18,
              color: theme.textDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
