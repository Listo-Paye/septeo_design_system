### Installation

Pour utiliser les fonts rajouter dans votre pubspeck.yaml : 

```yaml
  fonts:
    - family: Inter
      fonts:
        - asset: packages/septeo_design_system/fonts/Inter-Medium.ttf
          weight: 500
        - asset: packages/septeo_design_system/fonts/Inter-Bold.ttf
          weight: 700
```

A l'utilisation il faut passer par la class `SepteoTextStyles` pour utiliser les fonts. 

```dart
Text(
  'Hello World',
  style: SepteoTextStyles.headingLarge,
),
```

On peut faire une copyWith pour changer les propriétés du text. 

```dart
Text(
  'Hello World',
  style: SepteoTextStyles.headingLarge.copyWith(
    color: SepteoColors.blue,
  ),
),
```
