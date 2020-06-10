import 'dart:collection';
import 'package:flutter/foundation.dart';

class ParticipantModel extends ChangeNotifier {
  final List<String> _participants = [];

  UnmodifiableListView<String> get items => UnmodifiableListView(_participants);

  void add(String item) {
    _participants.add(item);
    notifyListeners();
  }

  void delete(index) {
    _participants.removeAt(index);
    notifyListeners();
  }
}
