import 'package:flutter/foundation.dart';

class FeeModel extends ChangeNotifier {
  int _discount;
  int _tax;
  int _tip;
  int _delivery;

  int get discount => _discount;
  int get tax => _tax;
  int get tip => _tip;
  int get delivery => _delivery;

  set discount(int discount) {
    _discount = discount;
    notifyListeners();
  }

  set tax(int tax) {
    _tax = tax;
    notifyListeners();
  }

  set tip(int tip) {
    _tip = tip;
    notifyListeners();
  }

  set delivery(int delivery) {
    _delivery = delivery;
    notifyListeners();
  }

  int get total {
    discount ??= 0;
    tax ??= 0;
    tip ??= 0;
    delivery ??= 0;

    return tax + tip + delivery - discount;
  }
}
