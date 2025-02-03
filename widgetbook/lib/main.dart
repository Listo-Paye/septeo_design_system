import 'package:flutter/material.dart';
import 'package:widgetbook/next.dart' as next;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'components.book.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      themeMode: ThemeMode.light,
      directories: components,
      addons: [
        next.MaterialThemeAddon({
          'Dark': ThemeData.dark(),
          'Light': ThemeData.light(),
        }),
        next.DeviceFrameAddon(Devices.all),
        AlignmentAddon(initialAlignment: Alignment.center),
      ],
    );
  }
}
