import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'theme/main_theme.dart';

WidgetbookCategory layoutCategory(BuildContext context) {
  return WidgetbookCategory(name: "Layout", children: [
    mainTheme(context),
  ]);
}
