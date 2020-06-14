import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:snacking_calculator/models/fee_model.dart';
import 'package:snacking_calculator/models/item_model.dart';

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

  int getParticipantNumber() =>
      Set.from(_allocations.map((e) => e.participantName)).length;

  Map<String, int> calculate(List<Item> items, Fee fee) {
    Map<String, int> itemPrices = {
      for (Item item in items) item.name: item.unitPrice
    };

    Map<String, int> result = {
      for (Allocation allocation in _allocations) allocation.participantName: 0
    };

    for (Allocation allocation in _allocations) {
      result[allocation.participantName] =
          result[allocation.participantName] + itemPrices[allocation.itemName];
    }

    for (String participantName in result.keys) {
      result[participantName] = result[participantName] +
          fee.tax +
          fee.tip +
          fee.delivery -
          fee.discount;
    }

    return result;
  }
}

class Allocation {
  final String itemName;
  String participantName;

  Allocation(this.itemName);
}
