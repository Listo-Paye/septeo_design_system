import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'forms/forms.dart';
import 'layout/layout.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    layoutCategory(context),
    formsCategory(context),
  ];
}
