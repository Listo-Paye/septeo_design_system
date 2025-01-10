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
