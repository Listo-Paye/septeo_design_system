import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';
import 'package:flutter_highlighter/themes/atom-one-light.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
//ignore: depend_on_referenced_packages
import 'package:markdown/markdown.dart' as md;
import 'package:url_launcher/url_launcher.dart';

import '../septeo_design_system.dart';

class MarkdownWithHighlight extends StatelessWidget {
  final String markdown;

  const MarkdownWithHighlight({super.key, required this.markdown});

  @override
  Widget build(BuildContext context) {
    return Markdown(
      shrinkWrap: true,
      data: markdown,
      builders: {
        'code': _CodeElementBuilder(),
      },
      styleSheet: MarkdownStyleSheet(
        p: SepteoTextStyles.bodySmallInter,
        strong: SepteoTextStyles.bodySmallInterBold,
        code: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          backgroundColor: Color(0xff282c34),
        ),
        codeblockDecoration: BoxDecoration(
          color: Color(0xff282c34),
          borderRadius: BorderRadius.circular(5.0),
        ),
        checkbox: SepteoTextStyles.bodySmallInterBold,
        h1: SepteoTextStyles.headingMediumInter,
        h2: SepteoTextStyles.bodyLargeInterBold,
        h3: SepteoTextStyles.bodyLargeInter,
        h4: SepteoTextStyles.bodyMediumInterBold,
        h5: SepteoTextStyles.bodyMediumInter,
        h6: SepteoTextStyles.bodySmallInterBold,
        listBullet: SepteoTextStyles.bodySmallInter,
      ),
      onTapLink: (text, url, title) {
        if (url != null) {
          launchUrl(
            Uri.parse(url),
            mode: LaunchMode.platformDefault,
          );
        }
      },
      selectable: true,
    );
  }

  static Widget fromAsset(String assetPath) => assetPath.isNotEmpty
      ? FutureBuilder(
          future: rootBundle.loadString(assetPath),
          builder: (context, snapshot) =>
              MarkdownWithHighlight(markdown: snapshot.data ?? "")
                  .animate()
                  .fade(),
        )
      : MarkdownWithHighlight(markdown: "");
}

class _CodeElementBuilder extends MarkdownElementBuilder {
  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    var language = '';

    if (element.attributes['class'] != null) {
      String lg = element.attributes['class'] as String;
      language = lg.substring(9);
    }
    return HighlightView(
      element.textContent,
      language: language,
      theme: MediaQueryData.fromView(
                      RendererBinding.instance.renderViews.first.flutterView)
                  .platformBrightness ==
              Brightness.light
          ? atomOneLightTheme
          : atomOneDarkTheme,
      padding: const EdgeInsets.all(SepteoSpacings.xs),
      textStyle: preferredStyle ?? GoogleFonts.robotoMono(),
    );
  }
}
