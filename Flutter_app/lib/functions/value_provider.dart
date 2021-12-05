import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueProvider extends ChangeNotifier {
  bool isUserConnected = false;

  void changeUserStatus() {
    isUserConnected = !isUserConnected;
    notifyListeners();
  }
}
