import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';

class RadioSelector<T extends Enum> extends StatefulWidget {
  final T? initialValue;
  final List<T> enumValues;
  final void Function(T?) onChanged;
  final String? errorText;
  const RadioSelector({
    super.key,
    this.initialValue,
    required this.enumValues,
    required this.onChanged,
    this.errorText,
  });

  @override
  State<RadioSelector<T>> createState() => _RadioSelectorState<T>();
}

class _RadioSelectorState<T extends Enum> extends State<RadioSelector<T>> {
  T? selectedValue;
  Color get errorColor => SepteoColors.red.shade900;
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
