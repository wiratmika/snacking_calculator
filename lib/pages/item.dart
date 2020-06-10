import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Daftar Jajanan')),
        child: SafeArea(
            child: Column(children: [
          Text('Ulala'),
          CupertinoButton(
            child: Text('Kembali'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ])));
  }
}
