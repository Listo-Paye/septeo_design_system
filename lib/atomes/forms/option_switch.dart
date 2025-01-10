import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';

class OptionSwitch extends StatefulWidget {
  final String label;
  final bool initialValue;
  final void Function(bool)? onChanged;
  const OptionSwitch({
    super.key,
    required this.label,
    required this.initialValue,
    this.onChanged,
  });

  @override
  State<OptionSwitch> createState() => _OptionSwitchState();
}

class _OptionSwitchState extends State<OptionSwitch> {
  late bool value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            widget.label,
            style: SepteoTextStyles.bodySmallInter,
          ),
        ),
        Switch(
          value: value,
          activeColor: SepteoColors.grey.shade50,
          activeTrackColor: SepteoColors.blue.shade900,
          inactiveThumbColor: SepteoColors.blue.shade400,
          inactiveTrackColor: SepteoColors.blue.shade50,
          trackOutlineColor: WidgetStateColor.resolveWith(
            (states) {
              if (states.contains(WidgetState.disabled)) {
                return SepteoColors.grey.shade400;
              }
              return value
                  ? SepteoColors.blue.shade900
                  : SepteoColors.blue.shade400;
            },
          ),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
            widget.onChanged?.call(value);
          },
        ),
      ],
    );
  }
}
