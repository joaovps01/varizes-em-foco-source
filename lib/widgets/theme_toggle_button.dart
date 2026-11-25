import 'package:flutter/material.dart';

import '../app.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: VarizesApp.themeMode,
      builder: (context, mode, _) {
        final isDark = switch (mode) {
          ThemeMode.dark => true,
          ThemeMode.light => false,
          ThemeMode.system =>
            MediaQuery.platformBrightnessOf(context) == Brightness.dark,
        };

        return IconButton.filledTonal(
          tooltip: isDark ? 'Usar modo claro' : 'Usar modo escuro',
          onPressed: () {
            VarizesApp.themeMode.value = isDark
                ? ThemeMode.light
                : ThemeMode.dark;
          },
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
        );
      },
    );
  }
}
