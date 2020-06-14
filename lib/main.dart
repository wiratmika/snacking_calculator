import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:snacking_calculator/models/allocation_model.dart';
import 'package:snacking_calculator/models/fee_model.dart';
import 'package:snacking_calculator/models/item_model.dart';
import 'package:snacking_calculator/models/participant_model.dart';
import 'package:snacking_calculator/pages/allocation.dart';
import 'package:snacking_calculator/pages/fee.dart';
import 'package:snacking_calculator/pages/item.dart';
import 'package:snacking_calculator/pages/participant.dart';
import 'package:snacking_calculator/pages/summary.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ParticipantModel()),
      ChangeNotifierProvider(create: (context) => ItemModel()),
      ChangeNotifierProvider(create: (context) => FeeModel()),
      ChangeNotifierProvider(create: (context) => AllocationModel())
    ], child: SnackingCalculator()));

class SnackingCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Kalkulator Jajan',
      initialRoute: '/',
      routes: {
        '/': (context) => ParticipantScreen(),
        '/items': (context) => ItemScreen(),
        '/fees': (context) => FeeScreen(),
        '/allocations': (context) => AllocationScreen(),
        '/summary': (context) => SummaryScreen()
      },
    );
  }
}
