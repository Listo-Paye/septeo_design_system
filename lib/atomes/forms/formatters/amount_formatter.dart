import 'package:flutter/services.dart';

class AmountFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || newValue.text == oldValue.text) {
      return newValue;
    }
    var text = newValue.text.replaceAll(".", ",");
    if (text.contains(",")) {
      var parts = text.split(",");
      if (parts.length > 2) {
        return oldValue;
      }
      if (parts[1].length > 2) {
        return oldValue;
      }
    }
    var value = double.tryParse(newValue.text.replaceAll(",", "."));
    if (value == null) {
      return oldValue;
    }
    return newValue.copyWith(text: newValue.text.replaceAll(".", ","));
  }
}
