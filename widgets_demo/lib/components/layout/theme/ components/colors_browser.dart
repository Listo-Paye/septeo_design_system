import 'package:flutter/material.dart';
import 'package:septeo_design_system/septeo_design_system.dart';

import 'color_row.dart';

class ColorsBrowser extends StatelessWidget {
  const ColorsBrowser({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ColorRow(color: SepteoColors.blue, title: "Blue"),
        ColorRow(color: SepteoColors.orange, title: "Orange"),
        ColorRow(color: SepteoColors.grey, title: "Grey"),
        ColorRow(color: SepteoColors.green, title: "Green"),
        ColorRow(color: SepteoColors.yellow, title: "Yellow"),
        ColorRow(color: SepteoColors.red, title: "Red"),
        ColorRow(color: SepteoColors.purple, title: "Purple"),
      ],
    );
  }
}
