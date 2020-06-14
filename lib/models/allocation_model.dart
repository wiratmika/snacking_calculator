import 'dart:collection';

import 'package:flutter/foundation.dart';

class AllocationModel extends ChangeNotifier {
  List<Allocation> _allocations = [];

  UnmodifiableListView<Allocation> get allocations =>
      UnmodifiableListView(_allocations);

  String getItemName(int index) => _allocations[index].itemName;

  void addItem(String itemName) {
    _allocations.add(Allocation(itemName));
    notifyListeners();
  }

  void deleteAllItems(String itemName) {
    _allocations =
        _allocations.where((item) => item.itemName != itemName).toList();
    notifyListeners();
  }

  void deleteItem(String itemName) {
    for (Allocation allocation in _allocations) {
      if (allocation.itemName == itemName) {
        _allocations.remove(allocation);
        return;
      }
    }
  }

  void updateItemQuantity(String itemName, bool isAdd) {
    if (isAdd)
      addItem(itemName);
    else
      deleteItem(itemName);
    notifyListeners();
  }

  void allocate(int index, String participantName) {
    _allocations[index].participantName = participantName;
    notifyListeners();
  }

  bool isAllAllocated() {
    for (Allocation allocation in _allocations) {
      if (allocation.participantName == null) {
        return false;
      }
    }
    return true;
  }
}

class Allocation {
  final String itemName;
  String participantName;

  Allocation(this.itemName);
}
