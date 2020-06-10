import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/participant_model.dart';
import 'package:snacking_calculator/pages/item.dart';
import 'package:snacking_calculator/pages/participant.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => ParticipantModel(),
      child: SnackingCalculator(),
    ));

class SnackingCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Kalkulator Jajan',
      initialRoute: '/',
      routes: {
        '/': (context) => ParticipantScreen(),
        '/items': (context) => ItemScreen(),
      },
    );
  }
}
