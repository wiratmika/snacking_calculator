import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/allocation_model.dart';
import 'package:snacking_calculator/models/fee_model.dart';
import 'package:snacking_calculator/models/item_model.dart';
import 'package:snacking_calculator/utils.dart';
import 'package:snacking_calculator/widgets.dart';

class SummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultWrapper('Kesimpulan',
        Consumer3<AllocationModel, ItemModel, FeeModel>(
            builder: (context, allocations, items, fees, child) {
      Map<String, int> summary = allocations.calculate(
          items.items, fees.getDividedFee(allocations.getParticipantNumber()));

      return Column(
          children: summary.entries
              .map((e) => Text('${e.key}: ${formatRupiah(e.value)}'))
              .toList());
    }));
  }
}
