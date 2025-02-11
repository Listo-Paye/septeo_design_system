# Utilisation des couleurs

Pour utiliser les couleurs, il faut directement les importer depuis le fichier `SepteoColors` :

```dart
import 'package:septeo_design_system/themes/septeo_colors.dart';

var colorBase = SepteoColors.grey;
```

Chaque couleur est un MaterialColor, vous pouvez donc utiliser les nuances de couleurs directement :

```dart
import 'package:septeo_design_system/themes/septeo_colors.dart';

var colorBase = SepteoColors.blue;
var colorLight = SepteoColors.blue.shade200;
```
