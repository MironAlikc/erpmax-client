import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_board/funds_grid_view.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_board/funds_table_view.dart';
import 'package:flutter/material.dart';

class FundsBanksBoard extends StatefulWidget {
  final List<FundBankData> data;
  final String? activeFilter;

  const FundsBanksBoard({super.key, required this.data, this.activeFilter});

  @override
  State<FundsBanksBoard> createState() => _FundsBanksBoardState();
}

class _FundsBanksBoardState extends State<FundsBanksBoard> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(widget.data),
        const SizedBox(height: 16),
        isGridView
            ? FundGridView(data: widget.data, activeFilter: widget.activeFilter)
            : FundsTableView(
                accounts: widget.data,
                activeFilter: widget.activeFilter,
              ),
      ],
    );
  }

  Widget _buildHeader(List<FundBankData> data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'Funds & Banks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('${data.length}', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Icon(
                    isGridView ? Icons.grid_view : Icons.table_rows,
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                  Text(isGridView ? 'Grid' : 'Table'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
