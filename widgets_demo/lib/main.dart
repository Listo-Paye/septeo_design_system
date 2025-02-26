import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart' show usePathUrlStrategy;
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_documentation_addon/widgetbook_documentation_addon.dart';

import 'main.directories.g.dart';

void main() {
  usePathUrlStrategy();
  runApp(const HotReload());
}

@widgetbook.App()
class HotReload extends StatelessWidget {
  const HotReload({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> params = Map.fromEntries(
      Uri.base.queryParameters.entries,
    );
    var path = params["path"] ?? 'accueil%2Freadme';
    var knobs = params["knobs"] ?? '{}';
    var device = params["device"] ?? '{name:None}';
    return Widgetbook.material(
      initialRoute: "/?path=$path&knobs=$knobs&device=$device",
      themeMode: ThemeMode.light,
      addons: [
        DocumentationAddon(assetBundle: rootBundle),
        DeviceFrameAddon(
          devices: [
            ...Devices.android.all,
            ...Devices.ios.all,
            Devices.linux.laptop,
            Devices.windows.wideMonitor,
          ],
        ),
      ],
      directories: [...directories],
    );
  }
}
