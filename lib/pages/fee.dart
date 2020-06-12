import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/fee_model.dart';
import 'package:snacking_calculator/models/item_model.dart';
import 'package:snacking_calculator/utils.dart';
import 'package:snacking_calculator/widgets.dart';

class FeeScreen extends StatelessWidget {
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();
  final TextEditingController _deliveryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Biaya dan Diskon')),
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Consumer2<ItemModel, FeeModel>(
                    builder: (context, items, fees, child) {
                  int totalPrice = calculateTotalPrice(items.items,
                      fees.discount, fees.tax, fees.tip, fees.delivery);

                  return Column(children: [
                    CupertinoTextField(
                        controller: _discountController,
                        placeholder: 'Diskon',
                        onSubmitted: (text) {
                          fees.discount = int.parse(_discountController.text);
                        }),
                    CupertinoTextField(
                        controller: _taxController,
                        placeholder: 'Pajak',
                        onSubmitted: (text) {
                          fees.discount = int.parse(_taxController.text);
                        }),
                    CupertinoTextField(
                        controller: _tipController,
                        placeholder: 'Tip',
                        onSubmitted: (text) {
                          fees.discount = int.parse(_tipController.text);
                        }),
                    CupertinoTextField(
                        controller: _deliveryController,
                        placeholder: 'Biaya pengantaran',
                        onSubmitted: (text) {
                          fees.discount = int.parse(_deliveryController.text);
                        }),
                    Text('Total yang dibayarkan: Rp $totalPrice'),
                    NavigationButtonSet('/allocation', true)
                  ]);
                }))));
  }
}
