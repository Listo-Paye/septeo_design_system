Ces composants permettent de gérer des entrées utilisateur, notamment des champs de texte, des pourcentages, des sélections uniques et des interrupteurs, tout en garantissant une expérience utilisateur cohérente et intuitive. Chaque composant inclut une gestion des erreurs pour une meilleure robustesse.

---

## Saisie de Texte

**Composant :** `TextDynamicInput<String>`

### Fonctionnalités
- Permet à l'utilisateur de saisir du texte.
- Affiche une étiquette personnalisable et prend en charge un message d'erreur.

### Exemple d'Utilisation
```dart
TextDynamicInput<String>(
  hintText: "Entrez du texte",
  onChanged: (value) {
    print("Texte saisi : $value");
  },
);
```

### Aperçu dans Widgetbook
```dart
usercaseWithMarkdown(
  "Saisie de texte",
  (context) => Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: TextDynamicInput<String>(
            hintText: context.knobs
                .string(label: "Libellé", initialValue: "Label"),
            onChanged: (value) {
              print(value);
            },
          ),
        ),
      ),
  "markdown/forms.md",
)
```

---

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

---

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

---

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

## Exemple Complet

Voici un exemple combiné montrant comment utiliser tous les composants ensemble :

```dart
class FormsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemple Forms")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDynamicInput<String>(
              hintText: "Texte",
              onChanged: (value) => print("Texte saisi : $value"),
            ),
            TextDynamicInput.percent(
              hintText: "Pourcentage",
              onChanged: (value) {
                if ((value ?? 0) > 1) {
                  print("Erreur : Valeur > 100%");
                }
              },
            ),
            RadioSelector<RadioValues>(
              enumValues: RadioValues.values,
              initialValue: RadioValues.first,
              onChanged: (value) => print("Valeur sélectionnée : $value"),
            ),
            OptionSwitch(
              label: "Activer",
              initialValue: false,
              onChanged: (value) => print(value ? "OUI" : "NON"),
            ),
          ],
        ),
      ),
    );
  }
}
```
