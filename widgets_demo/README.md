# widget_demo

## Contributing

Pour contribuer à la démonstration des widgets, vous devez :

Ouvrir un terminal dans votre IDE et lancer la commande

```shell
cd widgets_demo
```

Puis lancer la génbération automatique Widgetbook
```shell
dart run build_runner watch --delete-conflicting-outputs
```

## Documentation

À chaque fois que vous ajouter une démonstration de composant, vous devrez ajouter sa documentation.

Pour cet exemple :

```dart
const String inputUseCasePath = 'DSS-Components/form';

@widgetbook.UseCase(
  name: 'Default',
  type: DSSButton,
  path: inputUseCasePath,
  designLink:
      "https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=1-54",
)
Widget buildLargeDSSButtonUseCase(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: DSSButtonDemo(),
  );
}
```

Vous devez ajouter un fichier markdown
```shell
mkdir ./assets/markdown+dss-components/form/dssbutton
touch ./assets/markdown+dss-components/form/dssbutton/default.md
```

Pour ajouter automatiquement les nouveaux assets au `pubspec.yaml`, vous pouvez utiliser `asset_manager_cli` :

### Installation

```shell
dart pub global activate asset_manager_cli
```

### Utilisation
```shell
asset_manager add
```
