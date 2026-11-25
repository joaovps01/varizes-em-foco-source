import 'package:flutter/material.dart';

import 'screens/about_screen.dart';
import 'screens/disclaimer_screen.dart';
import 'screens/home_screen.dart';
import 'theme/brand_theme.dart';

class VarizesApp extends StatelessWidget {
  const VarizesApp({super.key});

  static final themeMode = ValueNotifier<ThemeMode>(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          title: BrandCopy.appName,
          debugShowCheckedModeBanner: false,
          theme: BrandTheme.light(),
          darkTheme: BrandTheme.dark(),
          themeMode: mode,
          routes: {
            HomeScreen.routeName: (_) => const HomeScreen(),
            DisclaimerScreen.routeName: (_) => const DisclaimerScreen(),
            AboutScreen.routeName: (_) => const AboutScreen(),
          },
        );
      },
    );
  }
}
