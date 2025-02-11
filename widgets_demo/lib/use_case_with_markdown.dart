import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resizable_container/flutter_resizable_container.dart';
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

class UseCaseWithMarkdown extends StatelessWidget {
  final String title;
  final Widget? Function(BuildContext)? builder;
  final String? mdAssetPath;
  const UseCaseWithMarkdown({
    super.key,
    required this.title,
    this.builder,
    this.mdAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    Widget? widget = builder == null ? null : builder!(context);
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ResizableContainer(
          direction: Axis.vertical,
          children: [
            ResizableChild(
              size: const ResizableSize.expand(flex: 2),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      title,
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  widget ?? Container(),
                ],
              ),
            ),
            ResizableChild(
              size: const ResizableSize.expand(flex: 1),
              child: MarkdownWithHighlight.fromAsset(
                "${kDebugMode ? "" : "assets/"}$mdAssetPath",
              ),
              minSize: 100,
            ),
          ],
        ),
        //],
        //),
      ),
    );
  }
}
