import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/item_model.dart';
import 'package:snacking_calculator/utils.dart';
import 'package:snacking_calculator/widgets.dart';

class ItemScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Daftar Jajanan')),
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Consumer<ItemModel>(builder: (context, items, child) {
                  return Column(children: [
                    ItemsList(
                        items.items, items.delete, items.updateTotalPrice),
                    CupertinoTextField(
                        controller: _controller,
                        placeholder: 'Tambah jajanan...',
                        onSubmitted: (text) {
                          validateInput(context, _controller.text, items.add);
                          _controller.clear();
                        }),
                    CupertinoButton(
                        // TODO consider whether this is optional
                        child: Text('Tambah'),
                        onPressed: () {
                          validateInput(context, _controller.text, items.add);
                          _controller.clear();
                        }),
                    CupertinoButton(
                      child: Text('Kembali'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ]);
                }))));
  }
}

class ItemsList extends StatelessWidget {
  final List<Item> items;
  final Function(int) onDelete;
  final Function(int, int) onUpdatePrice;

  ItemsList(this.items, this.onDelete, this.onUpdatePrice);

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) return Text('Belum ada jajanan');

    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          Item item = items[index];
          List<Widget> itemInfo = [Text(item.name)];
          TextEditingValue currentPrice;

          if (item.totalPrice != null) {
            itemInfo.add(Text(' @${item.unitPrice}'));
            currentPrice = TextEditingValue(text: item.totalPrice.toString());
          } else {
            currentPrice = TextEditingValue(text: '');
          }

          TextEditingController _controller =
              TextEditingController.fromValue(currentPrice);
          _controller.addListener(() {
            String text = _controller.text;
            if (text == '') {
              onUpdatePrice(index, 0);
              return;
            }
            if (!isNumeric(text)) {
              return;
            }
            onUpdatePrice(index, int.parse(text));
          });

          return Row(
            children: [
              Expanded(child: Row(children: itemInfo)),
              Text('x ${item.quantity.toString()} = '),
              Container(
                  width: 80,
                  child: CupertinoTextField(
                    controller: _controller,
                    placeholder: 'Harga',
                    keyboardType: TextInputType.number,
                  )),
              DeleteButton(() {
                onDelete(index);
              })
            ],
          );
        });
  }
}
