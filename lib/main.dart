import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:flex_color_scheme/flex_color_scheme.dart";
import "package:google_fonts/google_fonts.dart";
import "package:infoz/widgets/pages_widgets.dart";
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(450, 800),
    // center: true,
    minimumSize: Size(450, 800),
    maximumSize: Size(450, 800),
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.cyanM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      themeMode: ThemeMode.dark,
      title: "InfoZ",
      initialRoute: "/",
      getPages: Pages,
    );
  }
}
