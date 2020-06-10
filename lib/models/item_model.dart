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
}

class Item {
  String name;
  int quantity;
  int totalPrice;

  Item(this.name, this.quantity);

  double get unitPrice => totalPrice / quantity;
}
