## Sélection Unique (Radios)

**Composant :** `RadioSelector`

### Fonctionnalités
- Permet de sélectionner une valeur unique parmi plusieurs options (enum).
- Gestion des erreurs pour certaines options non valides.

### Exemple d'Utilisation
```dart
RadioSelector<RadioValues>(
  enumValues: RadioValues.values,
  initialValue: RadioValues.first,
  onChanged: (value) {
    if (value == RadioValues.third) {
      print("Erreur : La troisième option n'est pas autorisée");
    }
  },
);
```

### Aperçu dans Widgetbook
```dart
usercaseWithMarkdown(
  "Sélection unique",
  (context) => Radios(), // Utilise le composant réel
  "markdown/forms.md",
);

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
```
