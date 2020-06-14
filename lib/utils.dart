import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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

String formatRupiah(int amount) =>
    NumberFormat.currency(locale: 'id_ID').format(amount);
