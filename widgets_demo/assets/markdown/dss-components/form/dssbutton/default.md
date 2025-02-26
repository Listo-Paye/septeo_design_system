# DSSButton

Le composant `DSSButton` est un widget personnalisable qui s'intègre au système de design Septeo. Il se base sur le widget Flutter `FilledButton` enveloppé par un `FocusOutlineButtonWrapper`, ce qui lui permet de gérer efficacement les états de survol, de focus et de désactivation tout en proposant différents styles et tailles.

## Fonctionnalités

- **Tailles multiples**  
  Le bouton peut être affiché en trois tailles :
    - `DSSButtonSize.small`
    - `DSSButtonSize.medium` (par défaut)
    - `DSSButtonSize.large`

- **Styles variés**  
  Plusieurs styles sont proposés via l'énumération `DSSButtonStyle` :
    - `primaryMain`
    - `primarySecond`
    - `secondaryMain`
    - `secondarySecond`
    - `linkMain`
    - `linkSecond`  
      Chaque style définit les couleurs de fond, de texte et de bordure selon les états (normal, survolé, focalisé, désactivé).

- **Gestion des états**  
  Le composant ajuste automatiquement ses couleurs et son apparence en fonction des états suivants :
    - Normal
    - Survolé (hovered)
    - Focalisé (focused)
    - Désactivé (disabled)

- **Icônes optionnelles**  
  Vous pouvez ajouter une icône avant et/ou après le label pour enrichir l'interface utilisateur.

- **Personnalisation de la taille**  
  Grâce à la propriété `fixedSize`, il est possible de définir une dimension fixe pour le bouton, indépendamment du contenu ou de la taille choisie.

- **Accessibilité**  
  La présence d'un wrapper `FocusOutlineButtonWrapper` offre une bordure personnalisée lors de la navigation au clavier, améliorant ainsi l’accessibilité.

## Structure et Personnalisation

### Construction du Widget

Le widget est construit autour de deux éléments principaux :
- **FocusOutlineButtonWrapper** : Ce wrapper permet d’ajouter une bordure de focus avec une épaisseur et une couleur définies (`focusWidth` et `focusColor`).
- **FilledButton** : Le bouton lui-même, qui prend en charge l'affichage du label et la gestion des interactions via la propriété `onPressed`.

### Personnalisation du Style

La méthode `_buildButtonStyle()` configure plusieurs aspects visuels :
- **Couleurs**  
  Les couleurs (fond, texte, bordure) sont résolues dynamiquement via la classe privée `_ButtonColors`. Chaque style (`DSSButtonStyle`) est associé à un ensemble de couleurs pour les différents états.
- **TextStyle**  
  La méthode `_getTextStyle()` définit la police et le style du texte en fonction de la taille du bouton.
- **Padding et VisualDensity**  
  Le padding (espace intérieur) est ajusté avec `_getPadding()` selon la taille choisie, tandis que la densité visuelle via `_getDensity()` permet de rendre le bouton plus compact pour les petites tailles.
- **Forme**  
  Le bouton a une bordure arrondie, définie par `SepteoSpacings.xs`, avec une épaisseur fixe de 1 pixel.

### Gestion des États

La classe `_ButtonColors` gère la résolution des couleurs en fonction des états du widget :
- **Background**  
  La méthode `resolveBackgroundColor` retourne la couleur de fond en tenant compte des états désactivé, survolé, focalisé ou normal.
- **Foreground**  
  La méthode `resolveForegroundColor` ajuste la couleur du texte et des icônes selon l’état du bouton.
- **Border**  
  La méthode `resolveBorderColor` permet de définir la couleur de la bordure, avec une valeur par défaut transparente si aucune couleur n’est définie.

## Propriétés du Composant

- **label** (`String`, requis)  
  Le texte qui sera affiché dans le bouton.

- **onPressed** (`VoidCallback?`)  
  La fonction qui sera exécutée lors d’un clic sur le bouton. Si la propriété `disabled` est à `true`, ce callback est ignoré.

- **disabled** (`bool`)  
  Indique si le bouton est désactivé. Par défaut, cette valeur est `false`.

- **size** (`DSSButtonSize`)  
  Définit la taille du bouton. Les options disponibles sont `small`, `medium` (par défaut) et `large`.

- **styleType** (`DSSButtonStyle`)  
  Spécifie le style visuel du bouton, influant sur les couleurs utilisées selon l’état (normal, survolé, etc.). La valeur par défaut est `primaryMain`.

- **beforeIcon** (`Icon?`)  
  Une icône optionnelle qui s’affiche avant le texte du bouton.

- **afterIcon** (`Icon?`)  
  Une icône optionnelle qui s’affiche après le texte du bouton.

- **fixedSize** (`Size?`)  
  Permet de définir une taille fixe pour le bouton, indépendamment des réglages automatiques basés sur le label et la taille.

## Exemple d'Utilisation

Voici un exemple d'intégration du `DSSButton` dans une application Flutter :

```dart
import 'package:flutter/material.dart';
import 'path/to/dss_button.dart';

class ExemplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exemple de DSSButton')),
      body: Center(
        child: DSSButton(
          label: 'Valider',
          onPressed: () {
            // Action à réaliser lors du clic
          },
          size: DSSButtonSize.large,
          styleType: DSSButtonStyle.secondaryMain,
          beforeIcon: Icon(Icons.check),
          afterIcon: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
```

Dans cet exemple, le bouton affiche le texte **Valider**, avec une icône avant (check) et une icône après (flèche vers la droite). Le bouton utilise le style `secondaryMain` et est de taille `large`.
