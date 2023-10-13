import 'package:flutter/foundation.dart';

class RegistrationProvider with ChangeNotifier {
  String? error;

  void setError(String? message) {
    error = message;
    notifyListeners();
  }
}
