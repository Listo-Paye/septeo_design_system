import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const String inputUseCasePath = 'DSS-Components/form';

@widgetbook.UseCase(
  name: 'Default',
  type: TextDynamicInput,
  path: inputUseCasePath,
  designLink:
      'https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=442-1361&t=jE3Vdd6OYok1n6Cb-4',
)
Widget buildDefaultTextDynamicInputUseCase(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Center(
      child: TextDynamicInput<String>(
        hintText: context.knobs.string(label: "Libellé", initialValue: "Label"),
        onChanged: (value) {
          if (kDebugMode) {
            print(value);
          }
        },
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Percent',
  type: TextDynamicInput,
  path: inputUseCasePath,
)
Widget buildPercentTextDynamicInputUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Percent(),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  type: RadioSelector,
  path: inputUseCasePath,
  designLink:
      'https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=203-275&t=jE3Vdd6OYok1n6Cb-4',
)
Widget buildDefaultRadioSelectorUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Radios(),
  );
}

@widgetbook.UseCase(
  name: 'Default',
  type: OptionSwitch,
  path: inputUseCasePath,
  designLink:
      'https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=203-305&t=jE3Vdd6OYok1n6Cb-4',
)
Widget buildDefaultOptionSwitchUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: SwitchExample(),
  );
}

class Percent extends StatefulWidget {
  const Percent({super.key});

  @override
  State<Percent> createState() => _PercentState();
}

class _PercentState extends State<Percent> {
  double? result;
  String? error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDynamicInput.percent(
                hintText: context.knobs
                    .string(label: "Libellé", initialValue: "Label"),
                errorText: error,
                onChanged: (value) {
                  setState(() {
                    result = value;
                    error = (value ?? 0) > 1
                        ? "La valeur doit être inférieure à 100"
                        : null;
                  });
                }),
            Text("Valeur saisie: $result"),
          ],
        ),
      ),
    );
  }
}

enum RadioValues { first, second, third }

class Radios extends StatefulWidget {
  const Radios({super.key});

  @override
  State<Radios> createState() => _RadiosState();
}

class _RadiosState extends State<Radios> {
  String? result;
  String? error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioSelector(
              enumValues: RadioValues.values,
              initialValue: RadioValues.first,
              onChanged: (value) {
                setState(() {
                  result = value?.name;
                  error = value == RadioValues.third
                      ? "La valeur ne peut pas être la troisième"
                      : null;
                });
              },
              errorText: error,
            ),
            Text("Valeur saisie: $result"),
          ],
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  String result = "";
  String? error;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OptionSwitch(
              label: "Activer",
              initialValue: false,
              onChanged: (value) {
                setState(() {
                  result = value ? "OUI" : "NON";
                });
              },
            ),
            Text("Valeur saisie: $result"),
          ],
        ),
      ),
    );
  }
}
