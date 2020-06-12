import 'dart:collection';
import 'package:flutter/foundation.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void add(String name) {
    _items.add(Item(name, 1));
    notifyListeners();
  }

  void delete(index) {
    _items.removeAt(index);
    notifyListeners();
  }

  void updateTotalPrice(int index, int price) {
    _items[index].totalPrice = price;
    notifyListeners();
  }

  void updateQuantity(int index, bool isAdd) {
    Item item = _items[index];
    if (item.quantity == 1 && !isAdd) {
      return;
    }

    item.quantity = isAdd ? item.quantity + 1 : item.quantity - 1;
    notifyListeners();
  }
}

class Item {
  String name;
  int quantity;
  int totalPrice;

  Item(this.name, this.quantity);

  int get unitPrice => totalPrice ~/ quantity;
}
