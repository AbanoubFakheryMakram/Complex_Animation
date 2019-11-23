

import 'package:flutter/cupertino.dart';

class IndexNotifier with ChangeNotifier {
  var _index = 0;

  int get index => _index;

  set index(value) {
    _index = value;
    notifyListeners();
  }
}