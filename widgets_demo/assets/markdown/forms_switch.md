## Switch

**Composant :** `OptionSwitch`

### Fonctionnalités
- Permet à l'utilisateur d'activer ou de désactiver une option.
- Affiche dynamiquement le résultat de l'activation.

### Exemple d'Utilisation
```dart
OptionSwitch(
  label: "Activer",
  initialValue: false,
  onChanged: (value) {
    print(value ? "Activé" : "Désactivé");
  },
);
```

### Aperçu dans Widgetbook
```dart
usercaseWithMarkdown(
  "Switch",
  (context) => SwitchExample(), // Utilise le composant réel
  "markdown/forms.md",
);

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
```
