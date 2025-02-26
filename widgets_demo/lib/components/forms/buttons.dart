import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const String inputUseCasePath = 'DSS-Components/form';

@widgetbook.UseCase(
  name: 'Default',
  type: DSSButton,
  path: inputUseCasePath,
  designLink:
      "https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=1-54",
)
Widget buildLargeDSSButtonUseCase(BuildContext context) {
  return Padding(padding: const EdgeInsets.all(40.0), child: DSSButtonDemo());
}

class DSSButtonDemo extends StatelessWidget {
  const DSSButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: SepteoColors.blue.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: LayoutBuilder(
                builder:
                    (context, constraints) => Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        for (final style in DSSButtonStyle.values)
                          constraints.maxWidth > 900
                              ? DSSButtonRow(style: style)
                              : DSSButtonColumn(style: style),
                      ],
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DSSButtonRow extends StatelessWidget {
  final DSSButtonStyle style;
  const DSSButtonRow({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Expanded(
          child: Text(
            style.name.substring(0, 1).toUpperCase() + style.name.substring(1),
            style: SepteoTextStyles.headingSmallInter,
          ),
        ),
        DSSButton(
          label: "Large",
          size: DSSButtonSize.large,
          styleType: style,
          onPressed: () {},
        ),
        DSSButton(
          label: "Medium",
          size: DSSButtonSize.medium,
          styleType: style,
          onPressed: () {},
        ),
        DSSButton(
          label: "Small",
          size: DSSButtonSize.small,
          styleType: style,
          onPressed: () {},
        ),
        DSSButton(
          label: "Large disabled",
          size: DSSButtonSize.large,
          styleType: style,
        ),
        DSSButton(
          label: "Medium disabled",
          size: DSSButtonSize.medium,
          styleType: style,
        ),
        DSSButton(
          label: "Small disabled",
          size: DSSButtonSize.small,
          styleType: style,
        ),
      ],
    );
  }
}

class DSSButtonColumn extends StatelessWidget {
  final DSSButtonStyle style;
  const DSSButtonColumn({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          style.name.substring(0, 1).toUpperCase() + style.name.substring(1),
          style: SepteoTextStyles.headingSmallInter,
        ),
        DSSButton(
          label: "Large",
          size: DSSButtonSize.large,
          styleType: style,
          onPressed: () {},
        ),
        DSSButton(
          label: "Medium",
          size: DSSButtonSize.medium,
          styleType: style,
          onPressed: () {},
        ),
        DSSButton(
          label: "Small",
          size: DSSButtonSize.small,
          styleType: style,
          onPressed: () {},
        ),
        DSSButton(
          label: "Large disabled",
          size: DSSButtonSize.large,
          styleType: style,
        ),
        DSSButton(
          label: "Medium disabled",
          size: DSSButtonSize.medium,
          styleType: style,
        ),
        DSSButton(
          label: "Small disabled",
          size: DSSButtonSize.small,
          styleType: style,
        ),
      ],
    );
  }
}
