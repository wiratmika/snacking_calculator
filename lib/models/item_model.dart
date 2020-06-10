import 'dart:collection';
import 'package:flutter/foundation.dart';

class ItemModel extends ChangeNotifier {
  final List<String> _items = [];

  UnmodifiableListView<String> get items => UnmodifiableListView(_items);

  void add(String item) {
    _items.add(item);
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

  Item(this.name, this.quantity, this.totalPrice);

  double get unitPrice => totalPrice / quantity;
}
