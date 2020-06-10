import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/item_model.dart';
import 'package:snacking_calculator/utils.dart';

class ItemScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Daftar Jajanan')),
        child: SafeArea(
            child: Consumer<ItemModel>(builder: (context, items, child) {
          return Column(children: [
            CupertinoTextField(
                controller: _controller,
                placeholder: 'Tambah partisipan',
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
