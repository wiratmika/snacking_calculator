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

class NumberPickerButton extends StatelessWidget {
  final bool isAdd;
  final VoidCallback onPressed;

  NumberPickerButton(this.isAdd, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 25,
        child: CupertinoButton(
            padding: const EdgeInsets.all(2),
            child: Icon(
              isAdd ? Icons.add : Icons.remove,
              color: Colors.blue,
              size: 15,
            ),
            onPressed: onPressed));
  }
}

class NavigationButtonSet extends StatelessWidget {
  final String destination;
  final bool enabled;

  NavigationButtonSet(this.destination, this.enabled);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CupertinoButton(
          child: Text('< Kembali'),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        Expanded(
            child: CupertinoButton(
          child: Text('Selanjutnya >'),
          onPressed: enabled
              ? () {
                  Navigator.pushNamed(context, destination);
                }
              : null,
        )),
      ],
    );
  }
}
