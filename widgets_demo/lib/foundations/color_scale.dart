import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgets_demo/use_case_with_markdown.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: ColorScale,
  path: 'DSS-Foundations',
  designLink:
      'https://www.figma.com/design/fZEEBhB6gPatiNb9FJU97r/DSS-Foundations?node-id=165-450&t=dU484bldRHVobedF-4',
)
Widget buildCoolButtonUseCase(BuildContext context) {
  return UseCaseWithMarkdown(
    title: "Color Scale",
    builder: (context) => const ColorScale(),
    mdAssetPath: "markdown/theme_main_colors.md",
  );
}

class ColorScale extends StatelessWidget {
  const ColorScale({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 32,
        children: [
          ColorsCategory(
            title: "Grey Scale",
            subTitle:
                "L’échelle de gris se veut neutre afin de mettre en valeur nos couleurs principales. Ici avec un bleu et un orange, le gris tirera légèrement sur le vert pour faire ressortir le bleu et le orange.",
            colors: [
              ColorRow(
                name: "Grey",
                color: SepteoColors.grey,
              ),
            ],
          ),
          ColorsCategory(
            title: "Corp main color",
            subTitle:
                "Sur la base des couleurs de Septeo (fond rose sur l’échelle de couleur, une échelle de couleur a été établie afin de couvrir l’ensemble des cas possible et de permettre le passage a l’échelle.",
            colors: [
              ColorRow(
                name: "BlueS",
                color: SepteoColors.blue,
              ),
              ColorRow(
                name: "Orange",
                color: SepteoColors.orange,
              ),
            ],
          ),
          ColorsCategory(
            title: "Secondary color",
            subTitle:
                "Afin de couvrir l’ensemble des cas d’usage et d’identifier des types d’actions spécifiques, des couleurs supplémentaires sont nécessaires afin de guider au mieux l’utilisateur. ",
            colors: [
              ColorRow(
                name: "Green",
                color: SepteoColors.green,
              ),
              ColorRow(
                name: "Red",
                color: SepteoColors.red,
              ),
              ColorRow(
                name: "Yellow",
                color: SepteoColors.yellow,
              ),
              ColorRow(
                name: "Pruple",
                color: SepteoColors.purple,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorsCategory extends StatelessWidget {
  final String title;
  final String? subTitle;
  final List<ColorRow> colors;
  const ColorsCategory({
    super.key,
    required this.title,
    this.subTitle,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.labelLarge),
        subTitle == null
            ? SizedBox()
            : Text(
                subTitle!,
                style: Theme.of(context).textTheme.labelSmall,
              ),
        ...colors,
      ],
    );
  }
}

class ColorRow extends StatelessWidget {
  final String name;
  final MaterialColor color;
  const ColorRow({
    super.key,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    List<int> keys = color.keys.toList();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 0,
      children: [
        for (var i = 0; i < keys.length; i++) ...[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: color[keys[i]],
                borderRadius: i == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      )
                    : i == keys.length - 1
                        ? const BorderRadius.only(
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          )
                        : null,
              ),
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$name-${keys[i]}",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: color[keys[i]]!.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white)),
                  Text(
                      "#${color[keys[i]]!.value.toRadixString(16).substring(2)}",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: color[keys[i]]!.computeLuminance() > 0.5
                              ? Colors.black
                              : Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}
