import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_board/customers_table.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_board/parties_board_switcher.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_board/suppliers_table.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_mock_data.dart';
import 'package:flutter/material.dart';

class PartiesBoard extends StatefulWidget {
  const PartiesBoard({super.key});

  @override
  State<PartiesBoard> createState() => _PartiesBoardState();
}

class _PartiesBoardState extends State<PartiesBoard> {
  PartiesType _currentType = PartiesType.customers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            PartiesBoardSwitcher(
              currentType: _currentType,
              onChanged: (newType) {
                setState(() => _currentType = newType);
              },
            ),
          ],
        ),
        gapH24,
        if (_currentType == PartiesType.customers)
          CustomersTableView(customers: MockPartiesDataService.getCustomers())
        else
          SuppliersTableView(suppliers: MockPartiesDataService.getSuppliers()),
      ],
    );
  }
}
