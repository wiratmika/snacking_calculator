import 'package:flutter/cupertino.dart';
import 'package:snacking_calculator/models/item_model.dart';

void validateInput(context, input, callback) {
  input = input.trim();

  if (input.length == 0) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Mohon maaf'),
            // TODO Make text dynamic
            content: Text('Nama partisipan tidak boleh kosong'),
            actions: [
              CupertinoDialogAction(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
    return;
  }

  callback(input);
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

int calculateTotalPrice(List<Item> items, discount, tax, tip, delivery) {
  int sum = 0;
  for (Item item in items) {
    sum += item.totalPrice;
  }
  discount ??= 0;
  tax ??= 0;
  tip ??= 0;
  delivery ??= 0;
  return sum + discount + tax + tip + delivery;
}
