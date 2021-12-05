import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ValueProvider extends ChangeNotifier {
  bool isUserConnected = false;
  String userMessage = '';
  void changeUserStatus() {
    isUserConnected = !isUserConnected;
    notifyListeners();
  }
}
