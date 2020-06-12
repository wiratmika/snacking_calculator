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
            child: Consumer<ItemModel>(builder: (context, items, child) {
          return Column(children: [
            ItemsList(items.items, items.delete),
            CupertinoTextField(
                controller: _controller,
                placeholder: 'Tambah jajanan',
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
        })));
  }
}

class ItemsList extends StatelessWidget {
  final List<Item> items;
  final Function(int) onDelete;

  ItemsList(this.items, this.onDelete);

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
          if (item.totalPrice != null) {
            itemInfo.add(Text(' @${item.unitPrice}'));
          }

          return Row(
            children: [
              Expanded(child: Row(children: itemInfo)),
              Text(item.quantity.toString()),
              DeleteButton(() {
                onDelete(index);
              })
            ],
          );
        });
  }
}
