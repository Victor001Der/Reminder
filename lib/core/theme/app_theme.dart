import 'package:flutter/material.dart';

class AppColors {
  // --- Акцент (один, сдержанный) ---
  static const accent = Color(0xFF3B5BDB);      // индиго
  static const accentHover = Color(0xFF2F4BC4);

  // --- Светлая тема ---
  static const lightBg = Color(0xFFF7F8FA);     // почти белый, чуть серый
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightBorder = Color(0xFFE5E7EB);
  static const lightText = Color(0xFF111827);
  static const lightTextMuted = Color(0xFF6B7280);

  // --- Тёмная тема ---
  static const darkBg = Color(0xFF0F1115);
  static const darkSurface = Color(0xFF181B21);
  static const darkBorder = Color(0xFF272B33);
  static const darkText = Color(0xFFE5E7EB);
  static const darkTextMuted = Color(0xFF9CA3AF);

  // --- Смысловые ---
  static const danger = Color(0xFFDC2626);      // просрочено
  static const warning = Color(0xFFD97706);     // скоро
  static const success = Color(0xFF059669);     // выполнено
  static const info = Color(0xFF2563EB);
}

class AppTheme {
  // ---------- СВЕТЛАЯ ----------
  static ThemeData get light {
    final scheme = const ColorScheme.light(
      primary: AppColors.accent,
      onPrimary: Colors.white,
      secondary: AppColors.accentHover,
      onSecondary: Colors.white,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
      error: AppColors.danger,
      onError: Colors.white,
      outline: AppColors.lightBorder,
    );

    return _base(
      scheme: scheme,
      background: AppColors.lightBg,
      surface: AppColors.lightSurface,
      border: AppColors.lightBorder,
      text: AppColors.lightText,
      textMuted: AppColors.lightTextMuted,
    );
  }

  // ---------- ТЁМНАЯ ----------
  static ThemeData get dark {
    final scheme = const ColorScheme.dark(
      primary: AppColors.accent,
      onPrimary: Colors.white,
      secondary: AppColors.accentHover,
      onSecondary: Colors.white,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,
      error: AppColors.danger,
      onError: Colors.white,
      outline: AppColors.darkBorder,
    );

    return _base(
      scheme: scheme,
      background: AppColors.darkBg,
      surface: AppColors.darkSurface,
      border: AppColors.darkBorder,
      text: AppColors.darkText,
      textMuted: AppColors.darkTextMuted,
    );
  }

  // ---------- Общая база ----------
  static ThemeData _base({
    required ColorScheme scheme,
    required Color background,
    required Color surface,
    required Color border,
    required Color text,
    required Color textMuted,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,

      // --- Типографика: спокойная, читаемая ---
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: text,
        ),
        titleLarge: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: text,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: text,
        ),
        bodyLarge: TextStyle(fontSize: 15, color: text),
        bodyMedium: TextStyle(fontSize: 14, color: text),
        bodySmall: TextStyle(fontSize: 12, color: textMuted),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
          color: textMuted,
        ),
      ),

      // --- AppBar: плоский, тонкая линия снизу ---
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: text,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: text,
        ),
        shape: Border(
          bottom: BorderSide(color: border, width: 1),
        ),
      ),

      // --- Карточки: плоские, без теней, тонкий бордер ---
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: border),
        ),
      ),

      // --- FAB: круглый, акцентный, небольшая тень ---
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        elevation: 2,
        shape: CircleBorder(),
      ),

      // --- Поля ввода: аккуратные, с фокусом на акцент ---
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: TextStyle(color: textMuted),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
      ),

      // --- Кнопки ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accent,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: text,
          side: BorderSide(color: border),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),

      // --- Чекбокс: круглый, акцентный при выборе ---
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.accent;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        side: BorderSide(color: textMuted, width: 1.5),
        shape: const CircleBorder(),
      ),

      // --- Диалоги ---
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: text,
        ),
        contentTextStyle: TextStyle(fontSize: 14, color: text),
      ),

      // --- Разделители ---
      dividerTheme: DividerThemeData(
        color: border,
        thickness: 1,
        space: 1,
      ),

      // --- Снэкбар ---
      snackBarTheme: SnackBarThemeData(
        backgroundColor: text,
        contentTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),

      // --- Список: компактный, без лишнего ---
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 4,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        iconColor: textMuted,
        titleTextStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: text,
        ),
        subtitleTextStyle: TextStyle(fontSize: 13, color: textMuted),
      ),

      // --- Плавающая навигация (если понадобится) ---
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: AppColors.accent.withOpacity(0.12),
        elevation: 0,
        height: 64,
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: text),
        ),
      ),
    );
  }
}