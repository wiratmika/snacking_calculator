import 'dart:collection';
import 'package:flutter/foundation.dart';

class ParticipantModel extends ChangeNotifier {
  final List<String> _participants = [];

  UnmodifiableListView<String> get items => UnmodifiableListView(_participants);

  void add(String participant) {
    if (_participants.contains(participant)) {
      return;
    }
    _participants.add(participant);
    notifyListeners();
  }

  void delete(index) {
    _participants.removeAt(index);
    notifyListeners();
  }
}
