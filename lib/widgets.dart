import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  DeleteButton(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Icon(
          Icons.delete,
          color: Colors.red,
          size: 20,
        ),
        onPressed: onPressed);
  }
}
