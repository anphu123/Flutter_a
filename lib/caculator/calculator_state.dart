import 'package:flutter/material.dart';
// Lớp này định nghĩa CalculatorState sử dụng ChangeNotifier để quản lý trạng thái
class CalculatorState extends ChangeNotifier {
  double _result = 0;// Lưu kết quả hiện tại
  String _currentValue = '';// Lưu giá trị đầu vào hiện tại
  String _currentOperator = '';// Lưu toán tử hiện tại

  double get result => _result;
  String get currentValue => _currentValue;

  void appendValue(String value) {
    _currentValue += value;
    notifyListeners();
  }

  void setOperator(String operator) {
    if (_currentValue.isNotEmpty) {
      _currentOperator = operator;
      _result = double.parse(_currentValue);
      _currentValue = '';
      notifyListeners();
    }
  }

  void clear() {
    _currentValue = '';
    _currentOperator = '';
    _result = 0;
    notifyListeners();
  }

  void calculateResult() {
    if (_currentValue.isNotEmpty && _currentOperator.isNotEmpty) {
      final double currentValue = double.parse(_currentValue);
      switch (_currentOperator) {
        case '+':
          _result += currentValue;
          break;
        case '-':
          _result -= currentValue;
          break;
        case '*':
          _result *= currentValue;
          break;
        case '/':
          if (currentValue != 0) {
            _result /= currentValue;
          }
          break;
        default:
          break;
      }
      _currentValue = _result.toString();
      _currentOperator = '';
      notifyListeners();
    }
  }
}
