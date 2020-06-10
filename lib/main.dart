import 'package:flutter/cupertino.dart';
import 'package:snacking_calculator/pages/participants.dart';

void main() => runApp(SnackingCalculator());

class SnackingCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Kalkulator Jajan',
      home: ParticipantScreen(),
    );
  }
}
