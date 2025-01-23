import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// A [TextInputFormatter] that allows only decimal numbers with two decimal
/// places.
///
/// The formatter replaces the dot character with a comma character and allows
/// only two decimal places.
class DecimalFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || newValue.text == oldValue.text) {
      final text = newValue.text.replaceAll(".", ",");
      final parts = text.split(",");
      if (parts.length == 2 && parts[1].length > 2) {
        newValue.copyWith(
          text: NumberFormat.decimalPatternDigits(
            locale: 'fr_FR',
            decimalDigits: 2,
          ).format(
            double.parse(
              newValue.text.replaceAll(",", "."),
            ),
          ),
        );
      }
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
