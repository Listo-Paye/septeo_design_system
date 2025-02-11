import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'README',
  type: Accueil,
  path: "",
)
Widget buildReadMeUseCase(BuildContext context) {
  return Accueil();
}

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return MarkdownWithHighlight.fromAsset(
      "${kDebugMode ? "" : "assets/"}markdown/README.md",
    );
  }
}
