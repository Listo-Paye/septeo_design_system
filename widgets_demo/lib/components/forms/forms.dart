import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgets_demo/use_case_with_markdown.dart';

WidgetbookCategory formsCategory(BuildContext context) {
  return WidgetbookCategory(name: "Forms", children: [
    WidgetbookComponent(name: "Inputs", useCases: [
      usercaseWithMarkdown(
        "Saisie de texte",
        (context) => Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: TextDynamicInput<String>(
              hintText:
                  context.knobs.string(label: "Libellé", initialValue: "Label"),
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ),
        "markdown/forms_text_input.md",
      ),
      usercaseWithMarkdown(
        "Saisie pourcentage",
        (context) => Percent(),
        "markdown/forms_percent_input.md",
      ),
      usercaseWithMarkdown(
        "Sélection unique",
        (context) => Radios(),
        "markdown/forms_radio.md",
      ),
      usercaseWithMarkdown(
        "Switch",
        (context) => SwitchExample(),
        "markdown/forms_switch.md",
      ),
    ])
  ]);
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
