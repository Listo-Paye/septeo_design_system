// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgets_demo/components/forms/inputs.dart' as _i3;
import 'package:widgets_demo/foundations/color_scale.dart' as _i4;
import 'package:widgets_demo/foundations/text_style.dart' as _i5;
import 'package:widgets_demo/readme.dart' as _i2;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookLeafComponent(
    name: 'Accueil',
    useCase: _i1.WidgetbookUseCase(
      name: 'README',
      builder: _i2.buildReadMeUseCase,
    ),
  ),
  _i1.WidgetbookFolder(
    name: 'DSS-Components',
    children: [
      _i1.WidgetbookFolder(
        name: 'form',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'OptionSwitch',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.buildDefaultOptionSwitchUseCase,
              designLink:
                  'https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=203-305&t=jE3Vdd6OYok1n6Cb-4',
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'RadioSelector',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.buildDefaultRadioSelectorUseCase,
              designLink:
                  'https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=203-275&t=jE3Vdd6OYok1n6Cb-4',
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'TextDynamicInput',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i3.buildDefaultTextDynamicInputUseCase,
                designLink:
                    'https://www.figma.com/design/a63JhE1ZLqW81bvCNXKIvL/DSS-Component?node-id=442-1361&t=jE3Vdd6OYok1n6Cb-4',
              ),
              _i1.WidgetbookUseCase(
                name: 'Percent',
                builder: _i3.buildPercentTextDynamicInputUseCase,
              ),
            ],
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'DSS-Foundations',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'ColorScale',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i4.buildCoolButtonUseCase,
          designLink:
              'https://www.figma.com/design/fZEEBhB6gPatiNb9FJU97r/DSS-Foundations?node-id=165-450&t=dU484bldRHVobedF-4',
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TextStyles',
        useCase: _i1.WidgetbookUseCase(
          name: 'Default',
          builder: _i5.buildCoolButtonUseCase,
          designLink:
              'https://www.figma.com/design/fZEEBhB6gPatiNb9FJU97r/DSS-Foundations?node-id=246-1589&t=dU484bldRHVobedF-4',
        ),
      ),
    ],
  ),
];
