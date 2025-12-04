# PlutoGrid Examples Summary

Ця директорія містить 37 прикладів використання PlutoGrid, витягнутих з офіційного demo додатку.

## Категорії прикладів

### 📊 Типи колонок (Column Types)
- [Text Type Column](./text_type_column_screen.md) - Текстові колонки
- [Number Type Column](./number_type_column_screen.md) - Числові колонки
- [Date Type Column](./date_type_column_screen.md) - Колонки з датами
- [Time Type Column](./time_type_column_screen.md) - Колонки з часом
- [Currency Type Column](./currency_type_column_screen.md) - Валютні колонки
- [Selection Type Column](./selection_type_column_screen.md) - Колонки з вибором

### 🎯 Вибір (Selection)
- [Row Selection](./row_selection_screen.md) - Вибір рядків
- [Cell Selection](./cell_selection_screen.md) - Вибір комірок
- [Row With Checkbox](./row_with_checkbox_screen.md) - Вибір через checkbox

### 📄 Пагінація (Pagination)
- [Row Pagination](./row_pagination_screen.md) - Стандартна пагінація
- [Row Lazy Pagination](./row_lazy_pagination_screen.md) - Ліниве завантаження з пагінацією
- [Row Infinity Scroll](./row_infinity_scroll_screen.md) - Нескінченне прокручування

### 🔧 Операції з колонками (Column Operations)
- [Column Sorting](./column_sorting_screen.md) - Сортування колонок
- [Column Filtering](./column_filtering_screen.md) - Фільтрація колонок
- [Column Freezing](./column_freezing_screen.md) - Закріплення колонок
- [Column Moving](./column_moving_screen.md) - Переміщення колонок
- [Column Resizing](./column_resizing_screen.md) - Зміна розміру колонок
- [Column Hiding](./column_hiding_screen.md) - Приховування колонок
- [Column Menu](./column_menu_screen.md) - Меню колонок
- [Column Group](./column_group_screen.md) - Групування колонок
- [Column Footer](./column_footer_screen.md) - Футер колонок

### 📝 Операції з рядками (Row Operations)
- [Row Moving](./row_moving_screen.md) - Переміщення рядків
- [Row Group](./row_group_screen.md) - Групування рядків
- [Row Color](./row_color_screen.md) - Кольорові рядки
- [Add And Remove Column Row](./add_and_remove_column_row_screen.md) - Додавання/видалення рядків та колонок
- [Add Rows Asynchronously](./add_rows_asynchronously.md) - Асинхронне додавання рядків

### ✏️ Редагування (Editing)
- [Editing State](./editing_state_screen.md) - Стан редагування
- [Copy And Paste](./copy_and_paste_screen.md) - Копіювання та вставка
- [Value Formatter](./value_formatter_screen.md) - Форматування значень

### 🎨 Кастомізація (Customization)
- [Cell Renderer](./cell_renderer_screen.md) - Кастомний рендеринг комірок
- [Dark Mode](./dark_mode_screen.md) - Темна тема
- [RTL](./rtl_screen.md) - Підтримка RTL (справа наліво)

### 🚀 Режими роботи (Modes)
- [Dual Mode](./dual_mode_screen.md) - Подвійний режим (два грида)
- [Grid As Popup](./grid_as_popup_screen.md) - Грид як popup
- [Listing Mode](./listing_mode_screen.md) - Режим списку
- [Moving](./moving_screen.md) - Режим переміщення

### 📤 Експорт (Export)
- [Export](./export_screen.md) - Експорт даних

## Швидкий старт

### Базовий приклад PlutoGrid

```dart
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class MyGridScreen extends StatefulWidget {
  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  final List<PlutoColumn> columns = [
    PlutoColumn(
      title: 'ID',
      field: 'id',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Name',
      field: 'name',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Age',
      field: 'age',
      type: PlutoColumnType.number(),
    ),
  ];

  final List<PlutoRow> rows = [
    PlutoRow(
      cells: {
        'id': PlutoCell(value: '1'),
        'name': PlutoCell(value: 'John'),
        'age': PlutoCell(value: 25),
      },
    ),
    PlutoRow(
      cells: {
        'id': PlutoCell(value: '2'),
        'name': PlutoCell(value: 'Jane'),
        'age': PlutoCell(value: 30),
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PlutoGrid Example')),
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print('Cell changed: ${event.value}');
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          print('Grid loaded');
        },
      ),
    );
  }
}
```

## Корисні посилання

- **GitHub**: https://github.com/bosskmk/pluto_grid
- **pub.dev**: https://pub.dev/packages/pluto_grid
- **Demo**: https://bosskmk.github.io/pluto_grid/

## Основні можливості PlutoGrid

1. **Типи колонок**: text, number, date, time, currency, select
2. **Редагування**: inline editing, copy/paste, keyboard shortcuts
3. **Вибір**: single/multiple row selection, cell selection
4. **Пагінація**: standard, lazy loading, infinite scroll
5. **Сортування**: single/multiple column sorting
6. **Фільтрація**: column filters, custom filters
7. **Групування**: row grouping, column grouping
8. **Закріплення**: freeze columns (left/right)
9. **Експорт**: CSV export
10. **Кастомізація**: custom cell renderers, themes, RTL support

## Структура файлів

Кожен markdown файл містить:
- **Description**: Опис функціональності
- **Key Features**: Ключові можливості
- **Complete Example**: Повний код прикладу
- **PlutoGrid Configuration**: Конфігурація віджета
- **Usage Example**: Приклад використання
- **Important Parameters**: Важливі параметри
- **Notes**: Додаткові примітки

## Як використовувати

1. Знайдіть потрібний приклад у категоріях вище
2. Відкрийте відповідний markdown файл
3. Скопіюйте код та адаптуйте під свої потреби
4. Перегляньте документацію PlutoGrid для додаткових опцій

## Оновлення прикладів

Для оновлення прикладів з останньої версії PlutoGrid:

```bash
python3 extract_pluto_examples.py
```

Скрипт автоматично:
- Клонує останню версію репозиторію
- Витягує всі приклади з demo директорії
- Створює markdown файли з повним кодом
- Генерує індекс та summary файли
