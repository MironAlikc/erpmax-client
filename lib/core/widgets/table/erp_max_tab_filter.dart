import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class ErpMaxTabItem {
  final String name;
  final IconData icon;
  const ErpMaxTabItem({required this.name, required this.icon});
}

class ErpMaxTabFilter extends StatelessWidget {
  final List<ErpMaxTabItem> items;
  final String selectedItem;
  final Function(String) onSelected;

  const ErpMaxTabFilter({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      width: double.infinity, // Контейнер на всю ширину
      height: 46, // Высота как на скриншоте
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEAECF0)), // Цвет рамки с фото
      ),
      child: SingleChildScrollView(
        // Добавляем на случай узких экранов
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Табы прижаты к левому краю
          children: items.map((item) {
            final bool isSelected = selectedItem == item.name;

            return GestureDetector(
              onTap: () => onSelected(item.name),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.only(
                  right: 4,
                ), // Небольшой отступ между табами
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ), // Внутренний отступ таба
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF101828) // Темный Navy Blue с фото
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      size: 20, // Размер иконки как на фото
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF667085),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.name,
                      style: AppTextStyles.bodySmallBold.copyWith(
                        color: isSelected
                            ? Colors.white
                            : const Color(
                                0xFF344054,
                              ), // Цвет текста неактивного таба
                        fontSize: 14, // Размер шрифта для четкости
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
