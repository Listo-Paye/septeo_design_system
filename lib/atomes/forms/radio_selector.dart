import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';

/// A radio selector widget that allows the user to select a value from a list of enum values.
///
/// The widget is a stateful widget that requires an [initialValue] to set the initial value of the selector,
/// a list of [enumValues] to set the values that the user can select, an [onChanged] callback to be called
/// when the user selects a value, a [getLabel] function to get the label of a value, and an [errorText] to
/// display an error message.
///
/// The widget displays a list of radio buttons that the user can select. The radio buttons are displayed
/// in a row and the labels of the values are displayed next to the radio buttons. The selected value is
/// highlighted with a different color. If an error message is provided, it is displayed below the radio
/// buttons.
class RadioSelector<T extends Enum> extends StatefulWidget {
  final T? initialValue;
  final List<T> enumValues;
  final void Function(T?) onChanged;
  final String Function(T)? getLabel;
  final String? errorText;
  const RadioSelector({
    super.key,
    this.initialValue,
    required this.enumValues,
    required this.onChanged,
    this.errorText,
    this.getLabel,
  });

  @override
  State<RadioSelector<T>> createState() => _RadioSelectorState<T>();
}

class _RadioSelectorState<T extends Enum> extends State<RadioSelector<T>> {
  T? selectedValue;
  Color get errorColor => SepteoColors.red.shade900;

  @override
  void initState() {
    selectedValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            for (var value in widget.enumValues)
              Row(
                children: [
                  Radio<T>(
                    value: value,
                    groupValue: selectedValue,
                    fillColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.disabled)) {
                          return SepteoColors.grey.shade400;
                        }
                        if (widget.errorText != null) {
                          return errorColor;
                        }
                        return SepteoColors.blue.shade900;
                      },
                    ),
                    onChanged: (value) {
                      widget.onChanged(value);
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  Text(
                    widget.getLabel?.call(value) ??
                        value.name[0].toUpperCase() + value.name.substring(1),
                    style: SepteoTextStyles.bodyMediumInter.copyWith(
                      color: widget.errorText == null
                          ? SepteoColors.grey.shade900
                          : errorColor,
                    ),
                  ),
                ],
              ),
          ],
        ),
        widget.errorText != null
            ? Text(
                widget.errorText ?? "",
                style: SepteoTextStyles.bodyMediumInter.copyWith(
                  color: errorColor,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
