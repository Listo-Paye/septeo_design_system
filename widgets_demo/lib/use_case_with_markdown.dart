import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:septeo_design_system/septeo_design_system.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookUseCase usercaseWithMarkdown(
  String title,
  Widget? Function(BuildContext)? builder,
  String? mdAssetPath,
) {
  return WidgetbookUseCase(
    name: title,
    builder: (BuildContext context) {
      Widget? widget = builder == null ? null : builder(context);
      return Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                title,
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              widget ?? Container(),
              MarkdownWithHighlight.fromAsset(
                "${kDebugMode ? "" : "assets/"}$mdAssetPath",
              ),
            ],
          ),
        ),
      );
    },
  );
}
