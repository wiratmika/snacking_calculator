import 'package:flutter/cupertino.dart';

void validateInput(context, input, callback) {
  input = input.trim();

  if (input.length == 0) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Mohon maaf'),
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