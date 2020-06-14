import 'dart:collection';

import 'package:flutter/foundation.dart';

class AllocationModel extends ChangeNotifier {
  final List<Allocation> _allocations = [];

  UnmodifiableListView<Allocation> get allocations =>
      UnmodifiableListView(_allocations);

  void addItem(String itemName) {
    _allocations.add(Allocation(itemName));
    notifyListeners();
  }

  void deleteItem(String itemName) {
    _allocations.where((item) => item.itemName != itemName);
    notifyListeners();
  }

  void updateItemQuantity(String itemName, bool isAdd) {
    if (isAdd)
      addItem(itemName);
    else
      _allocations.remove(itemName);
    notifyListeners();
  }
}

class Allocation {
  final String itemName;
  String participantName;

  Allocation(this.itemName);
}
