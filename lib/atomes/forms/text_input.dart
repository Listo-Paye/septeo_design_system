import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:septeo_design_system/septeo_design_system.dart';

import 'formatters/decimal_formatter.dart';

/// A text input widget that allows to input text.
///
/// The widget is a wrapper around a [TextField] widget that provides a consistent
/// design and behavior for text inputs.
///
/// The widget is a stateful widget that requires a [hintText] to display a hint
/// text when the input is empty, a list of [formatters] to format the input text,
/// an [initialValue] to set the initial value of the input, a [decoration] to
/// customize the input decoration, an [onChanged] callback to be called when the
/// input value changes, a [keyboardType] to set the keyboard type, a [maxLines]
/// to set the maximum number of lines, and an [enabled] flag to enable or disable
/// the input.
class TextDynamicInput<T> extends StatefulWidget {
  final String hintText;
  final List<TextInputFormatter> formatters;
  final InputDecoration? decoration;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool enabled;
  final TextEditingController? controller;
  final String? errorText;
  const TextDynamicInput({
    super.key,
    required this.hintText,
    this.formatters = const [],
    this.decoration,
    this.initialValue,
    this.onChanged,
    this.keyboardType,
    this.maxLines,
    this.enabled = true,
    this.controller,
    this.errorText,
  }) : assert(
          T == int || T == double || T == String,
          "The type T must be int, double or String",
        );

  @override
  State<TextDynamicInput> createState() => _TextDynamicInputState<T>();

  static TextDynamicInput<double> amount({
    required String hintText,
    double? initialValue,
    ValueChanged<double?>? onChanged,
    bool enabled = true,
    String? errorText,
  }) {
    return TextDynamicInput<double>(
      hintText: hintText,
      initialValue: initialValue,
      onChanged: (value) {
        onChanged?.call(value);
      },
      enabled: enabled,
      formatters: [DecimalFormatter()],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.euro),
        prefixIconColor: SepteoColors.blue.shade900,
      ),
      errorText: errorText,
    );
  }

  static TextDynamicInput<double> percent({
    required String hintText,
    double? initialValue,
    ValueChanged<double?>? onChanged,
    bool enabled = true,
    String? errorText,
  }) {
    return TextDynamicInput<double>(
      hintText: hintText,
      initialValue: _toPercent(initialValue),
      onChanged: (value) {
        if (onChanged == null) return;
        onChanged(_fromPercent(value));
      },
      enabled: enabled,
      formatters: [DecimalFormatter()],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.percent),
        suffixIconColor: SepteoColors.blue.shade900,
      ),
      errorText: errorText,
    );
  }
}

double? _toPercent(double? value) {
  if (value == null) return null;
  final format = NumberFormat.decimalPatternDigits(decimalDigits: 2, locale: 'fr_FR');
  return format.parse(format.format(value * 100)).toDouble();
}

double? _fromPercent(double? value) {
  if (value == null) return null;
  final format = NumberFormat.decimalPatternDigits(decimalDigits: 4, locale: 'fr_FR');
  return format.parse(format.format(value / 100)).toDouble();
}

typedef Parser<T> = T Function(String value);

final Map<Type, Parser> parsers = {
  int: (value) => int.tryParse(value.replaceAll(",", ".").split(".")[0]),
  double: (value) => double.tryParse(value.replaceAll(",", ".")),
  String: (value) => value,
};

class _TextDynamicInputState<T> extends State<TextDynamicInput<T>> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ??
        TextEditingController(
          text: widget.initialValue?.toString() ?? "",
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SepteoColors.grey.shade50,
      child: TextField(
        enabled: widget.enabled,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        decoration: (widget.decoration ?? InputDecoration()).copyWith(
          labelText: widget.hintText,
          errorText: widget.errorText,
          alignLabelWithHint: widget.maxLines != null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: SepteoSpacings.md,
            vertical: SepteoSpacings.xs,
          ),
        ),
        textAlignVertical:
            (widget.maxLines != null) ? TextAlignVertical.top : null,
        inputFormatters: [...widget.formatters],
        controller: _controller,
        onChanged: (value) => widget.onChanged?.call(parsers[T]!(value)),
      ),
    );
  }
}
