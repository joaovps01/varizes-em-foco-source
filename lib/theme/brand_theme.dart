import 'package:flutter/material.dart';

class BrandColors {
  const BrandColors._();

  static const ink = Color(0xFF16211F);
  static const muted = Color(0xFF5B6F6A);
  static const surface = Color(0xFFF4F8F7);
  static const surfaceWarm = Color(0xFFFFFBF4);
  static const primary = Color(0xFF116A7B);
  static const primaryDark = Color(0xFF0B4052);
  static const mint = Color(0xFFDFF4EF);
  static const blue = Color(0xFFEAF2FF);
  static const amber = Color(0xFFFFF1D6);
  static const border = Color(0xFFD7E4E1);

  static const darkInk = Color(0xFFF4FBF9);
  static const darkMuted = Color(0xFFB8C9C5);
  static const darkSurface = Color(0xFF0E1716);
  static const darkCard = Color(0xFF172321);
  static const darkBorder = Color(0xFF2B403C);
  static const darkMint = Color(0xFF173E3D);
  static const darkBlue = Color(0xFF102B3A);
  static const darkAmber = Color(0xFF3A2A12);

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color text(BuildContext context) => isDark(context) ? darkInk : ink;

  static Color secondaryText(BuildContext context) {
    return isDark(context) ? darkMuted : muted;
  }

  static Color page(BuildContext context) {
    return isDark(context) ? darkSurface : surface;
  }

  static Color card(BuildContext context) {
    return isDark(context) ? darkCard : Colors.white;
  }

  static Color subtleCard(BuildContext context) {
    return isDark(context) ? const Color(0xFF13201E) : surfaceWarm;
  }

  static Color line(BuildContext context) {
    return isDark(context) ? darkBorder : border;
  }

  static Color selected(BuildContext context) {
    return isDark(context) ? darkMint : mint;
  }

  static Color info(BuildContext context) {
    return isDark(context) ? darkBlue : blue;
  }

  static Color warning(BuildContext context) {
    return isDark(context) ? darkAmber : amber;
  }
}

class BrandGradients {
  const BrandGradients._();

  static const hero = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEAF7F4), Color(0xFFF7FBFF), Color(0xFFFFFBF4)],
  );

  static const heroDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0E1716), Color(0xFF10242A), Color(0xFF171A13)],
  );

  static LinearGradient heroFor(BuildContext context) {
    return BrandColors.isDark(context) ? heroDark : hero;
  }
}

class BrandCopy {
  const BrandCopy._();

  static const appName = 'Varizes em Foco';
  static const descriptor = 'Triagem orientativa de varizes';
}

class BrandTheme {
  const BrandTheme._();

  static ThemeData light() => _build(Brightness.light);

  static ThemeData dark() => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: BrandColors.primary,
      brightness: brightness,
    );
    final page = isDark ? BrandColors.darkSurface : BrandColors.surface;
    final text = isDark ? BrandColors.darkInk : BrandColors.ink;
    final border = isDark ? BrandColors.darkBorder : BrandColors.border;

    return ThemeData(
      colorScheme: scheme,
      brightness: brightness,
      scaffoldBackgroundColor: page,
      useMaterial3: true,
      fontFamily: 'Roboto',
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: page,
        foregroundColor: text,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: text,
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(54),
          backgroundColor: isDark
              ? const Color(0xFF7ED4CD)
              : BrandColors.primaryDark,
          foregroundColor: isDark ? const Color(0xFF08201F) : Colors.white,
          disabledBackgroundColor: isDark
              ? const Color(0xFF233330)
              : const Color(0xFFE0E8E6),
          disabledForegroundColor: isDark
              ? const Color(0xFF778B86)
              : const Color(0xFF83938F),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          foregroundColor: isDark
              ? const Color(0xFFBDECE7)
              : BrandColors.primaryDark,
          side: BorderSide(color: border),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: isDark
              ? BrandColors.darkInk
              : BrandColors.primaryDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: isDark ? BrandColors.darkCard : Colors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
