## Saisie Pourcentage

**Composant :** `TextDynamicInput.percent`

### Fonctionnalités
- Permet la saisie d'un pourcentage.
- Affiche une erreur si le message d'erreur est saisi.
- Mise à jour dynamique de la valeur saisie.

### Exemple d'Utilisation
```dart
TextDynamicInput.percent(
  hintText: "Pourcentage",
  onChanged: (value) {
    if ((value ?? 0) > 1) {
      print("Erreur : La valeur doit être inférieure à 100%");
    }
  },
);
```

### Aperçu dans Widgetbook
```dart
usercaseWithMarkdown(
  "Saisie pourcentage",
  (context) => Percent(), // Utilise le composant réel
  "markdown/forms.md",
);

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
```
